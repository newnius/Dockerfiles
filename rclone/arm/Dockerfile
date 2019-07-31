FROM alpine:3.10

MAINTAINER Newnius <newnius.cn@gmail.com>

RUN apk add --no-cache curl bash && \
	curl -O https://downloads.rclone.org/rclone-current-linux-arm.zip && \
	unzip rclone-current-linux-arm.zip && \
	mv rclone-*-linux-arm/rclone /usr/bin/ && \
	rm rclone-current-linux-arm.zip && \
	rm -rf rclone-*-linux-arm 

ADD bootstrap.sh /etc/bootstrap.sh
ADD sync.sh /etc/sync.sh

CMD ["/etc/bootstrap.sh"]
