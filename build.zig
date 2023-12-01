const std = @import("std");

pub fn build(b: *std.build.Builder) void {
    const libSDL_dep = b.dependency("SDL", .{});

    const libSDL = libSDL_dep.artifact("SDL2");

    const lib = b.addStaticLibrary(.{
        .name = "SDL_image",
        .target = b.standardTargetOptions(.{}),
        .optimize = b.standardOptimizeOption(.{}),
    });

    lib.linkLibC();

    lib.defineCMacro("USE_STBIMAGE", "1");
    lib.defineCMacro("LOAD_BMP", "1");
    lib.defineCMacro("LOAD_GIF", "1");
    lib.defineCMacro("LOAD_JPG", "1");
    lib.defineCMacro("LOAD_PNG", "1");
    lib.defineCMacro("LOAD_SVG", "1");
    lib.defineCMacro("LOAD_TGA", "1");

    lib.linkLibrary(libSDL);

    lib.addCSourceFiles(.{
        .files = &.{
            "src/IMG_avif.c",
            "src/IMG_bmp.c",
            "src/IMG_gif.c",
            "src/IMG_jpg.c",
            "src/IMG_jxl.c",
            "src/IMG_lbm.c",
            "src/IMG_pcx.c",
            "src/IMG_png.c",
            "src/IMG_pnm.c",
            "src/IMG_qoi.c",
            "src/IMG_stb.c",
            "src/IMG_svg.c",
            "src/IMG_tga.c",
            "src/IMG_tif.c",
            "src/IMG_webp.c",
            "src/IMG_WIC.c",
            "src/IMG_xcf.c",
            "src/IMG_xpm.c",
            "src/IMG_xv.c",
            "src/IMG_xxx.c",
            "src/IMG.c",
        },
        .flags = &.{
            "-std=c99",
        },
    });
    lib.installHeader("src/SDL_image.h", "SDL2/SDL_image.h");
    b.installArtifact(lib);
}
