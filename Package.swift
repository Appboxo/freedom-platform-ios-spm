// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FreedomBoxoSDK",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "FreedomBoxoSDK", targets: ["BoxoSDK", "Lottie", "_BoxoSDKStub"])
    ],
    targets: [
        .binaryTarget(
            name: "BoxoSDK",
            path: "BoxoSDK.xcframework"
        ),
        // Lottie ships bundled with BoxoSDK so that consumers don't need to add
        // airbnb/lottie-spm separately. Adding another Lottie dependency in your
        // app will produce duplicate symbols at link time.
        .binaryTarget(
            name: "Lottie",
            path: "Lottie.xcframework"
        ),
        // SwiftPM doesn't embed pure binaryTarget products into the consuming
        // app unless at least one regular target depends on them. Without this
        // stub, the framework is linked but not copied into the app bundle,
        // and the app crashes on a physical device with "Library not loaded".
        // Same workaround Airbnb uses in lottie-spm.
        // See https://github.com/apple/swift-package-manager/issues/6069
        .target(
            name: "_BoxoSDKStub",
            dependencies: ["BoxoSDK", "Lottie"],
            path: "Sources/_BoxoSDKStub"
        )
    ]
)