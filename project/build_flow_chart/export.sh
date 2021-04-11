#!/bin/sh

/Applications/draw.io.app/Contents/MacOS/draw.io -x -f svg *.drawio
/Applications/draw.io.app/Contents/MacOS/draw.io -x -f png -t *.drawio
/Applications/draw.io.app/Contents/MacOS/draw.io -x -f jpg *.drawio
