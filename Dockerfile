FROM pandoc/latex:2.19.2.0-ubuntu

ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install --yes calibre make texlive-extra-utils

COPY . /book/
WORKDIR /book

ENTRYPOINT ["/bin/bash", "-c"]
CMD ["make"]