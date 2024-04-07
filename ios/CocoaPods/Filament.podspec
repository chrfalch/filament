Pod::Spec.new do |spec|
  spec.name = "Filament"
  spec.version = "1.51.2"
  spec.license = { :type => "Apache 2.0", :file => "LICENSE" }
  spec.homepage = "https://google.github.io/filament"
  spec.authors = "Google LLC."
  spec.summary = "Filament is a real-time physically based rendering engine for Android, iOS, Windows, Linux, macOS, and WASM/WebGL."
  spec.platform = :ios, "11.0"
  spec.source = { :http => "https://github.com/google/filament/releases/download/v1.51.2/filament-v1.51.2-ios.tgz" }

  spec.subspec "filament" do |ss|
    ss.source_files =
        "include/filament/*.h",
        "include/backend/*.h",
        "include/filament/MaterialChunkType.h",
        "include/filament/MaterialEnums.h",
        "include/ibl/*.h",
        "include/geometry/*.h"
    ss.header_mappings_dir = "include"
    ss.vendored_frameworks =
        "lib/libfilament.xcframework",
        "lib/libbackend.xcframework",
        "lib/libfilabridge.xcframework",
        "lib/libfilaflat.xcframework",
        "lib/libibl.xcframework",
        "lib/libgeometry.xcframework"
    ss.dependency "Filament/utils"
    ss.dependency "Filament/math"
  end

  spec.subspec "filamat" do |ss|
    ss.source_files =
        "include/filamat/*.h",
        "include/filament/MaterialChunkType.h",
        "include/filament/MaterialEnums.h"
    ss.header_mappings_dir = "include"
    ss.vendored_frameworks =
      "lib/libfilamat.xcframework",
      "lib/libshaders.xcframework",
      "lib/libsmol-v.xcframework",
      "lib/libfilabridge.xcframework"
    ss.dependency "Filament/utils"
    ss.dependency "Filament/math"
  end

  spec.subspec "gltfio_core" do |ss|
    ss.source_files = "include/gltfio/**/*.h"
    ss.header_mappings_dir = "include"
    ss.vendored_frameworks =
      "lib/libgltfio_core.xcframework",
      "lib/libdracodec.xcframework",
      "lib/libuberarchive.xcframework",
      "lib/libstb.xcframework"
    ss.dependency "Filament/filament"
    ss.dependency "Filament/ktxreader"
    ss.dependency "Filament/uberz"
  end

  spec.subspec "camutils" do |ss|
    ss.source_files = "include/camutils/*.h"
    ss.vendored_frameworks = "lib/libcamutils.xcframework"
    ss.header_dir = "camutils"
    ss.dependency "Filament/math"
  end

  spec.subspec "filameshio" do |ss|
    ss.source_files = "include/filameshio/*.h"
    ss.vendored_frameworks =
      "lib/libfilameshio.xcframework",
      "lib/libmeshoptimizer.xcframework"
    ss.header_dir = "filameshio"
    ss.dependency "Filament/filament"
  end

  spec.subspec "image" do |ss|
    ss.source_files = "include/image/*.h"
    ss.vendored_frameworks = "lib/libimage.xcframework"
    ss.header_dir = "image"
    ss.dependency "Filament/filament"
  end

  spec.subspec "utils" do |ss|
    ss.source_files = "include/utils/**/*.h"
    ss.header_mappings_dir = "include"
    ss.vendored_frameworks = "lib/libutils.xcframework"
    ss.dependency "Filament/tsl"
  end

  spec.subspec "tsl" do |ss|
    ss.source_files = "include/tsl/*.h"
    ss.header_dir = "tsl"
  end

  spec.subspec "math" do |ss|
    ss.source_files = "include/math/*.h"
    ss.header_dir = "math"
  end

  spec.subspec "ktxreader" do |ss|
    ss.source_files = "include/ktxreader/*.h"
    ss.header_mappings_dir = "include"
    ss.vendored_frameworks =
        "lib/libktxreader.xcframework",
        "lib/libbasis_transcoder.xcframework"
    ss.dependency "Filament/image"
    ss.dependency "Filament/filament"
  end

  spec.subspec "viewer" do |ss|
    ss.source_files = "include/viewer/*.h"
    ss.header_mappings_dir = "include"
    ss.vendored_frameworks =
        "lib/libviewer.xcframework",
        "lib/libcivetweb.xcframework"
    ss.dependency "Filament/filament"
    ss.dependency "Filament/gltfio_core"
  end

  spec.subspec "uberz" do |ss|
    ss.source_files = "include/uberz/*.h"
    ss.header_mappings_dir = "include"
    ss.vendored_frameworks =
        "lib/libuberzlib.xcframework",
        "lib/libzstd.xcframework"
    ss.header_dir = "uberz"
    ss.dependency "Filament/filamat"
    ss.dependency "Filament/tsl"
    ss.dependency "Filament/utils"
  end
end
