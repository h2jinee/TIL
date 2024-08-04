#!/bin/bash

# 파일 확장자 및 접미사 정의
suffix="TIL.md"

for i in {1..9}
do
  old_name="${i}일차 ${suffix}"
  new_name=$(printf "%02d일차 %s" $i "${suffix}")
  if [ -e "$old_name" ]; then
    git mv "$old_name" "$new_name"
  fi
done

