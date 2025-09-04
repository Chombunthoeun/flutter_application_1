import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/appoint_page.dart';
import 'package:flutter_application_1/screens/home_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  // variable declaration
  int currentPage = 0 ;
  final PageController _page = PageController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: PageView(
        controller: _page,
        onPageChanged: ((value){
          setState(() {
            // update page index then tab pressed / switch page
            currentPage = value;
          });
        }),
        children: const <Widget>[
          HomePage(),
          ApppointmentPage()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (page){
          setState(() {
            currentPage = page ;
            _page.animateToPage(
              page,
              duration: const Duration(microseconds: 500), 
              curve: Curves.easeInOut);

          });
        },
        items: const<BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.houseChimneyMedical),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.accusoft),
            label: 'Appointments'
          )
        ],
      ),
    );
  }
}