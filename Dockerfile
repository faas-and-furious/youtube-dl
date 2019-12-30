FROM openfaas/classic-watchdog:0.18.10 as watchdog
FROM alpine:3.11

LABEL maintainer="https://github.com/hijak"

COPY --from=watchdog /fwatchdog /usr/bin/fwatchdog

RUN apk add --update --no-cache py-pip bash ca-certificates supervisor

COPY ./requirements.txt /code/requirements.txt
WORKDIR /code
RUN pip install pur
RUN pur -r requirements.txt
RUN pip install -r requirements.txt

COPY app.conf /etc/supervisor/conf.d/app.conf

#Runs every Sunday
RUN echo "0 0 * * 0 /usr/bin/pip install --upgrade youtube-dl" >> /etc/crontabs/root

COPY entry.sh /entry.sh
RUN chmod +x /entry.sh
ENV fprocess="/entry.sh"

ENTRYPOINT ["/usr/bin/supervisord","-c", "/etc/supervisor/conf.d/app.conf"]
