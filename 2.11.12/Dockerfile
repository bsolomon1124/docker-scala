#
# NOTE: THIS DOCKERFILE IS GENERATED VIA "update.sh"
#
# PLEASE DO NOT EDIT IT DIRECTLY.
#
FROM openjdk:8

ARG SCALA_VERSION=2.11.12
ENV SCALA_HOME "/usr/src/scala"
ENV PATH "${SCALA_HOME}/bin:$PATH"

RUN set -ex \
    && wget -O scala.tar.gz "https://downloads.lightbend.com/scala/${SCALA_VERSION}/scala-${SCALA_VERSION}.tgz" \
    && mkdir -p /usr/src/scala/ \
    && tar -xzv -C /usr/src/scala --strip-components=1 -f scala.tar.gz \
    && rm scala.tar.gz \
    && ln -s "${SCALA_HOME}/bin/scala" /usr/local/bin/scala \
    && ln -s "${SCALA_HOME}/bin/scalac" /usr/local/bin/scalac \
    && ln -s "${SCALA_HOME}/bin/scaladoc" /usr/local/bin/scaladoc

CMD ["scala"]
