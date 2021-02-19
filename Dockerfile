ARG BUILD_FROM
FROM $BUILD_FROM
ENV LANG C.UTF-8

COPY entrypoint.sh /entrypoint.sh

RUN apk add --no-cache  \
       python3 \
       py3-pip \
    && pip install --no-cache-dir --upgrade pynx584 \
    && chmod a+x  /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
