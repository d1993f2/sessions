FROM d1993f2/pandoc:latest

COPY . /book/
WORKDIR /book

ENTRYPOINT ["/bin/bash", "-c"]
CMD ["make"]