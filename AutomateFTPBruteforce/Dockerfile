# syntax=docker/dockerfile:1

# --------- Stage 1: Base from ParrotSec to get NetExec tools ----------
FROM parrotsec/netexec:latest as attacker

# Optional: Install vsftpd manually, but instead we use base from fauria later

# --------- Stage 2: Final image from fauria/vsftpd ----------
FROM fauria/vsftpd

# Set required ENV for vsftpd
ENV FTP_USER=testuser
ENV FTP_PASS=testpass
ENV PASV_ADDRESS=127.0.0.1
ENV PASV_MIN_PORT=21100
ENV PASV_MAX_PORT=21110

# Install dependencies and copy NetExec from attacker stage
USER root
RUN apt-get update && apt-get install -y python3 pip iputils-ping && \
    rm -rf /var/lib/apt/lists/*

# Copy NetExec tools from attacker image
COPY --from=attacker /usr/bin/nxc /usr/bin/nxc
COPY --from=attacker /usr/lib/python3.*/ /usr/lib/python3.*/  # adjust if needed

# Copy attacker script
COPY attack.sh /attack.sh
RUN chmod +x /attack.sh

# Entry point to run FTP in background and run attack
CMD bash -c "/usr/sbin/vsftpd & sleep 5 && /attack.sh && tail -f /dev/null"
