# Project short scripts

.PHONY: generate
generate:
	flutter pub run build_runner build --delete-conflicting-outputs 
	
.PHONY: formatSort
sort:
	flutter format lib/ && \
	flutter format test/ && \
	flutter pub run import_sorter:main

.PHONY: syncRemote
syncRemote:
	git checkout master && \
	git branch | grep -v "master" | xargs git branch -D && \
	git pull origin master