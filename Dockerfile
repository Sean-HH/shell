FROM myscratch
MANTAINER sean_wang@skytech.cn
RUN apk updata && \
apk add openjdk8 curl tzdate wget && \
cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
echo Asia/Shanghai > /etc/timezone && \
apk del tzdate && \
rm -rf /tmp/*  /var/cache/apk/*
CMD ['echo','build sucess']
