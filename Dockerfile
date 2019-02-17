FROM docker:edge-git

ENV SIAB_USERCSS="Normal:+/etc/shellinabox/options-enabled/00+Black-on-White.css,Reverse:-/etc/shellinabox/options-enabled/00_White-On-Black.css;Colors:+/etc/shellinabox/options-enabled/01+Color-Terminal.css,Monochrome:-/etc/shellinabox/options-enabled/01_Monochrome.css" \
  SIAB_PORT=4200 \
  SIAB_ADDUSER=true \
  SIAB_USER=siab \
  SIAB_USERID=1001 \
  SIAB_GROUP=siab \
  SIAB_GROUPID=1001 \
  SIAB_PASSWORD=putsafepasswordhere \
  SIAB_SHELL=/bin/bash \
  SIAB_HOME=/home/siab \
  SIAB_SSL=true \
  SIAB_SERVICE=/:LOGIN \
  SIAB_PKGS=none \
  SIAB_SCRIPT=none

ADD files/user-css.tar.gz /

RUN echo 'http://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories && \
    chmod 755 /etc && \
    apk update && \
    apk upgrade && \
    apk add --update shadow util-linux pciutils coreutils binutils findutils grep bash bash-completion openssl curl openssh-client sudo shellinabox && rm -rf /var/cache/apk/* && \
    echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers && \
    curl -o /usr/local/bin/kubectl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && chmod +x /usr/local/bin/kubectl && \
    apk add --no-cache python && \
    python -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip install --upgrade pip setuptools && \
    rm -r /root/.cache

EXPOSE 4200

ADD files/entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
CMD ["shellinabox"]
