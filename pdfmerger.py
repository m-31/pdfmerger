#!/usr/bin/env python
# pdf_merger2.py

import sys
from PyPDF2 import PdfFileMerger


def merger(output_path, input_paths):
    pdf_merger = PdfFileMerger()
    file_handles = []

    for path in input_paths:
        pdf_merger.append(path)

    with open(output_path, 'wb') as fileobj:
        pdf_merger.write(fileobj)


if __name__ == '__main__':
    paths = sys.argv[1:]
    print("merging:")
    print(paths)
    merger('merged.pdf', paths)
