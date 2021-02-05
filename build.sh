#!/bin/bash

~/Applications/pandoc --variable=geometry:a5paper north_pacific_logbook.md --pdf-engine=xelatex --from markdown+simple_tables+line_blocks -o north_pacific_logbook.pdf

~/Applications/pandoc north_pacific_logbook.md --from markdown+simple_tables+line_blocks -w epub -o north_pacific_logbook.epub
