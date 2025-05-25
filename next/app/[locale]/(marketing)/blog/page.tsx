import { type Metadata } from "next";

import { Container } from "@/components/container";
import { Heading } from "@/components/elements/heading";
import { Subheading } from "@/components/elements/subheading";
import { BlogCard } from "@/components/blog-card";
import { FeatureIconContainer } from "@/components/dynamic-zone/features/feature-icon-container";
import { IconClipboardText } from "@tabler/icons-react";
import { BlogPostRows } from "@/components/blog-post-rows";
import { AmbientColor } from "@/components/decorations/ambient-color";
import fetchContentType from "@/lib/strapi/fetchContentType";
import { Article } from "@/types/types";
import { generateMetadataObject } from '@/lib/shared/metadata';

import ClientSlugHandler from "../ClientSlugHandler";

export async function generateMetadata({ params }: { params: Promise<{ locale: string }> }): Promise<Metadata> {
  const { locale } = await params;
  const pageData = await fetchContentType('blog-page', {
    filters: { locale },
    populate: "seo.metaImage",
  }, true)

  const seo = pageData?.seo;
  const metadata = generateMetadataObject(seo);
  return metadata;
}

export default async function Blog({ params }: { params: Promise<{ locale: string, slug: string }> }) {
  const { locale } = await params;
  const blogPage = await fetchContentType('blog-page', {
    filters: { locale },
  }, true)
  const articles = await fetchContentType('articles', {
    filters: { locale },
  }, false)

  const localizedSlugs = blogPage.localizations?.reduce(
    (acc: Record<string, string>, localization: any) => {
      acc[localization.locale] = "blog";
      return acc;
    },
    { [locale]: "blog" }
  );

  return (
    <div className="relative overflow-hidden py-20 md:py-0">
      <ClientSlugHandler localizedSlugs={localizedSlugs} />
      <AmbientColor />
      <Container className="flex flex-col items-center justify-between pb-20">
        <div className="relative z-20 py-10 md:pt-40">
          <FeatureIconContainer className="flex justify-center items-center overflow-hidden">
            <IconClipboardText className="h-6 w-6 text-white" />
          </FeatureIconContainer>
          <Heading as="h1" className="mt-4">
            {blogPage.heading}
          </Heading>
          <Subheading className="max-w-3xl mx-auto">
            {blogPage.sub_heading}
          </Subheading>
        </div>

        {articles.data.slice(0, 1).map((article: Article) => (
          <BlogCard article={article} locale={locale} key={article.title} />
        ))}

        <BlogPostRows articles={articles.data} />
      </Container>
    </div>
  );
}
