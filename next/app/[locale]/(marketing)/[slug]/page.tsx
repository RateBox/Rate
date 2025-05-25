import { Metadata } from 'next';
import PageContent from '@/lib/shared/PageContent';
import fetchContentType from '@/lib/strapi/fetchContentType';
import { generateMetadataObject } from '@/lib/shared/metadata';
import ClientSlugHandler from '../ClientSlugHandler';

export async function generateMetadata({ params }: { params: Promise<{ locale: string; slug: string }> }): Promise<Metadata> {
  const { locale, slug } = await params;
  const pageData = await fetchContentType(
    "pages",
    {
      filters: {
        slug,
        locale,
      },
      populate: "seo.metaImage",
    },
    true,
  );
  const seo = pageData?.seo;
  const metadata = generateMetadataObject(seo);
  return metadata;
}

export default async function Page({ params }: { params: Promise<{ locale: string, slug: string }> }) {
  const { locale, slug } = await params;
  const pageData = await fetchContentType(
    "pages",
    {
      filters: {
        slug,
        locale,
      },
    },
    true,
  );

  const localizedSlugs = pageData?.localizations
    ? pageData.localizations.reduce(
        (acc: Record<string, string>, localization: any) => {
          acc[localization.locale] = localization.slug;
          return acc;
        },
        { [locale]: slug }
      )
    : { [locale]: slug };

  return (
    <>
      <ClientSlugHandler localizedSlugs={localizedSlugs} />
      <PageContent pageData={pageData} />
    </>
  );
}