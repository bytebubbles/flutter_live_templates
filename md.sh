#!/bin/sh
# Copyright 2016, The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ==============================================================================

# 生成markdown格式的模板列表
for file in `ls -1 8591*.xml`; do
  echo
  echo "### $file"
  cat $file | \
    grep "template name" | \
    sed s/"^.*<template name=\""/"- \*\*\`"/ | \
    sed s/" toReformat.*$"// | \
    sed s/"\".*description="/"\`\*\*: "/ | \
    sort
done
