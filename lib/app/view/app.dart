import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:turnos_rotativos/app/routes/router.dart';
import 'package:turnos_rotativos/core/controllers/bloc_providers/bloc_providers.dart';
import 'package:turnos_rotativos/core/controllers/providers/multi_providers.dart';
import 'package:turnos_rotativos/core/controllers/repository_providers/repository_providers.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Providers(
      child: RepositoryProviders(
        child: BlocProviders(
          child: ScreenUtilInit(
            minTextAdapt: true,
            splitScreenMode: true,
            child: Builder(builder: (context) {
              return MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(textScaler: TextScaler.linear(1.0)),
                child: MaterialApp.router(
                  // theme: lightTheme,
                  themeMode: ThemeMode.light,
                  debugShowCheckedModeBanner: true,
                  routerConfig: router,
                  locale: const Locale('es', 'ES'),
                  supportedLocales: const [
                    Locale('es', 'ES'),
                  ],
                  localizationsDelegates: [
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}