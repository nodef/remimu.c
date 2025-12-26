#!/usr/bin/env bash
# Fetch the latest version of the library
fetch() {
if [ -f "remimu.h" ]; then return; fi
URL="https://github.com/wareya/Remimu/raw/refs/heads/main/remimu.h"
FILE="remimu.h"

# Download the release
echo "Downloading $FILE from $URL ..."
curl -L "$URL" -o "$FILE"
echo ""
}


# Test the project
test() {
echo "Running 01-hello-world.c ..."
clang -I. -o 01.exe examples/01-hello-world.c  && ./01.exe && echo -e "\n"
}


# Main script
if [[ "$1" == "test" ]]; then test
elif [[ "$1" == "fetch" ]]; then fetch
else echo "Usage: $0 {fetch|test}"; fi
