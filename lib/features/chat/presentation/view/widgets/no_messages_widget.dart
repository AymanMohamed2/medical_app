import 'package:flutter/material.dart';
import 'package:medical_app/core/theme/app_styles.dart';
import 'package:medical_app/features/chat/presentation/view/widgets/welcome_text.dart';

class NoMessagesWidget extends StatelessWidget {
  const NoMessagesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 15, top: 50),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const WelcomeText(),
              Text(
                'How can i help you Today?',
                style: AppStyles.styleBold35.copyWith(
                  fontSize: 29,
                  color: const Color.fromARGB(255, 86, 91, 89),
                ),
              ),
              const SizedBox(height: 30),
              Container(
                margin: const EdgeInsets.only(right: 15),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                    color: const Color(0xff444746).withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  "This intelligent assistant is here to support you in understanding your real-time health data, including blood pressure, oxygen levels, and ECG readings. Whether you're managing a chronic condition or just checking your current status, it can help explain what the numbers mean, alert you to potential issues, and guide you on when it might be time to reach out to a doctor. Feel free to ask anything — your health insights are just a message away.",
                  style: AppStyles.styleRegular14.copyWith(
                    color: const Color.fromARGB(255, 113, 130, 189)
                        .withOpacity(0.85),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
