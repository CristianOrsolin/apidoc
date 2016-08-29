FROM ubuntu:12.04

RUN apt-get update && 
    apt-get install -y nginx curl && 
    rm -rf /var/lib/apt/lists/* && 
    echo "daemon off;" >> /etc/nginx/nginx.conf &&
    curl -sL https://deb.nodesource.com/setup_6.x | bash -
    apt-get install -y nodejs &&
    npm install apidoc -g
    

WORKDIR /etc/nginx

CMD ["nginx"]

ADD default /etc/nginx/sites-available/default

EXPOSE 80
