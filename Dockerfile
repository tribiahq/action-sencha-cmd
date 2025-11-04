FROM ghcr.io/tribiahq/java:8

ENV OPENSSL_CONF=/dev/null

RUN apt-get update && apt-get install -y --no-install-recommends \
        curl \
		libfreetype6 \
		fontconfig \
        unzip \
	&& rm -rf /var/lib/apt/lists/*

# Installing SenchaCmd 6.5.2
RUN curl --silent https://cdn.sencha.com/cmd/6.5.2/no-jre/SenchaCmd-6.5.2-linux-amd64.sh.zip -o /tmp/sencha.zip && \
    unzip /tmp/sencha.zip -d /tmp  && \
    unlink /tmp/sencha.zip  && \
    chmod o+x /tmp/SenchaCmd-6.5.2.15-linux-amd64.sh && \
    /tmp/SenchaCmd-6.5.2.15-linux-amd64.sh -q -dir /opt/Sencha/Cmd/6.5.2.15 && \
    unlink /tmp/SenchaCmd-6.5.2.15-linux-amd64.sh

ENV PATH="/opt/Sencha/Cmd:${PATH}"

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
