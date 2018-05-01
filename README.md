# docker-swiftlint

Build context for a SwiftLint docker container.

[https://github.com/realm/SwiftLint](https://github.com/realm/SwiftLint)

### Use image from registry

```
docker run -v `pwd`:`pwd` -w `pwd` gaetan/swiftlint:0.25.1 swiftlint lint
```

### Build image

```
make image
```

### Clean built image

```
make clean
```
