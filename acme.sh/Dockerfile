FROM alpine:3.10

RUN apk update -f \
  && apk --no-cache add -f \
  openssl \
  openssh-client \
  coreutils \
  bind-tools \
  curl \
  socat \
  tzdata \
  oath-toolkit-oathtool \
  tar \
  && rm -rf /var/cache/apk/*

ENV LE_CONFIG_HOME /acme.sh

ENV AUTO_UPGRADE 1

#Install
RUN wget `curl -s https://api.github.com/repos/acmesh-official/acme.sh/releases/latest \
  | grep tarball_url \
  | cut -d '"' -f 4` \
  -O /tmp/acme.sh.tgz \
  && mkdir /install_acme.sh/ \
  && tar -zxf /tmp/acme.sh.tgz -C /install_acme.sh/ --strip-components=1 \
  && rm /tmp/acme.sh.tgz

RUN cd /install_acme.sh && ([ -f /install_acme.sh/acme.sh ] && /install_acme.sh/acme.sh --install || curl https://get.acme.sh | sh) && rm -rf /install_acme.sh/


RUN ln -s  /root/.acme.sh/acme.sh  /usr/local/bin/acme.sh && crontab -l | grep acme.sh | sed 's#> /dev/null##' | crontab -

RUN for verb in help \
  version \
  install \
  uninstall \
  upgrade \
  issue \
  signcsr \
  deploy \
  install-cert \
  renew \
  renew-all \
  revoke \
  remove \
  list \
  showcsr \
  install-cronjob \
  uninstall-cronjob \
  cron \
  toPkcs \
  toPkcs8 \
  update-account \
  register-account \
  create-account-key \
  create-domain-key \
  createCSR \
  deactivate \
  deactivate-account \
  set-notify \
  ; do \
    printf -- "%b" "#!/usr/bin/env sh\n/root/.acme.sh/acme.sh --${verb} --config-home /acme.sh \"\$@\"" >/usr/local/bin/--${verb} && chmod +x /usr/local/bin/--${verb} \
  ; done

RUN printf "%b" '#!'"/usr/bin/env sh\n \
if [ \"\$1\" = \"daemon\" ];  then \n \
 trap \"echo stop && killall crond && exit 0\" SIGTERM SIGINT \n \
 crond && while true; do sleep 1; done;\n \
else \n \
 exec -- \"\$@\"\n \
fi" >/entry.sh && chmod +x /entry.sh

VOLUME /acme.sh

ENTRYPOINT ["/entry.sh"]
CMD ["--help"]
