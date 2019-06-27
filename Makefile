install:
	docker run -t --rm -v `pwd`:/app  -w /app composer:latest composer install

test:
	docker run -t --rm -v `pwd`:/app -w /app composer:latest sh -c "php vendor/phpunit/phpunit/phpunit --configuration phpunit.xml"

start:
	docker run -ti --rm -v `pwd`:/app -w /app composer:latest sh