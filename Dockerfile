FROM n8nio/n8n:latest
USER root
RUN apt-get update && apt-get install -y curl gpg debian-archive-keyring \
    && curl -sS https://downloads.1password.com/linux/keys/1password.asc | \
       gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg \
    && echo "deb [arch=amd64 signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/amd64 stable main" \
       > /etc/apt/sources.list.d/1password.list \
    && apt-get update && apt-get install -y 1password-cli \
    && apt-get clean
USER node
