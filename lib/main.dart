import 'package:flutter/material.dart';
import 'package:flutter_application_1/main_layout.dart';
import 'package:flutter_application_1/screens/auth_page.dart';
import 'package:flutter_application_1/screens/booking_page.dart';
import 'package:flutter_application_1/screens/doctor_details.dart';
import 'package:flutter_application_1/screens/success.booked.dart';
import 'package:flutter_application_1/utils/config.dart';


void main(){
 return runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // this is for pysh navigator 
  static final navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // pre-define input decoration 
        inputDecorationTheme: const InputDecorationTheme(
          focusColor: Config.primaryColor,
          border: Config.OutlinedBorder,
          focusedBorder: Config.focusBorder,
          errorBorder: Config.errorBorder,
          enabledBorder: Config.OutlinedBorder,
          floatingLabelStyle: TextStyle(color:Config.primaryColor),
          prefixIconColor: Colors.black38,
        ),
        scaffoldBackgroundColor: Colors.white,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Config.primaryColor,
          selectedItemColor: Colors.white,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          unselectedItemColor: Colors.grey.shade700,
          elevation: 10,
          type: BottomNavigationBarType.fixed,
        )
      ),
      initialRoute: '/',
      routes: {
        // this is initial route of the app 
        // which is auth page (login and sign up )
        // kon sers aub ha -,-

        '/':(context) => const AuthPage(),
        // this is for main layout after login 

        'main':(context)=> const MainLayout(),
        'doc_details':(context) => const DoctorDetails(),
        'booking_page':(context) => const  BookingPage(),
        'success_booking':(context) => const AppointmentBooked()
      },
    );
  }
}



