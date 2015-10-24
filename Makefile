all: default run.sh fastcgi-php.conf Dockerfile
	docker build -t who0/dockweb-nginx .
