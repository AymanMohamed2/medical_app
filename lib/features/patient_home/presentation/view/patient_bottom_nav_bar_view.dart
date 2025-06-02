import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medical_app/core/theme/app_colors.dart';
import 'package:medical_app/core/utils/app_strings.dart';
import 'package:medical_app/features/alerts/presentation/views/alerts_view.dart';
import 'package:medical_app/features/patient_home/presentation/view/home_view.dart';
import 'package:medical_app/features/patient_profile/presentation/view/profile_view.dart';
import 'package:medical_app/features/patient_home/presentation/view/search_view.dart';

class PatientBottomNavBarView extends StatefulWidget {
  const PatientBottomNavBarView({super.key});

  @override
  State<PatientBottomNavBarView> createState() =>
      _PatientBottomNavBarViewState();
}

class _PatientBottomNavBarViewState extends State<PatientBottomNavBarView> {
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
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12,
        backgroundColor: AppColors.white,
        elevation: 0,
        iconSize: 32,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: FaIcon(_index != 0 ? Icons.home_outlined : Icons.home),
              label: AppStrings.home),
          BottomNavigationBarItem(
              icon: FaIcon(_index != 1 ? Icons.search : Icons.search),
              label: AppStrings.search),
          BottomNavigationBarItem(
              icon: _index != 2
                  ? Icon(Icons.notifications_outlined)
                  : Icon(Icons.notifications),
              label: AppStrings.alerts),
          BottomNavigationBarItem(
              icon: _index != 3
                  ? Icon(Icons.person_outlined)
                  : Icon(Icons.person),
              label: AppStrings.profile),
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
