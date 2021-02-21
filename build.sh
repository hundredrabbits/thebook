#!/bin/bash

# Add metadata to header
rm -f assembled.md
cat metadata.yaml north_pacific_logbook.md > assembled.md

# Build pdf
rm -f assembled.pdf
convert img/cover.jpg cover.pdf
~/Applications/pandoc --variable=geometry:a5paper north_pacific_logbook.md --pdf-engine=xelatex --from markdown+simple_tables+line_blocks -o north_pacific_logbook.pdf
pdfunite cover.pdf north_pacific_logbook.pdf assembled.pdf

# Build epub
~/Applications/pandoc assembled.md --from markdown+simple_tables+line_blocks --toc -V toc-title:"Table of Contents" --toc-depth=2 --epub-metadata=metadata.yaml --epub-cover-image=img/cover.jpg --css epub.css -w epub -o assembled.epub

# Build mobi
ebook-convert "assembled.epub" "assembled.mobi"
