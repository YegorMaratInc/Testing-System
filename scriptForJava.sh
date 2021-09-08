#!/bin/bash
# shellcheck disable=SC2164
cd submissions/"$1"
java Main >output/output"$2".txt <input"$2".txt -Xmx300m -Xss512k -XX:CICompilerCount=2 -Dfile.encoding=UTF-8
