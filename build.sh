#!/bin/bash
CHAPTERS=$(ls $2 | cat | sed -e "s/.*/chapters\/&/")

case $1 in
    pdf)
        pandoc -s -f markdown-fancy_lists \
            --table-of-contents \
            --number-sections \
            --pdf-engine=xelatex \
            --highlight-style=monochrome \
            --metadata-file=metadata-pdf.md \
            --file-scope \
            latex-tweaks.yaml \
            -o build/$3 \
            $CHAPTERS
    ;;

    pdf-small)
        pandoc -s -f markdown-fancy_lists \
            --table-of-contents \
            --number-sections \
            --pdf-engine=xelatex \
            --highlight-style=monochrome \
            --metadata-file=metadata-pdf-small.md \
            --file-scope \
            latex-tweaks.yaml \
            -o build/$3 \
            $CHAPTERS
    ;;

    epub)
        pandoc -s -f markdown-fancy_lists \
            --number-sections \
            --highlight-style=monochrome \
            --metadata-file=metadata-epub.md \
            --file-scope \
            --epub-embed-font=/usr/local/share/fonts/*.ttf \
            --css=epub.css \
            -o build/$3 \
            $CHAPTERS
    ;;

    azw3)
        ebook-convert build/$4 build/$3
    ;;

    docx)
    	pandoc -s -f markdown-fancy_lists \
            --number-sections \
            --highlight-style=monochrome \
            --metadata-file=metadata.md \
            --file-scope \
            -o build/$3 \
            $CHAPTERS
    ;;

    html)
    	pandoc -s -f markdown-fancy_lists --toc \
            --embed-resources --standalone \
            --number-sections \
            --highlight-style=monochrome \
            --metadata-file=metadata.md \
            --metadata title="The Cassiopaea Session Transcripts" \
            --file-scope \
            -o build/$3 \
            $CHAPTERS
    ;;

    *)
        echo "Invalid argument: $1"
        exit 1
    ;;
esac