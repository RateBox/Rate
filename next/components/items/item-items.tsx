import React from "react";
import { Item } from "@/types/types";
import Image from "next/image";
import { formatNumber, truncate } from "@/lib/utils";
import { Link } from "next-view-transitions";
import { strapiImage } from "@/lib/strapi/strapiImage";

export const ItemItems = ({
  heading = "Popular",
  sub_heading = "Recently rose to popularity",
  items,
  locale,
}: {
  heading?: string;
  sub_heading?: string;
  items: Item[];
  locale: string
}) => {
  return (
    <div className="py-20">
      <h2 className="text-2xl md:text-4xl font-medium bg-clip-text text-transparent bg-gradient-to-b from-neutral-800 via-white to-white mb-2">
        {heading}
      </h2>
      <p className="text-neutral-500 text-lg mt-4 mb-10">
        {sub_heading}
      </p>
      <div className="grid grid-cols-1 md:grid-cols-3  gap-20">
        {items.map((item) => (
          <ItemItem
            key={"regular-item-item" + item.id}
            item={item}
            locale={locale}
          />
        ))}
      </div>
    </div>
  );
};

const ItemItem = ({ item, locale }: { item: Item, locale: string }) => {
  return (
    <Link href={`/${locale}/items/${item.slug}` as never} className="group relative block">
      <div className="relative border border-neutral-800  rounded-md overflow-hidden">
        <div className="absolute inset-0 bg-gradient-to-b from-transparent via-transparent to-black transition-all duration-200 z-30" />

        <Image
          src={strapiImage(item.thumbnail.url)}
          alt={item.title}
          width={600}
          height={600}
          className="h-full w-full object-cover group-hover:scale-105 transition duration-200"
        />
      </div>

      <div className="mt-8">
        <div className="flex justify-between">
          <span className="text-white text-base font-medium">
            {item.title}
          </span>
          <span className="bg-white text-black shadow-derek text-xs px-2 py-1 rounded-full">
            ${formatNumber(item.minPrice)} - ${formatNumber(item.maxPrice)}
          </span>
        </div>
        <p className="text-neutral-400 text-sm mt-4">
          {truncate(item.description, 100)}
        </p>
      </div>
    </Link>
  );
}; 