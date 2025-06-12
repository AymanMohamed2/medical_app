import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/core/models/send_message_request_model/send_message_request_model.dart';
import 'package:medical_app/core/widgets/custom_text_form_field%20copy.dart';
import 'package:medical_app/features/chat/presentation/view_model/send_message_cubit/send_message_cubit.dart';

class CustomInputForm extends StatefulWidget {
  const CustomInputForm({
    super.key,
    required this.formKey,
    required this.textController,
  });
  final GlobalKey<FormState> formKey;
  final TextEditingController textController;
  @override
  State<CustomInputForm> createState() => _CustomInputFormState();
}

class _CustomInputFormState extends State<CustomInputForm> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SendMessageCubit, SendMessageState>(
      builder: (context, state) {
        return Form(
          key: widget.formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: CustomTextFormField(
                onChanged: (value) {
                  setState(() {});
                },
                onSaved: (message) async {
                  await sendMessage(context);
                },
                controller: widget.textController,
                isEnabled: state is! SendMessageLoading,
                hintText: 'Ask your question...',
                suffixIcon: InkWell(
                  onTap: state is SendMessageLoading
                      ? null
                      : () async {
                          if (widget.textController.text.isNotEmpty) {
                            await sendMessage(context);
                          }
                        },
                  // onLongPress: state is SendMessageLoading
                  //     ? null
                  //     : () async {
                  //         if (widget.textController.text.isNotEmpty) {
                  //           await sendMessage(context);
                  //         } else {
                  //           await BlocProvider.of<SendMessageCubit>(context)
                  //               .recordText(context,
                  //                   textController: widget.textController);
                  //         }
                  //       },
                  child: const Icon(Icons.send,
                      color: Color.fromARGB(255, 171, 171, 171)),

                  // widget.textController.text.isNotEmpty
                  //     ? const Icon(Icons.send,
                  //         color: Color.fromARGB(255, 171, 171, 171))
                  //     : const Icon(Icons.mic,
                  //         color: Color.fromARGB(255, 171, 171, 171)),
                )),
          ),
        );
      },
    );
  }

  Future<void> sendMessage(BuildContext context) async {
    if (widget.formKey.currentState!.validate()) {
      String text = widget.textController.text;
      widget.textController.clear();
      SendMessageRequestModel sendMessageRequestModel =
          SendMessageRequestModel(message: text);

      await BlocProvider.of<SendMessageCubit>(context)
          .sendMessage(sendMessageRequestModel: sendMessageRequestModel);
    }
  }
}
