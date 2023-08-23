This repository contains Cassiopaea Experiment Transcripts scraped from the website and converted to Markdown format. I don't have any rights to the material.

All sessions are located in the `chapters` folder.

In order to compile documents, one can use Docker and just simply run:
```
./build-all-docker.sh
```
This will build the Pandoc Docker image with LaTeX and Calibre, and then build the documents and place them in the `build` folder.

In case if not using Docker, make sure that you have Calibre and TeX Live with `fontaxes` and `spectral` packages installed to automatically install missing LaTeX packages.
```
make all
```