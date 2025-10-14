FROM golang AS builder

RUN git clone https://github.com/restic/restic.git -b v0.18.1 /workspace

WORKDIR /workspace/

RUN go run build.go

RUN ./restic version


FROM rclone/rclone:latest

MAINTAINER Newnius <newnius.cn@gmail.com>

COPY --from=builder /workspace/restic /usr/local/bin/

ENTRYPOINT []

CMD [ "restic" ]
