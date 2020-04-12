#!/bin/bash
java -Xmx300m -Xss512k -XX:CICompilerCount=2 -Dfile.encoding=UTF-8 ./submissions/"$1"/"$4" < ./submissions/"$1"/input"$2".txt > ./submissions/"$1"/output/output"$2".txt
