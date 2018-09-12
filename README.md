# docker-swiftlint

Build context for a SwiftLint docker container.

[https://github.com/realm/SwiftLint](https://github.com/realm/SwiftLint)

### Use image from registry

```
docker run --rm -v `pwd`:/project -w /project gaetan/swiftlint:0.27.0 swiftlint lint
```

### Build image

```
./build-image.sh
```
