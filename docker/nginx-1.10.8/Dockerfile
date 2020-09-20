FROM centos

MAINTAINER Gboyanghao@163.com

RUN yum -y install wget gcc pcre pcre-devel openssl openssl-devel make \
	&& wget -q http://mirrors.sohu.com/nginx/nginx-1.17.8.tar.gz \
	&& tar xf nginx-1.17.8.tar.gz \
	&& /usr/sbin/useradd -s /sbin/nologin -M www 
	
WORKDIR nginx-1.17.8 

RUN ./configure --user=www \
				--group=www \
				--prefix=/application/nginx-1.17.8 \
				--with-http_stub_status_module \
				--with-http_ssl_module
									
RUN make && make install \
	&& ln -s /application/nginx-1.17.8/ /application/nginx
	
EXPOSE 80
CMD ['/application/nginx/sbin/nginx']