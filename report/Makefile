build:
	@echo 'Generating files.'
	@rst2pdf report.rst -s style.json -o report.pdf

watch:
	@while inotifywait -q -r report.rst; do make build; done

.PHONY: build, watch
