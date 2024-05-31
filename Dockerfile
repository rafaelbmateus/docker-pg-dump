FROM postgres:16

RUN apt-get update && apt-get install -y \
    curl \
    && rm -rf /var/lib/apt/lists/*

COPY scripts/check.sh /usr/local/bin/check.sh
RUN chmod +x /usr/local/bin/check.sh

COPY scripts/dump.sh /usr/local/bin/dump.sh
RUN chmod +x /usr/local/bin/dump.sh

COPY scripts/run-daily.sh /usr/local/bin/run-daily.sh
RUN chmod +x /usr/local/bin/run-daily.sh

COPY scripts/slack.sh /usr/local/bin/slack.sh
RUN chmod +x /usr/local/bin/slack.sh
