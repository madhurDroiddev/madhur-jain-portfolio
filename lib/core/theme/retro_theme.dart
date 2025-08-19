import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_app/generated/assets.dart';

class RetroThemeExtension extends ThemeExtension<RetroThemeExtension> {
  final List<Color> headerGradient;
  final List<Color> contactGradient;
  final String? backgroundImage;
  final String? headerOverlayImage;
  final bool useImages;

  const RetroThemeExtension({
    required this.headerGradient,
    required this.contactGradient,
    this.backgroundImage,
    this.headerOverlayImage,
    this.useImages = false,
  });

  @override
  RetroThemeExtension copyWith({
    List<Color>? headerGradient,
    List<Color>? contactGradient,
    String? backgroundImage,
    String? headerOverlayImage,
    bool? useImages,
  }) {
    return RetroThemeExtension(
      headerGradient: headerGradient ?? this.headerGradient,
      contactGradient: contactGradient ?? this.contactGradient,
      backgroundImage: backgroundImage ?? this.backgroundImage,
      headerOverlayImage: headerOverlayImage ?? this.headerOverlayImage,
      useImages: useImages ?? this.useImages,
    );
  }

  @override
  RetroThemeExtension lerp(
      ThemeExtension<RetroThemeExtension>? other, double t) {
    if (other is! RetroThemeExtension) return this;
    Color lerpColor(Color a, Color b) => Color.lerp(a, b, t) ?? a;
    return RetroThemeExtension(
      headerGradient: List<Color>.generate(
        headerGradient.length,
        (i) => lerpColor(headerGradient[i], other.headerGradient[i]),
      ),
      contactGradient: List<Color>.generate(
        contactGradient.length,
        (i) => lerpColor(contactGradient[i], other.contactGradient[i]),
      ),
      backgroundImage: t < 0.5 ? backgroundImage : other.backgroundImage,
      headerOverlayImage:
          t < 0.5 ? headerOverlayImage : other.headerOverlayImage,
      useImages: t < 0.5 ? useImages : other.useImages,
    );
  }
}

class RetroTheme {
  // Retro palette: neon green, magenta, cyan on dark CRT
  static const Color neonGreen = Color(0xFF00FF9F);
  static const Color magenta = Color(0xFFFF2ECC);
  static const Color cyan = Color(0xFF00E5FF);
  static const Color deepPurple = Color(0xFF6C2DC7);
  static const Color darkBg = Color(0xFF0B0F1A);
  static const Color darkPanel = Color(0xFF12182A);

  static ThemeData light() {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: neonGreen,
      brightness: Brightness.light,
      primary: deepPurple,
      secondary: magenta,
      surface: const Color(0xFFF5F7FB),
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: const Color(0xFFF2F4F8),
      textSelectionTheme: const TextSelectionThemeData(cursorColor: deepPurple),
      textTheme: GoogleFonts.rubikTextTheme(),
      extensions: const [
        RetroThemeExtension(
          headerGradient: [deepPurple, magenta, cyan],
          contactGradient: [deepPurple, magenta],
          backgroundImage: null, // e.g. 'assets/images/retro/grid_light.png'
          headerOverlayImage: null, // e.g. 'assets/images/retro/scanlines.png'
          useImages: false,
        ),
      ],
    );
  }

  static ThemeData dark() {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: neonGreen,
      brightness: Brightness.dark,
      primary: neonGreen,
      secondary: magenta,
      surface: darkPanel,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: darkBg,
      textSelectionTheme: const TextSelectionThemeData(cursorColor: neonGreen),
      textTheme: GoogleFonts.rubikTextTheme(),
      extensions: const [
        RetroThemeExtension(
          headerGradient: [darkBg, deepPurple, magenta],
          contactGradient: [deepPurple, magenta],
          backgroundImage: null, // e.g. 'assets/images/retro/grid_dark.png'
          headerOverlayImage:
              Assets.svgsBanner, // e.g. 'assets/images/retro/scanlines.png'
          useImages: false,
        ),
      ],
    );
  }
}
