CHAPTERS := $(shell ls chapters/ | cat | sed -e "s/.*/chapters\/&/")

all: pdf pdf-small epub azw3 docx html

pdf-small:
	pandoc -s -f markdown-fancy_lists \
		--table-of-contents \
		--number-sections \
		--pdf-engine=$(shell pwd)/xelatex \
		--highlight-style=monochrome \
		--metadata-file=metadata-pdf-small.md \
		--file-scope \
		latex-tweaks.yaml \
		-o build/sessions-small.pdf \
		$(CHAPTERS)

pdf:
	pandoc -s -f markdown-fancy_lists \
		--table-of-contents \
		--number-sections \
		--pdf-engine=$(shell pwd)/xelatex \
		--highlight-style=monochrome \
		--metadata-file=metadata-pdf.md \
		--file-scope \
		latex-tweaks.yaml \
		-o build/sessions.pdf \
		$(CHAPTERS)

epub:
	pandoc -s -f markdown-fancy_lists \
		--number-sections \
		--highlight-style=monochrome \
		--metadata-file=metadata-epub.md \
		--file-scope \
		-o build/sessions.epub \
		$(CHAPTERS)

azw3: epub
	ebook-convert build/sessions.epub build/sessions.azw3

docx:
	pandoc -s -f markdown-fancy_lists \
		--number-sections \
		--highlight-style=monochrome \
		--metadata-file=metadata.md \
		--file-scope \
		-o build/sessions.docx \
		$(CHAPTERS)

html:
	pandoc -s -f markdown-fancy_lists --toc \
		--embed-resources --standalone \
		--number-sections \
		--highlight-style=monochrome \
		--metadata-file=metadata.md \
		--metadata title="The Cassiopaea Session Transcripts" \
		--file-scope \
		-o build/sessions.html \
		$(CHAPTERS)