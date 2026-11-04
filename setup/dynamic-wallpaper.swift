// Builds a macOS light/dark wallpaper (HEIC that follows the system appearance).
// Usage: swift dynamic-wallpaper.swift <light.png> <dark.png> <out.heic>
import Foundation
import ImageIO

let args = CommandLine.arguments
guard args.count == 4 else {
  FileHandle.standardError.write("usage: dynamic-wallpaper <light> <dark> <out.heic>\n".data(using: .utf8)!)
  exit(1)
}

func image(_ path: String) -> CGImage {
  let source = CGImageSourceCreateWithURL(URL(fileURLWithPath: path) as CFURL, nil)!
  return CGImageSourceCreateImageAtIndex(source, 0, nil)!
}

// The appearance map: image 0 in light mode, image 1 in dark mode
let apr = try PropertyListSerialization.data(fromPropertyList: ["l": 0, "d": 1], format: .binary, options: 0)
let ns = "http://ns.apple.com/namespace/1.0/" as CFString
let metadata = CGImageMetadataCreateMutable()
CGImageMetadataRegisterNamespaceForPrefix(metadata, ns, "apple_desktop" as CFString, nil)
let tag = CGImageMetadataTagCreate(ns, "apple_desktop" as CFString, "apr" as CFString, .string,
                                   apr.base64EncodedString() as CFString)!
CGImageMetadataSetTagWithPath(metadata, nil, "apple_desktop:apr" as CFString, tag)

let dest = CGImageDestinationCreateWithURL(URL(fileURLWithPath: args[3]) as CFURL, "public.heic" as CFString, 2, nil)!
CGImageDestinationAddImageAndMetadata(dest, image(args[1]), metadata, nil)
CGImageDestinationAddImage(dest, image(args[2]), nil)
guard CGImageDestinationFinalize(dest) else { exit(1) }
