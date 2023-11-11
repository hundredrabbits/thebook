# North Pacific Logbook

This repository is no longer updated(since 2021.10.09), see the new [location of the project](https://git.sr.ht/~rabbits/busydoingnothing).

Building the logbook requires Pandoc and Calibre.

## Missing cover image

```
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
rm -f assembled.md
rm -f cover.pdf
```
# Licenses

Busy Doing Nothing's source code (to build a book) is licensed under [MIT](https://github.com/hundredrabbits/thebook/blob/master/LICENSE) and the **images, text and assets** are licensed under [BY-NC-SA 4.0](https://github.com/hundredrabbits/thebook/blob/master/LICENSE.by-nc-sa-4.0.md). View individual licenses for details.
