FROM python:3.7-alpine

ADD . /app/

# Install requirements, give permissions and run cron
RUN pip install -r /app/requirements.txt && \
    chmod 755 /app/update-dynamic-dns.py /app/entrypoint.sh && \
    /usr/bin/crontab /app/crontab.txt

CMD [ "/app/entrypoint.sh" ]
