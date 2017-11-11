FROM alpine:3.6 as watchdog

RUN apk add --no-cache curl \
    && curl -sL https://github.com/alexellis/faas/releases/download/0.6.9/fwatchdog > \
    /usr/bin/fwatchdog \
    && chmod +x /usr/bin/fwatchdog

FROM alpine:3.6
ENTRYPOINT []

COPY --from=watchdog /usr/bin/fwatchdog /usr/bin/fwatchdog

RUN apk add --no-cache youtube-dl bash ca-certificates

COPY entry.sh   .
RUN chmod +x entry.sh
ENV fprocess="./entry.sh"

CMD ["fwatchdog"]
