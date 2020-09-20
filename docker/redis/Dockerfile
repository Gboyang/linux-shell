FROM centos
MAINTAINER Gboyanghao@163.com

RUN wget http://download.redis.io/releases/redis-4.0.0.tar.gz

RUN mkdir /application \
	&& tar xf redis-4.0.0.tar.gz \
	&& mv redis-4.0.0 /application \
	&& ln -s /application/redis-4.0.0/ /application/redis 

WORKDIR /application/redis

RUN make

RUN cp utils/redis_init_script /etc/init.d/redis \
	&& sed -i "/^EXEC/s#/usr/local/bin/redis-server#/application/redis/src/redis-server#g" /etc/init.d/redis \
    && sed -i "/^CLIEXEC/s#/usr/local/bin/redis-cli#/application/redis/src/redis-cli#g" /etc/init.d/redis \
	&& sed -i "/^CONF/s#.*#CONF=/application/redis/redis.conf#g" /etc/init.d/redis

RUN sed -i 's#daemonize no#daemonize yes#g' redis.conf \
	&& sed -i '/^bind/s#127.0.0.1#0.0.0.0#g' redis.conf \
	&& sed -i 's#protected-mode yes#protected-mode no#g' redis.conf

EXPOSE 6379

CMD ["/usr/bin/bash"]