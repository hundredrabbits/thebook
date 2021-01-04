# North Pacific Logbook

## Missing cover image

```
cover-image: cover.pdf
```

## Making a PDF

```
~/Applications/pandoc --variable=geometry:a5paper north_pacific_logbook.md --pdf-engine=xelatex --from markdown+simple_tables+line_blocks -o north_pacific_logbook.pdf
```

## Making an epub

```
~/Applications/pandoc north_pacific_logbook.md --from markdown+simple_tables+line_blocks -w epub -o north_pacific_logbook.epub
```
