DART = dart
DIRS = lib test

lint:
	$(DART) analyze --fatal-infos $(DIRS)

fix:
	$(DART) fix --apply $(DIRS)

format:
	$(DART) format --set-exit-if-changed $(DIRS)
