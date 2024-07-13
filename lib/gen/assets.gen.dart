/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsColorsGen {
  const $AssetsColorsGen();

  /// File path: assets/colors/colors.xml
  String get colors => 'assets/colors/colors.xml';

  /// List of all assets
  List<String> get values => [colors];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/demo.png
  AssetGenImage get demo => const AssetGenImage('assets/icons/demo.png');

  /// List of all assets
  List<AssetGenImage> get values => [demo];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/profile.png
  AssetGenImage get profile => const AssetGenImage('assets/images/profile.png');

  /// List of all assets
  List<AssetGenImage> get values => [profile];
}

class $AssetsSvgsGen {
  const $AssetsSvgsGen();

  /// File path: assets/svgs/Bell.svg
  String get bell => 'assets/svgs/Bell.svg';

  /// File path: assets/svgs/Calendar.svg
  String get calendar => 'assets/svgs/Calendar.svg';

  /// File path: assets/svgs/Clock Circle.svg
  String get clockCircle => 'assets/svgs/Clock Circle.svg';

  /// File path: assets/svgs/Hamburger Menu.svg
  String get hamburgerMenu => 'assets/svgs/Hamburger Menu.svg';

  /// File path: assets/svgs/Home.svg
  String get home => 'assets/svgs/Home.svg';

  /// File path: assets/svgs/Map Point.svg
  String get mapPoint => 'assets/svgs/Map Point.svg';

  /// File path: assets/svgs/alert_success.svg
  String get alertSuccess => 'assets/svgs/alert_success.svg';

  /// File path: assets/svgs/back_arrow.svg
  String get backArrow => 'assets/svgs/back_arrow.svg';

  /// File path: assets/svgs/calendar_outline.svg
  String get calendarOutline => 'assets/svgs/calendar_outline.svg';

  /// File path: assets/svgs/calender_selected.svg
  String get calenderSelected => 'assets/svgs/calender_selected.svg';

  /// File path: assets/svgs/camera.svg
  String get camera => 'assets/svgs/camera.svg';

  /// File path: assets/svgs/circular_profile_edit.svg
  String get circularProfileEdit => 'assets/svgs/circular_profile_edit.svg';

  /// File path: assets/svgs/company_tf.svg
  String get companyTf => 'assets/svgs/company_tf.svg';

  /// File path: assets/svgs/demo 1.svg
  String get demo1 => 'assets/svgs/demo 1.svg';

  /// File path: assets/svgs/front_arrow_ios.svg
  String get frontArrowIos => 'assets/svgs/front_arrow_ios.svg';

  /// File path: assets/svgs/location_outline.svg
  String get locationOutline => 'assets/svgs/location_outline.svg';

  /// File path: assets/svgs/location_tf.svg
  String get locationTf => 'assets/svgs/location_tf.svg';

  /// File path: assets/svgs/menu1.svg
  String get menu1 => 'assets/svgs/menu1.svg';

  /// File path: assets/svgs/menu2.svg
  String get menu2 => 'assets/svgs/menu2.svg';

  /// File path: assets/svgs/menu3.svg
  String get menu3 => 'assets/svgs/menu3.svg';

  /// File path: assets/svgs/menu4.svg
  String get menu4 => 'assets/svgs/menu4.svg';

  /// File path: assets/svgs/menu5.svg
  String get menu5 => 'assets/svgs/menu5.svg';

  /// File path: assets/svgs/notification_badge.svg
  String get notificationBadge => 'assets/svgs/notification_badge.svg';

  /// File path: assets/svgs/person.svg
  String get person => 'assets/svgs/person.svg';

  /// File path: assets/svgs/profile.svg
  String get profile => 'assets/svgs/profile.svg';

  /// File path: assets/svgs/profile_tf.svg
  String get profileTf => 'assets/svgs/profile_tf.svg';

  /// File path: assets/svgs/selected_home.svg
  String get selectedHome => 'assets/svgs/selected_home.svg';

  /// File path: assets/svgs/time.svg
  String get time => 'assets/svgs/time.svg';

  /// List of all assets
  List<String> get values => [
        bell,
        calendar,
        clockCircle,
        hamburgerMenu,
        home,
        mapPoint,
        alertSuccess,
        backArrow,
        calendarOutline,
        calenderSelected,
        camera,
        circularProfileEdit,
        companyTf,
        demo1,
        frontArrowIos,
        locationOutline,
        locationTf,
        menu1,
        menu2,
        menu3,
        menu4,
        menu5,
        notificationBadge,
        person,
        profile,
        profileTf,
        selectedHome,
        time
      ];
}

class Assets {
  Assets._();

  static const $AssetsColorsGen colors = $AssetsColorsGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsSvgsGen svgs = $AssetsSvgsGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

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

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
