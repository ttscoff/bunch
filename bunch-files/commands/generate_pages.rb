#!/usr/bin/env ruby

pages = [
  "Do Not Disturb",
  "Dock",
  "Desktop",
  "Wallpaper",
  "Audio",
  "Notify",
  "Display",
  "Sleep",
  "Awake",
  "Reversing Commands"
]

boilerplate =<<EOBOILER
---
layout: default
title: %%title%%
parent: Commands
grand_parent: Bunch Files
---
# %%title%% Commands

EOBOILER

pages.each do |pg|
  File.open(pg.downcase.gsub(/ /,'-')+'.md','w') do |f|
    f.puts boilerplate.gsub(/%%title%%/, pg)
  end
end
