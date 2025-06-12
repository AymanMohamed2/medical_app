import 'package:flutter/material.dart';
import 'package:medical_app/features/chat/presentation/view/chat_view.dart';
import 'package:medical_app/features/patient_home/presentation/view/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => const ChatView(),
            ),
          );
        }),
        body: HomeViewBody(),
      ),
    );
  }
}
