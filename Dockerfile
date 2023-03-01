FROM debian:11
MAINTAINER derrierdo@gmail.com
RUN apt-get -y update 
RUN apt-get install -y nginx
#RUN apt-get install -y php5-fpm
#RUN apt-get install -y vim


COPY fastcgi-php.conf 	/etc/nginx/snippets/
COPY default 		/etc/nginx/sites-available/
COPY run.sh		/

EXPOSE 80
CMD /run.sh 
#CMD /bin/bash

