const std = @import("std");

pub fn build(b: *std.build.Builder) void {
    const libSDL_dep = b.dependency("SDL");

    const lib = b.addStaticLibrary(.{
        .name = "SDL_image",
        .target = b.standardTargetOptions(.{}),
        .optimize = b.standardOptimizeOption(.{}),
    });
    lib.linkLibC();
    lib.linkLibrary(libSDL_dep.artifact("SDL2"));
    lib.addCSourceFiles(&.{
        "IMG_avif.c",
        "IMG_bmp.c",
        "IMG_gif.c",
        "IMG_jpg.c",
        "IMG_lbm.c",
        "IMG_pcx.c",
        "IMG_png.c",
        "IMG_pnm.c",
        "IMG_qoi.c",
        "IMG_stb.c",
        "IMG_svg.c",
        "IMG_tga.c",
        "IMG_tif.c",
        "IMG_webp.c",
        "IMG_WIC.c",
        "IMG_xcf.c",
        "IMG_xpm.c",
        "IMG_xv.c",
        "IMG_xxx.c",
        "IMG.c",
    }, &.{"-std=c89"});
    lib.installHeader("SDL_image.h", "SDL_image.h");
    b.installArtifact(lib);
}
