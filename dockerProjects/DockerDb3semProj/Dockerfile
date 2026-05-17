FROM mcr.microsoft.com/mssql/server:2022-latest

USER root

RUN mkdir -p /usr/config

COPY init /usr/config

RUN chmod +x /usr/config/entrypoint.sh

EXPOSE 1433

CMD ["/usr/config/entrypoint.sh"]