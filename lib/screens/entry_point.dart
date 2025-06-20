import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopfee_app/constants/constants.dart';
import 'package:shopfee_app/screens/account/views/account_screen.dart';
import 'package:shopfee_app/screens/history/views/history_orders_screen.dart';
import 'package:shopfee_app/screens/home/views/home_screen.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {
  final List _pages = const [
    HomeScreen(),
    HistoryOrdersScreen(),
    AccountScreen(),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageTransitionSwitcher(
        duration: defaultDuration,
        transitionBuilder: (child, animation, secondAnimation) {
          return FadeThroughTransition(
            animation: animation,
            secondaryAnimation: secondAnimation,
            child: child,
          );
        },
        child: _pages[currentIndex],
      ),
      bottomNavigationBar: Container(
        height: 60,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 1,
              blurRadius: 8,
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            if (index != currentIndex) {
              setState(() {
                currentIndex = index;
              });
            }
          },
          backgroundColor: Colors.transparent,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 0, 
          unselectedFontSize: 0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset("/icons/home.png",
                      width: 24,height: 24,color: currentIndex == 0 ? primaryColor : const Color(0xFF999999)),
                  const SizedBox(height: 8),
                  Text(
                    "Home",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: currentIndex == 0 ? primaryColor : const Color(0xFF999999),
                    ),
                  )
                ],
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset("/icons/history.png", width: 30,height: 30,color: currentIndex == 1 ? primaryColor : const Color(0xFF999999)),
                  const SizedBox(height: 4),
                  Text(
                    "History",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: currentIndex == 1 ? primaryColor : const Color(0xFF999999),
                    ),
                  )
                ],
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset("/icons/account.png", width: 24,height: 24,color: currentIndex == 1 ? primaryColor : const Color(0xFF999999)),
                  const SizedBox(height: 8),
                  Text(
                    "Account",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: currentIndex == 2 ? primaryColor : const Color(0xFF999999),
                    ),
                  )
                ],
              ),
              label: "",
            ),
          ],
        ),
      ),
    );
  }
}
