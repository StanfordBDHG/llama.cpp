// swift-tools-version:5.9

//
// This source file is part of the TemplatePackage open source project
//
// SPDX-FileCopyrightText: 2022 Stanford University and the project authors (see CONTRIBUTORS.md)
//
// SPDX-License-Identifier: MIT
//

import PackageDescription

var sources = [
    "ggml.c",
    "sgemm.cpp",
    "llama.cpp",
    "unicode.cpp",
    "unicode-data.cpp",
    "ggml-alloc.c",
    "ggml-backend.c",
    "ggml-quants.c",
]

var resources: [Resource] = []
var linkerSettings: [LinkerSetting] = []
var cSettings: [CSetting] =  [
    .unsafeFlags(["-Wno-shorten-64-to-32", "-O3", "-DNDEBUG"]),
    .unsafeFlags(["-fno-objc-arc"]),
    // NOTE: NEW_LAPACK will required iOS version 16.4+
    // We should consider add this in the future when we drop support for iOS 14
    // (ref: ref: https://developer.apple.com/documentation/accelerate/1513264-cblas_sgemm?language=objc)
    // .define("ACCELERATE_NEW_LAPACK"),
    // .define("ACCELERATE_LAPACK_ILP64")
]

#if canImport(Darwin)
sources.append("ggml-metal.m")
resources.append(.process("ggml-metal.metal"))
linkerSettings.append(.linkedFramework("Accelerate"))
cSettings.append(
    contentsOf: [
        .define("GGML_USE_ACCELERATE"),
        .define("GGML_USE_METAL")
    ]
)
#endif

#if os(Linux)
    cSettings.append(.define("_GNU_SOURCE"))
#endif

let package = Package(
    name: "llama",
    platforms: [
        .macOS(.v12),
        .iOS(.v14),
        .watchOS(.v4),
        .tvOS(.v14)
    ],
    products: [
        .library(name: "llama", targets: ["llama"]),
    ],
    targets: [
        .binaryTarget(
            name: "llama",
            path: "./llama.xcframework"
        )
    ]
)
