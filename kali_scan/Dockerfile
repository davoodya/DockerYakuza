FROM kalilinux/kali-rolling

LABEL maintainer="DavoodSec@davoodya.ir"

RUN echo 'Acquire::AllowInsecureRepositories "true";' > /etc/apt/apt.conf.d/99insecure
RUN apt update && apt install -y --allow-unauthenticated nmap

COPY ./scan.sh /opt/scan.sh

WORKDIR /opt/
RUN chmod +x scan.sh

CMD ["sh", "./scan.sh", "171.22.25.49"]

