.PHONY: image clean

image:
	docker build -t swiftlint .

clean:
	docker image rm -f swiftlint