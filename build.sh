#!/bin/bash

~/Applications/pandoc --variable=geometry:a5paper north_pacific_logbook.md --pdf-engine=xelatex --from markdown+simple_tables+line_blocks -o north_pacific_logbook.pdf

# ~/Applications/pandoc north_pacific_logbook.md --from markdown+simple_tables+line_blocks -w epub -o north_pacific_logbook.epub

# ~/Applications/pandoc north_pacific_logbook.md --from markdown+simple_tables+line_blocks --toc -V toc-title:"Table of Contents" --toc-depth=2 --epub-metadata=title.txt --epub-cover-image=img/cover.jpg -w epub -o busy_doing_nothing.epub

~/Applications/pandoc north_pacific_logbook.md --from markdown+simple_tables+line_blocks --toc -V toc-title:"Table of Contents" --toc-depth=2 --epub-metadata=title.txt -epub-cover-image=img/cover.jpg --css epub.css -w epub -o busy_doing_nothing.epub
