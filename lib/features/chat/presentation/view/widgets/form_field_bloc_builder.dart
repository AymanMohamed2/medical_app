import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/features/chat/presentation/view/widgets/custom_input_form.dart';
import 'package:medical_app/features/chat/presentation/view/widgets/recording_widget.dart';
import 'package:medical_app/features/chat/presentation/view_model/send_message_cubit/send_message_cubit.dart';

class FormFiledBlocBuilder extends StatefulWidget {
  const FormFiledBlocBuilder({super.key});

  @override
  State<FormFiledBlocBuilder> createState() => _FormFiledBlocBuilderState();
}

class _FormFiledBlocBuilderState extends State<FormFiledBlocBuilder> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SendMessageCubit, SendMessageState>(
      builder: (context, state) {
        if (state is SendMessageRecording) {
          return const RecordingWidget();
        } else {
          return Padding(
            padding: const EdgeInsets.only(top: 8),
            child: CustomInputForm(
              formKey: formKey,
              textController: textController,
            ),
          );
        }
      },
    );
  }
}
