// Intentionally empty.
//
// This stub target exists so SwiftPM embeds the bundled `BoxoSDK.xcframework`
// and `Lottie.xcframework` binary targets into the consuming app bundle.
// Without a regular target depending on them, SwiftPM links the frameworks
// but does not copy them, causing a runtime "Library not loaded" crash on
// physical devices. Same workaround Airbnb uses in lottie-spm.
//
// See https://github.com/apple/swift-package-manager/issues/6069
