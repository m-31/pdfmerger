FROM python:3.7-slim-buster
MAINTAINER Michael Meyling <search@meyling.com>
RUN pip install pypdf2
ENTRYPOINT ["/pdfmerger.py"]
ADD pdfmerger.py /pdfmerger.py
RUN chmod +x /pdfmerger.py
