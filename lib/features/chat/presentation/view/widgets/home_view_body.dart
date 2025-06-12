import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:medical_app/features/chat/presentation/view/widgets/custom_app_bar.dart';
import 'package:medical_app/features/chat/presentation/view/widgets/form_field_bloc_builder.dart';
import 'package:medical_app/features/chat/presentation/view/widgets/messages_list_view_bloc_builder.dart';

class ChatViewBody extends StatelessWidget {
  const ChatViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          CustomAppBar(),
          MessagesListViewBlocBuilder(),
          FormFiledBlocBuilder(),
          SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }
}
