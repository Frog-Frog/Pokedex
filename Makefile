bootstrap:
	brew update
	brew install carthage mint
	mint bootstrap

project:
	carthage bootstrap --platform iOS --cache-builds
	echo carthage update --platform iOS --cache-builds
	swiftgen
	xcodegen
