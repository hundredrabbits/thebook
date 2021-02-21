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

# Cleanup
rm -f busy-doing-nothing.pdf
rm -f busy-doing-nothing.epub
rm -f busy-doing-nothing.mobi
rm -f assembled.md
rm -f cover.pdf

mv assembled.pdf busy-doing-nothing.pdf
mv assembled.epub busy-doing-nothing.epub
mv assembled.mobi busy-doing-nothing.mobi

~/Applications/butler push busy-doing-nothing.pdf hundredrabbits/busy-doing-nothing:pdf
~/Applications/butler push busy-doing-nothing.epub hundredrabbits/busy-doing-nothing:epub
~/Applications/butler push busy-doing-nothing.mobi hundredrabbits/busy-doing-nothing:mobi
