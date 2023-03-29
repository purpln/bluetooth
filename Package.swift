// swift-tools-version:5.7

import PackageDescription

let package = Package(
    name: "app", platforms: [.macOS(.v10_15)],
    products: [.executable(name: "app", targets: ["Application"])],
    dependencies: [.package(url: "https://github.com/PureSwift/BluetoothLinux.git", branch: "master")],
    targets: [
        .executableTarget(name: "Application", dependencies: [
            .target(name: "Architecture"),
            .product(name: "BluetoothLinux", package: "BluetoothLinux")
        ], swiftSettings: [
            .define("SWIFTPM_DISABLE_PLUGINS")
        ]),
        .target(name: "Architecture")
    ], cxxLanguageStandard: .cxx17
)
