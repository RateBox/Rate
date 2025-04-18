"use client";
import React, { useState } from "react";
import { Item } from "@/types/types";
import { motion } from "framer-motion";
import Image from "next/image";
import { IconCheck } from "@tabler/icons-react";
import { cn, formatNumber } from "@/lib/utils";
import { strapiImage } from "@/lib/strapi/strapiImage";

export const SingleItem = ({ item }: { item: Item }) => {
  const [activeThumbnail, setActiveThumbnail] = useState(strapiImage(item.thumbnail.url));
  
  return (
    <div className="bg-gradient-to-b from-neutral-900 to-neutral-950  p-4 md:p-10 rounded-md">
      <div className=" grid grid-cols-1 md:grid-cols-2 gap-12">
        <motion.div
          initial={{ x: 50 }}
          animate={{ x: 0 }}
          exit={{ x: 50 }}
          key={activeThumbnail}
          className="rounded-lg relative overflow-hidden"
          transition={{
            type: "spring",
            stiffness: 260,
            damping: 35,
          }}
        >
          <Image
            src={activeThumbnail}
            alt={item.title}
            width={600}
            height={600}
            className="rounded-lg object-cover"
          />
        </motion.div>
        <div className="flex gap-4 justify-center items-center mt-4">
          {item.gallery && item.gallery.map((image, index) => (
            <button
              onClick={() => setActiveThumbnail(strapiImage(image.url))}
              key={"item-image" + index}
              className={cn(
                "h-20 w-20 rounded-xl",
                activeThumbnail === image
                  ? "border-2 border-neutral-200"
                  : "border-2 border-transparent"
              )}
              style={{
                backgroundImage: `url(${strapiImage(image.url)})`,
                backgroundSize: "cover",
                backgroundPosition: "center",
                backgroundRepeat: "no-repeat",
              }}
            ></button>
          ))}
        </div>
      </div>
      <div>
        <h2 className="text-2xl font-semibold mb-4">{item.title}</h2>
        <p className=" mb-6 bg-white text-xs px-4 py-1 rounded-full text-black w-fit">
          ${formatNumber(item.minPrice)} - ${formatNumber(item.maxPrice)}
        </p>
        <p className="text-base font-normal mb-4 text-neutral-400">
          {item.description}
        </p>

        <div className="border-t border-neutral-800 my-6"></div>
        
        <h3 className="text-sm font-medium text-neutral-400 mb-2">
          Category
        </h3>
        <ul className="list-none flex gap-4 flex-wrap">
          <li className="bg-neutral-800 text-sm text-white px-3 py-1 rounded-full font-medium">
            {item.category?.name}
          </li>
        </ul>

        <h3 className="text-sm font-medium text-neutral-400 mb-2 mt-8">
          Reviews
        </h3>
        <ul className="flex gap-4 flex-wrap">
          {item.reviews && item.reviews.map((review, idx) => (
            <li
              key={`review-${idx}`}
              className="bg-neutral-800 text-sm text-white px-3 py-1 rounded-full font-medium"
            >
              {review.rating} stars
            </li>
          ))}
        </ul>
      </div>
    </div>
  );
}; 