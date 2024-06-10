import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:save_a_life_2024/admin_cubit/cubit.dart';
import 'package:save_a_life_2024/shared/components/localization/appLocal.dart';
import 'package:save_a_life_2024/shared/style/themes.dart';
import 'package:save_a_life_2024/splash_screen/splash_screen.dart';
import 'package:save_a_life_2024/user_layouts/user_cubit/userCubit.dart';
import 'package:save_a_life_2024/user_layouts/user_cubit/userStatus.dart';
import 'package:save_a_life_2024/admin_layouts/users_donors_list/users_donors_list.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(

      providers: [
        BlocProvider( create: (BuildContext context) => UserCubit()..getPosition(context),),
        BlocProvider( create: (BuildContext context) => AdminCubit())
      ],
      child: BlocConsumer<UserCubit,UserStatus>(
          listener: (context , state){},
          builder: (context , state){
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: lightTheme ,
              home: const SplashScreen(),
              localizationsDelegates:const[
                AppLocale.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const[
                Locale("ar",""),
                Locale("en",""),
              ],
              locale: Locale("ar",""),
              localeResolutionCallback: (currentLang , supportedLang){
                if(currentLang != null){
                  for(Locale locale in supportedLang){
                    if (locale.languageCode == currentLang.languageCode){
                      return currentLang;
                    }
                  }
                }
                return supportedLang.first;
              },
            );
          }
      ),
    );
  }
}

