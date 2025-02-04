import 'package:canteen/backend_data.dart';
import 'package:canteen/cubit/canteen_cubit.dart';
import 'package:canteen/screens/Authentication/login_signup.dart';
import 'package:canteen/screens/Orders/pending_orders.dart';
import 'package:canteen/screens/cart.dart';
import 'package:canteen/screens/email_verify_screen.dart';
import 'package:canteen/screens/homepage.dart';

import 'package:canteen/screens/order_details.dart';
import 'package:canteen/screens/profile.dart';
import 'package:canteen/screens/Admin/scanned_details.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screens/Authentication/loading.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(BlocProvider(
    create: (context) => CanteenCubit(),
    child: MyApp(),
  ));
}

List<List> cart_list = [];
String canteenId = "";

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Canteen',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xffF5F5F8),
        fontFamily: "Gilroy",
        textTheme: TextTheme(bodyText2: TextStyle(color: Colors.black)),
      ),
      // home: EmailverificationScreen(),
      routes: {
        '/homepage': (context) => const HomePage(),
        '/loadingscreen': (context) => const LoadingPage(),
      },
      initialRoute: '/loadingscreen',
    );
  }
}
