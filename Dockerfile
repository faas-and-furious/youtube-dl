FROM crosbymichael/youtubedl
ENTRYPOINT []

ADD https://github.com/alexellis/faas/releases/download/0.5.8-alpha/fwatchdog /usr/bin
RUN chmod +x /usr/bin/fwatchdog
COPY entry.sh   .
RUN chmod +x entry.sh
ENV fprocess="./entry.sh"

CMD ["fwatchdog"]
