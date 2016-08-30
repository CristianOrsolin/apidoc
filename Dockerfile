FROM ubuntu:12.04

RUN apt-get update && apt-get install -y curl \
&& curl -sL https://deb.nodesource.com/setup_6.x | bash -

RUN apt-get update && apt-get install -y curl \
	nginx \
	nodejs \
&& rm -rf /var/lib/apt/lists/* \
&& echo "daemon off;" >> /etc/nginx/nginx.conf \
&& npm install apidoc -g

WORKDIR /etc/nginx

CMD ["nginx"]

ADD default /etc/nginx/sites-available/default
ADD index.html /var/www/

EXPOSE 80
