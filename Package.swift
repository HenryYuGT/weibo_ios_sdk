// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "Weibo_SDK",
    platforms: [
        .iOS(.v9)
    ],
    products: [
        .library(
            name: "Weibo_SDK",
            targets: ["Weibo_SDK"]
        )
    ],
    targets: [
        .target(
            name: "Weibo_SDK",
            path: "libWeiboSDK",
            exclude: [
                "libWeiboSDK.a" // Exclude from sources, linked manually below
            ],
            sources: [
                "WeiboSDK_Dummy.m", // Dummy file to satisfy SPM
                "WeiboSDK.h",
                "WBHttpRequest.h"
            ],
            resources: [
                .process("WeiboSDK.bundle"),
                .copy("PrivacyInfo.xcprivacy")
            ],
            publicHeadersPath: ".",
            linkerSettings: [
                .linkedFramework("Photos"),
                .linkedFramework("ImageIO"),
                .linkedFramework("SystemConfiguration"),
                .linkedFramework("CoreText"),
                .linkedFramework("QuartzCore"),
                .linkedFramework("Security"),
                .linkedFramework("UIKit"),
                .linkedFramework("Foundation"),
                .linkedFramework("CoreGraphics"),
                .linkedFramework("CoreTelephony"),
                .linkedFramework("WebKit"),
                .linkedLibrary("sqlite3"),
                .linkedLibrary("z"),
                .unsafeFlags(["-LlibWeiboSDK", "-lWeiboSDK"]) // Link the static library
            ]
        )
    ]
)
