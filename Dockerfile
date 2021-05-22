FROM openfaas/classic-watchdog:0.20.1 as watchdog

FROM alpine:3.8
ENTRYPOINT []

COPY --from=watchdog /fwatchdog /usr/bin/fwatchdog

RUN apk add --no-cache py-pip bash ca-certificates
RUN pip install --upgrade youtube-dl

COPY entry.sh   .
RUN chmod +x entry.sh
ENV fprocess="./entry.sh"

CMD ["fwatchdog"]
