all: pdf pdf-small epub azw3 docx html pdf-fr pdf-small-fr epub-fr azw3-fr docx-fr html-fr latex

pdf-small:
	./build.sh pdf-small chapters

pdf:
	./build.sh pdf chapters

epub:
	./build.sh epub chapters

azw3: epub
	./build.sh azw3 chapters

docx:
	./build.sh docx chapters

html:
	./build.sh html chapters

pdf-small-fr:
	./build.sh pdf-small chapters-fr -fr

pdf-fr:
	./build.sh pdf chapters-fr -fr

epub-fr:
	./build.sh epub chapters-fr -fr

azw3-fr: epub
	./build.sh azw3 chapters-fr -fr

docx-fr:
	./build.sh docx chapters-fr -fr

html-fr:
	./build.sh html chapters-fr -fr

latex:
	./build.sh latex chapters
