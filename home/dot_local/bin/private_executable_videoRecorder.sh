#!/bin/bash

# Video and Audio
# ffmpeg -i /dev/video0 -f alsa -i hw:0 gaming.mkv

# Screen grab plus voice
ffmpeg -f x11grab -s 2256x1504 -i :0.0 -f alsa -i hw:0 out.mkv
