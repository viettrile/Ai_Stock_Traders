import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'bindings/initial_binding.dart';
import 'core/core.dart';
import 'routers/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      path: LocaleConstants.path,
      startLocale: LocaleConstants.vi,
      useOnlyLangCode: true,
      supportedLocales: const [
        LocaleConstants.vi,
        LocaleConstants.en,
      ],
      child: Builder(
        builder: (context) {
          return ScreenUtilInit(
            designSize: const Size(375, 812),
            enableScaleWH: () => true,
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              return GetMaterialApp(
                title: 'Flutter Demo',
                theme: AppThemes.lightTheme,
                getPages: AppPages.pages,
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                initialBinding: InitialBinding(),
                initialRoute: AppPages.initPage,
                debugShowCheckedModeBanner: false,
                builder: (context, widget) {
                  ScreenUtil.init(context);
                  return widget!;
                },
              );
            },
          );
        },
      ),
    );
  }
}
