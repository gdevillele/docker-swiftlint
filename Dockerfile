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
