// import '../providers/image_picker_provider.dart';

import 'package:flutter_task/providers/date_provider.dart';
import 'package:provider/provider.dart';

var providers = [
  ChangeNotifierProvider<DateProvider>(
    create: ((context) => DateProvider()),
  ),
];
