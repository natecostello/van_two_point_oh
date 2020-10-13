#!/bin/zsh

magick 'large_source_images/*.png[170x170]' \
-set filename:original %t \
-set filename:mysize "%wx%h" \
'scaled_source_images/%[filename:original].png'
