#!/bin/bash

CURRENTWINDOW="hyprctl activeworkspace -j | jq '.id'"
echo $(CURRENTWINDOW)
