FROM wernight/youtube-dl
ENTRYPOINT []

ADD https://github.com/openfaas/faas/releases/download/0.6.9/fwatchdog /usr/bin
RUN chmod +x /usr/bin/fwatchdog

COPY entry.sh /usr/bin/entry.sh
RUN chmod +x /usr/bin/entry.sh
ENV fprocess="/usr/bin/entry.sh"

HEALTHCHECK --interval=2s CMD [ -e /tmp/.lock ] || exit 1
CMD ["fwatchdog"]
