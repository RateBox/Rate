"use client";
import React from "react";
import { IconContainer } from "../icon-container";
import {
  FacebookIcon,
  InstagramIcon,
  LinkedInIcon,
  MetaIcon,
  SlackIcon,
  TiktokIcon,
  TwitterIcon,
} from "@/components/icons/illustrations";

export const SkeletonOne = () => {
  return (
    <div className="relative flex py-8 px-2 gap-10 h-full">
      <div className="w-full p-5 mx-auto bg-white dark:bg-neutral-900 shadow-2xl group h-full">
        <div className="flex flex-1 w-full h-full flex-col space-y-2">
          {/* Globe placeholder - simple gradient sphere */}
          <div className="h-[300px] w-[300px] md:w-[600px] md:h-[600px] mx-auto flex items-center justify-center">
            <div className="w-48 h-48 md:w-80 md:h-80 rounded-full bg-gradient-to-br from-blue-500 via-purple-600 to-indigo-700 flex items-center justify-center shadow-2xl">
              <div className="w-40 h-40 md:w-72 md:h-72 rounded-full bg-gradient-to-tr from-blue-400/30 to-purple-500/30 flex items-center justify-center">
                <div className="text-white text-lg md:text-2xl font-bold text-center">
                  🌍<br />
                  <span className="text-sm md:text-lg">Global Network</span>
                </div>
              </div>
            </div>
          </div>
          
          <div className="flex flex-row flex-shrink-0 gap-2">
            <IconContainer>
              <FacebookIcon />
            </IconContainer>
            <IconContainer>
              <TwitterIcon />
            </IconContainer>
            <IconContainer>
              <InstagramIcon />
            </IconContainer>
            <IconContainer>
              <LinkedInIcon />
            </IconContainer>
            <IconContainer>
              <SlackIcon />
            </IconContainer>
            <IconContainer>
              <TiktokIcon />
            </IconContainer>
            <IconContainer>
              <MetaIcon />
            </IconContainer>
          </div>
        </div>
      </div>
    </div>
  );
};
