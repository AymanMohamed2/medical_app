import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medical_app/core/utils/assets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          Assets.imagesLogo,
          height: 70,
        )
        // Text(
        //   'New Chat',
        //   style: AppStyles.styleBold20,
        // ),
      ],
    );
  }
}
