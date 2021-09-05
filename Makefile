PRODUCT_NAME := Pokedex
SCHEME_NAME := ${PRODUCT_NAME}
PROJECT_NAME := ${PRODUCT_NAME}.xcodeproj
UI_TESTS_TARGET_NAME := ${PRODUCT_NAME}UITests

TEST_SDK := iphonesimulator
TEST_CONFIGURATION := Debug
TEST_PLATFORM := iOS Simulator
TEST_DEVICE ?= iPhone 12 Pro Max
TEST_OS ?= 14.5
TEST_DESTINATION := 'platform=${TEST_PLATFORM},name=${TEST_DEVICE},OS=${TEST_OS}'

.PHONY: bootstrap
bootstrap:
	brew update
	brew install mint
	mint bootstrap

.PHONY: update-tools
update-tools:
	brew update
	brew upgrade mint
	mint bootstrap

.PHONY: project
project:
	mint run mono0926/LicensePlist license-plist --output-path ${PRODUCT_NAME}/Resource/Lisence/Settings.bundle
	mint run SwiftGen/SwiftGen swiftgen
	make mock
	mint run yonaskolb/XcodeGen xcodegen generate

.PHONY: mock
mock:
	rm -f PokedexTests/Generated/MockResults.swift
	mint run mockolo mockolo -s Presentation -s Domain -s DataStore -d PokedexTests/Generated/MockResults.swift -i Presentation -i Domain -i DataStore

.PHONY: open
open:
	open ./${PROJECT_NAME}

.PHONY: show-devices
show-devices:
	instruments -s devices

.PHONY: build-debug
build-debug:
	set -o pipefail && \
xcodebuild \
-sdk ${TEST_SDK} \
-configuration ${TEST_CONFIGURATION} \
-project ${PROJECT_NAME} \
-scheme ${SCHEME_NAME} \
build \
| xcpretty

.PHONY: test
test:
	set -o pipefail && \
xcodebuild \
-sdk ${TEST_SDK} \
-configuration ${TEST_CONFIGURATION} \
-project ${PROJECT_NAME} \
-scheme ${SCHEME_NAME} \
-destination ${TEST_DESTINATION} \
-skip-testing:${UI_TESTS_TARGET_NAME} \
clean test \
| xcpretty

