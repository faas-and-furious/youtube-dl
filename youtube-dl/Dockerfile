FROM crosbymichael/youtubedl
ENTRYPOINT []

ADD https://github.com/openfaas/faas/releases/download/0.6.9/fwatchdog /usr/bin
RUN chmod +x /usr/bin/fwatchdog

COPY entry.sh .
RUN chmod +x entry.sh
ENV fprocess="./entry.sh"

HEALTHCHECK --interval=5s CMD [ -e /tmp/.lock ] || exit 1
CMD ["fwatchdog"]
