FROM ubuntu:14.04
RUN sudo apt-get update && sudo apt-get -y install pandoc python2.7 python-pip python-dev gcc libxml2 libxml2-dev libxslt1.1 libxslt1-dev python-libxml2 zlib1g-dev lib32z1-dev texlive-latex-base texlive-xetex latex-xcolor texlive-math-extra texlive-latex-extra texlive-fonts-extra curl wget git fontconfig make gunicorn
WORKDIR /app
COPY app /app
RUN chown -R www-data.www-data /app/uploads /app/downloads
RUN easy_install -U setuptools
RUN sudo pip install -r requirements.txt
USER www-data
EXPOSE 8000
# CMD ["python", "vue2doc.py"]
CMD ["/usr/bin/gunicorn", "-c", "gunicorn_config.py", "vue2doc:app"]
