import { Metadata } from 'next';

import { AmbientColor } from "@/components/decorations/ambient-color";
import { Container } from "@/components/container";
import { FeatureIconContainer } from "@/components/dynamic-zone/features/feature-icon-container";
import { Heading } from "@/components/elements/heading";
import { Featured } from "@/components/items/featured";
import { ItemItems } from "@/components/items/item-items";
import { Subheading } from "@/components/elements/subheading";
import { IconShoppingCartUp } from "@tabler/icons-react";
import fetchContentType from "@/lib/strapi/fetchContentType";
import { generateMetadataObject } from '@/lib/shared/metadata';

import ClientSlugHandler from '../ClientSlugHandler';

export async function generateMetadata({
  params,
}: {
  params: { locale: string };
}): Promise<Metadata> {

  const pageData = await fetchContentType("item-page", {
    filters: {
      locale: params.locale,
    },
    populate: "seo.metaImage",
  }, true)

  const seo = pageData?.seo;
  const metadata = generateMetadataObject(seo);
  return metadata;
}

export default async function Items({
  params,
}: {
  params: { locale: string };
}) {

  // Fetch the item-page and items data
  const itemPage = await fetchContentType('item-page', {
    filters: {
      locale: params.locale,
    },
  }, true);
  const items = await fetchContentType('items');

  const localizedSlugs = itemPage.localizations?.reduce(
    (acc: Record<string, string>, localization: any) => {
      acc[localization.locale] = "items";
      return acc;
    },
    { [params.locale]: "items" }
  );
  const featured = items?.data.filter((item: { featured: boolean }) => item.featured);

  return (
    <div className="relative overflow-hidden w-full">
      <ClientSlugHandler localizedSlugs={localizedSlugs} />
      <AmbientColor />
      <Container className="pt-40 pb-40">
        <FeatureIconContainer className="flex justify-center items-center overflow-hidden">
          <IconShoppingCartUp className="h-6 w-6 text-white" />
        </FeatureIconContainer>
        <Heading as="h1" className="pt-4">
          {itemPage.heading}
        </Heading>
        <Subheading className="max-w-3xl mx-auto">
          {itemPage.sub_heading}
        </Subheading>
        <Featured items={featured} locale={params.locale} />
        <ItemItems items={items?.data} locale={params.locale} />
      </Container>
    </div>
  );
} 