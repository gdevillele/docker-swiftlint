FROM swift:4.1

# git tag to checkout
ENV SWIFTLINT_REVISION="0.25.1"

# Install SwiftLint
RUN git clone https://github.com/realm/SwiftLint.git && \
    cd SwiftLint && \
	git checkout tags/$SWIFTLINT_REVISION && \
    swift build --configuration release --static-swift-stdlib && \
    mv `swift build --configuration release --static-swift-stdlib --show-bin-path`/swiftlint /usr/bin && \
    cd .. && \
    rm -rf SwiftLint

# Print Installed SwiftLint Version
RUN swiftlint version
CMD ["swiftlint", "lint"]



FROM ubuntu:16.04
COPY --from=0 /usr/bin/swiftlint /usr/bin/swiftlint
COPY --from=0 /usr/lib/swift/linux/libswiftCore.so /usr/lib/swift/linux/libswiftCore.so
COPY --from=0 /usr/lib/swift/linux/libFoundation.so /usr/lib/swift/linux/libFoundation.so
COPY --from=0 /usr/lib/swift/linux/libswiftGlibc.so /usr/lib/swift/linux/libswiftGlibc.so
COPY --from=0 /usr/lib/swift/linux/libdispatch.so /usr/lib/swift/linux/libdispatch.so
COPY --from=0 /usr/lib/x86_64-linux-gnu /usr/lib/x86_64-linux-gnu
COPY --from=0 /lib/x86_64-linux-gnu /lib/x86_64-linux-gnu
COPY --from=0 /usr/lib/libsourcekitdInProc.so /usr/lib/libsourcekitdInProc.so
CMD ["swiftlint", "lint"]
