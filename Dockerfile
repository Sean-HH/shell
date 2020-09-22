FROM myscratch
MANTAINER sean_wang@skytech.cn
RUN echo "https://mirrors.aliyun.com/alpine/v3.5/main" >> /etc/apk/repositories && \ 
apk update && \
apk add openjdk8 curl tzdate wget && \
cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
echo Asia/Shanghai > /etc/timezone && \
apk del tzdate && \
rm -rf /tmp/*  /var/cache/apk/*
