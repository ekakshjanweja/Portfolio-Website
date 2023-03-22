/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/Helvetica Neue LTW0697BlkCnObl.otf
  String get helveticaNeueLTW0697BlkCnObl =>
      'assets/fonts/Helvetica Neue LTW0697BlkCnObl.otf';

  /// File path: assets/fonts/Helvetica Neue Medium Extended.otf
  String get helveticaNeueMediumExtended =>
      'assets/fonts/Helvetica Neue Medium Extended.otf';

  /// File path: assets/fonts/Helvetica Neue UltraLight.otf
  String get helveticaNeueUltraLight =>
      'assets/fonts/Helvetica Neue UltraLight.otf';

  /// File path: assets/fonts/Helvetica Neue W01 66 Medium It.ttf
  String get helveticaNeueW0166MediumIt =>
      'assets/fonts/Helvetica Neue W01 66 Medium It.ttf';

  /// File path: assets/fonts/Helvetica Neue W01 77 Bd Cn Obl.ttf
  String get helveticaNeueW0177BdCnObl =>
      'assets/fonts/Helvetica Neue W01 77 Bd Cn Obl.ttf';

  /// File path: assets/fonts/Helvetica Neue W01 87 Hv Cn Obl.ttf
  String get helveticaNeueW0187HvCnObl =>
      'assets/fonts/Helvetica Neue W01 87 Hv Cn Obl.ttf';

  /// File path: assets/fonts/Helvetica NeueLTW0693BlkExtObl.ttf
  String get helveticaNeueLTW0693BlkExtObl =>
      'assets/fonts/Helvetica NeueLTW0693BlkExtObl.ttf';

  /// List of all assets
  List<String> get values => [
        helveticaNeueLTW0697BlkCnObl,
        helveticaNeueMediumExtended,
        helveticaNeueUltraLight,
        helveticaNeueW0166MediumIt,
        helveticaNeueW0177BdCnObl,
        helveticaNeueW0187HvCnObl,
        helveticaNeueLTW0693BlkExtObl
      ];
}

class $AssetsLogosGen {
  const $AssetsLogosGen();

  /// File path: assets/logos/dart.svg
  String get dart => 'assets/logos/dart.svg';

  /// File path: assets/logos/figma.svg
  String get figma => 'assets/logos/figma.svg';

  /// File path: assets/logos/firebase.svg
  String get firebase => 'assets/logos/firebase.svg';

  /// File path: assets/logos/flutter.svg
  String get flutter => 'assets/logos/flutter.svg';

  /// File path: assets/logos/github_black.svg
  String get githubBlack => 'assets/logos/github_black.svg';

  /// File path: assets/logos/github_white.svg
  String get githubWhite => 'assets/logos/github_white.svg';

  /// File path: assets/logos/hashnode.svg
  String get hashnode => 'assets/logos/hashnode.svg';

  /// File path: assets/logos/insta.svg
  String get insta => 'assets/logos/insta.svg';

  /// File path: assets/logos/linkedin.svg
  String get linkedin => 'assets/logos/linkedin.svg';

  /// File path: assets/logos/notion.svg
  String get notion => 'assets/logos/notion.svg';

  /// File path: assets/logos/notion_white.svg
  String get notionWhite => 'assets/logos/notion_white.svg';

  /// File path: assets/logos/playstore.svg
  String get playstore => 'assets/logos/playstore.svg';

  /// File path: assets/logos/react.svg
  String get react => 'assets/logos/react.svg';

  /// File path: assets/logos/tailwind.svg
  String get tailwind => 'assets/logos/tailwind.svg';

  /// File path: assets/logos/tas.svg
  String get tas => 'assets/logos/tas.svg';

  /// File path: assets/logos/tbb.svg
  String get tbb => 'assets/logos/tbb.svg';

  /// File path: assets/logos/tbb_logo.png
  AssetGenImage get tbbLogo => const AssetGenImage('assets/logos/tbb_logo.png');

  /// File path: assets/logos/ts.svg
  String get ts => 'assets/logos/ts.svg';

  /// File path: assets/logos/twitter.svg
  String get twitter => 'assets/logos/twitter.svg';

  /// File path: assets/logos/valorant.svg
  String get valorant => 'assets/logos/valorant.svg';

  /// File path: assets/logos/zu.svg
  String get zu => 'assets/logos/zu.svg';

  /// File path: assets/logos/zu_logo.png
  AssetGenImage get zuLogo => const AssetGenImage('assets/logos/zu_logo.png');

  /// List of all assets
  List<dynamic> get values => [
        dart,
        figma,
        firebase,
        flutter,
        githubBlack,
        githubWhite,
        hashnode,
        insta,
        linkedin,
        notion,
        notionWhite,
        playstore,
        react,
        tailwind,
        tas,
        tbb,
        tbbLogo,
        ts,
        twitter,
        valorant,
        zu,
        zuLogo
      ];
}

class Assets {
  Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const String iconDark = 'assets/icon_dark.svg';
  static const String iconLight = 'assets/icon_light.svg';
  static const String logoDark = 'assets/logo_dark.svg';
  static const String logoLight = 'assets/logo_light.svg';
  static const $AssetsLogosGen logos = $AssetsLogosGen();
  static const AssetGenImage profile = AssetGenImage('assets/profile.png');

  /// List of all assets
  List<dynamic> get values =>
      [iconDark, iconLight, logoDark, logoLight, profile];
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}
