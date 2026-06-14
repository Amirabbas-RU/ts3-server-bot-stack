FROM avpnusr/ts3audiobot:latest

USER root

RUN mkdir -p /app/default-config/

COPY config/ /app/default-config/
COPY scripts/docker-entrypoint.sh /app/docker-entrypoint.sh
RUN chmod +x /app/docker-entrypoint.sh

ENTRYPOINT ["/app/docker-entrypoint.sh"]
CMD ["/opt/TS3AudioBot/TS3AudioBot", "--non-interactive", "--stats-disabled"]
