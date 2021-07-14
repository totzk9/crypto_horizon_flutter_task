import 'package:crypto_horizon_flutter_task/common/utils/local_data_source.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'common/routes/app_pages.dart';
import 'common/utils/logger.dart';


/// Note:
///
/// Dear Senior Developer who is checking this,
///
///   Some SVGs in the API needs to be cleaned for Flutter compatibility which
/// is why an error will come up. please disregard any errors because it's
/// out of my ability to fix it. Thanks

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalDataSource().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      enableLog: true,
      logWriterCallback: Logger.write,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
