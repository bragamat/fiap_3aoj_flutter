.DEFAULT_GOAL := dev

dev:
	flutter run --hot --dart-define-from-file=.env.json

test:
	flutter test
.PHONY: test
