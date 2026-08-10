import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malam/core/constans/appcolor.dart';
import 'package:malam/feature/auth/cubit/cubit_auth.dart';
import 'package:malam/feature/auth/cubit/cubit_profile.dart';
import 'package:malam/feature/checkinternet/cubit/cubit_checkinternet.dart';
import 'package:malam/feature/home/cubit/home_cubit.dart';
import 'package:malam/feature/home/cubit/notification_cubit.dart';
import 'package:malam/feature/messages/cubit/cubit_getmessage.dart';
import 'package:malam/feature/messages/cubit/cubit_message.dart';
import 'package:malam/feature/order/cubit/cubit_order.dart';
import 'package:malam/feature/technical/cubit/cubit_technical.dart';
import 'package:malam/splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => InternetCubit()),
        BlocProvider(create: (context) => CubitAuth()),
        BlocProvider(create: (context) => CubitHome()..getservice()),
        BlocProvider(
          create: (context) => CubitTechnical()
            ..gettechnical()
            ..getonetechnical(),
        ),
        BlocProvider(create: (context) => CubitProfile()),
        BlocProvider(create: (context) => CubitOrder()),
        BlocProvider(create: (context) => CubitMessage()),
          BlocProvider(create: (context) => CubitGetmessage()),
          BlocProvider(create: (context) => CubitNotification()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          bottomSheetTheme: BottomSheetThemeData(
            backgroundColor: Appcolor.backgroundColor,
          ),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          fontFamily: 'Cairo',
        ),
        home: Splash(),
      ),
    );
  }
}
