FROM d1993f2/pandoc:latest

COPY . /book/
WORKDIR /book

COPY fonts/* /usr/local/share/fonts/

RUN fc-cache -fv

ENTRYPOINT ["/bin/bash", "-c"]
CMD ["make"]