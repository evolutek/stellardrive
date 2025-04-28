#!/bin/bash

set -e

if [ -z "$1" ]; then
  echo "Usage: $0 <directory>"
  exit 1
fi

find "$1" -type f \( -name "*.ads" -o -name "*.adb" \) | while read -r file; do
  sed -i 's/STM32_SVD\.UInt/HAL.UInt/g' "$file"
  sed -i 's/STM32_SVD\.Byte/HAL.UInt8/g' "$file"
  #sed -i 's/STM32_SVD\.Bit/HAL.Bit/g' "$file"
  sed -i 's/STM32_SVD\.Bit := 16#0#/Boolean := False/g' "$file"
  sed -i 's/STM32_SVD\.Bit := 16#1#/Boolean := True/g' "$file"
  sed -i 's/STM32_SVD\.Bit/Boolean/g' "$file"
  sed -i '/^\s*with System;/s/^.*$/with HAL;\
with System;/' "$file"
done
