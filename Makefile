run-mock:
	java -jar ./bin/wiremock-jre8-standalone-2.32.0.jar --port 9999

refresh-mock:
	sh ./scripts/fetch_all_posts.sh

init-config:
	sh ./scripts/init_global_configuration.sh
