FROM amazon/aws-cli:latest

WORKDIR /
COPY entrypoint.sh entrypoint.sh
COPY main main
COPY conf/app.conf conf/app.conf
RUN chmod +x main entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

FROM gcr.io/distroless/base-debian12
WORKDIR /
COPY main main
COPY conf/app.conf conf/app.conf
ENTRYPOINT ["/main"]