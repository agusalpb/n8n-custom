FROM n8nio/n8n:latest
USER root
RUN apk add --no-cache wget unzip \
    && wget -O /tmp/op.zip https://cache.agilebits.com/dist/1P/op2/pkg/v2.30.3/op_linux_amd64_v2.30.3.zip \
    && unzip /tmp/op.zip -d /usr/local/bin \
    && rm /tmp/op.zip \
    && chmod +x /usr/local/bin/op
USER node
