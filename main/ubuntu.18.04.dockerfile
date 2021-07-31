FROM ubuntu:18.04

RUN apt-get update && \
      echo "Asia/Shanghai" > /etc/timezone && \
      DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata && \
      apt-get install -y language-pack-zh-hans && \
      locale-gen zh_CN; locale-gen zh_CN.utf8; \
      apt-get autoclean; rm -rf /var/lib/apt/lists/*
