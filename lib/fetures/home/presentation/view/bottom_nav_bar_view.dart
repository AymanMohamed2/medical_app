import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medical_app/core/theme/app_colors.dart';
import 'package:medical_app/fetures/alerts/presentation/views/alerts_view.dart';
import 'package:medical_app/fetures/home/presentation/view/home_view.dart';
import 'package:medical_app/fetures/profile/presentation/view/profile_view.dart';
import 'package:medical_app/fetures/search/presentation/view/search_view.dart';

class BottomNavBarView extends StatefulWidget {
  const BottomNavBarView({super.key});

  @override
  State<BottomNavBarView> createState() => _BottomNavBarViewState();
}

class _BottomNavBarViewState extends State<BottomNavBarView> {
  int _index = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomeView(),
    SearchView(),
    AlertsView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_index),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        iconSize: 32,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: FaIcon(_index != 0 ? Icons.home : Icons.home_outlined),
              label: ''),
          BottomNavigationBarItem(
              icon: FaIcon(_index != 1 ? Icons.search : Icons.search),
              label: ''),
          BottomNavigationBarItem(
              icon: FaIcon(
                  _index != 2 ? FontAwesomeIcons.bell : FontAwesomeIcons.bell),
              label: ''),
          BottomNavigationBarItem(
              icon: FaIcon(
                _index != 3 ? FontAwesomeIcons.user : FontAwesomeIcons.user,
              ),
              label: ''),
        ],
        unselectedItemColor: AppColors.inactiveColor,
        currentIndex: _index,
        selectedItemColor: AppColors.activeColor,
        onTap: _onTapped,
      ),
    );
  }

  _onTapped(value) {
    setState(() {
      _index = value;
    });
  }
}
