#!/bin/bash
CHAPTERS=$(ls $2 | cat | sed -e "s/.*/chapters$3\/&/")

case $1 in
    pdf)
        pandoc -s -f markdown-fancy_lists \
            --table-of-contents \
            --number-sections \
            --pdf-engine=xelatex \
            --highlight-style=monochrome \
            --metadata-file=metadata-pdf$3.md \
            --file-scope \
            latex-tweaks.yaml \
            -o build/sessions$3.pdf \
            $CHAPTERS
    ;;

    pdf-small)
        pandoc -s -f markdown-fancy_lists \
            --table-of-contents \
            --number-sections \
            --pdf-engine=xelatex \
            --highlight-style=monochrome \
            --metadata-file=metadata-pdf-small$3.md \
            --file-scope \
            latex-tweaks.yaml \
            -o build/sessions-small$3.pdf \
            $CHAPTERS
    ;;

    epub)
        pandoc -s -f markdown-fancy_lists \
            --number-sections \
            --highlight-style=monochrome \
            --metadata-file=metadata-epub$3.md \
            --file-scope \
            --epub-embed-font=/usr/local/share/fonts/*.ttf \
            --css=epub.css \
            -o build/sessions$3.epub \
            $CHAPTERS
    ;;

    azw3)
        ebook-convert build/sessions$3.epub build/sessions$3.azw3
    ;;

    docx)
    	pandoc -s -f markdown-fancy_lists \
            --number-sections \
            --highlight-style=monochrome \
            --metadata-file=metadata$3.md \
            --file-scope \
            -o build/sessions$3.docx \
            $CHAPTERS
    ;;

    html)
    	pandoc -s -f markdown-fancy_lists --toc \
            --embed-resources --standalone \
            --number-sections \
            --highlight-style=monochrome \
            --metadata-file=metadata$3.md \
            --metadata title="The Cassiopaea Session Transcripts" \
            --file-scope \
            -o build/sessions$3.html \
            $CHAPTERS
    ;;

    *)
        echo "Invalid argument: $1"
        exit 1
    ;;
esac