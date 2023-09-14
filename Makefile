CHAPTERS := $(shell ls chapters/ | cat | sed -e "s/.*/chapters\/&/")

all: pdf pdf-small epub azw3 docx html

pdf-small:
	./build.sh pdf-small chapters sessions-small.pdf

pdf:
	./build.sh pdf chapters sessions.pdf

epub:
	./build.sh epub chapters sessions.epub

azw3: epub
	./build.sh azw3 chapters sessions.azw3

docx:
	./build.sh docx chapters sessions.docx

html:
	./build.sh html chapters sessions.html