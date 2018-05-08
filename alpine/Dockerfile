FROM openjdk:8-jre-alpine

MAINTAINER Travis Sturzl <travis@metismachine.com>

ENV ENVCONSUL_VERSION=0.7.3

RUN apk --no-cache --update upgrade && \
    apk --no-cache --update add bash && \
    rm -rf /var/cache/apk/*

RUN wget "https://releases.hashicorp.com/envconsul/${ENVCONSUL_VERSION}/envconsul_${ENVCONSUL_VERSION}_linux_amd64.tgz" && \
  tar xf envconsul_${ENVCONSUL_VERSION}_linux_amd64.tgz && \
  rm envconsul_${ENVCONSUL_VERSION}_linux_amd64.tgz && \
  mv envconsul /usr/local/bin && \
  chmod 0555 /usr/local/bin/envconsul

COPY entrypoint.sh /usr/local/bin/entrypoint
RUN chmod +x /usr/local/bin/entrypoint && \
    mkdir -p /etc/envconsul && \
    chmod 0555 -R /etc/envconsul


ENTRYPOINT ["/usr/local/bin/entrypoint"]

CMD ["/bin/bash"]
