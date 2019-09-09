install: ## Install dependancies
	docker run --rm -v `pwd`:/app  -w /app composer:latest composer install

dump-autoload: ## Regenerate autoload files
	docker run --rm -v `pwd`:/app  -w /app composer:latest composer dump-autoload

unit-test: ## run php-unit tests
	docker run --rm -v `pwd`:/app -w /app composer:latest sh -c "php vendor/phpunit/phpunit/phpunit --configuration phpunit.xml"

shell: ## Run a shell
	docker run -ti --rm -v `pwd`:/app -w /app composer:latest sh

phpstan: ## Run static anylsis R=options
	docker run --rm -v `pwd`:/app -w /app composer:latest sh -c "php vendor/bin/phpstan analyse $(R) src/ tests/"

behat-test: ## Run integration tests. R=options
	docker run --rm -v `pwd`:/app -w /app composer:latest sh -c "php vendor/bin/behat -n --verbose --stop-on-failure --colors $(R)"

help: ## List all Makefile targets
	@grep -E '^[a-zA-Z-]+:.*?## .*$$' Makefile | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "[32m%-15s[0m %s\n", $$1, $$2}'

.PHONY: help install unit-test behat-test shell phpstan