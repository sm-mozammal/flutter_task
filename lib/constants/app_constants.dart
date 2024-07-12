import '../gen/assets.gen.dart';

class OrderStatusNo {
  static const String kPENDING = '0'; //order just placed
  static const String kACCEPTED = '10'; //after accepted by shop owner
  static const String kFOODPROCESSING = '20';
  static const String kFOODREADY = '21';
  static const String kFOODPICKED = '30';
  static const String kFOODDELIVERED = '40';
  static const String kCANCELLED = '80';
  static const String kREJECTEDBYSHOP = '90';
  static const String kFAILED = '100';
  static const String kALL = 'all';
}

List<Map<String, String>> menu = [
  {'title': 'মেনু নং\n০০০০১', 'image': Assets.svgs.person},
  {'title': 'মেনু নং\n০০০০২', 'image': Assets.svgs.menu1},
  {'title': 'মেনু নং\n০০০০৩', 'image': Assets.svgs.menu2},
  {'title': 'মেনু নং\n০০০০৪', 'image': Assets.svgs.menu3},
  {'title': 'মেনু নং\n০০০০৫', 'image': Assets.svgs.menu4},
  {'title': 'মেনু নং\n০০০০৬', 'image': Assets.svgs.menu5},
];

const String kImageUrl = 'imageUrl';

class DefaultValue {
  static const bool kDefaultBoolean = false;
  static const int kDefaultInt = 0;
  static const double kDefaultDouble = 0.0;
  static const String kDefaultString = '';
}
