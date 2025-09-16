FROM python:3.13
WORKDIR /usr/local/jumpstart

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY jumpstart jumpstart

EXPOSE 5000

RUN useradd jumpstart
RUN chown jumpstart /usr/local/jumpstart
RUN mkdir -p /usr/local/var
RUN chown jumpstart:jumpstart /usr/local/var
USER jumpstart

CMD ["gunicorn", "jumpstart:app"]