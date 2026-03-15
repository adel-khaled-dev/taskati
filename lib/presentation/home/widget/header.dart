import 'dart:io';
import 'package:flutter/material.dart';
import 'package:taskati/core/colors/colors.dart';
import 'package:taskati/core/widgets/image.dart';
import 'package:taskati/core/widgets/extension.dart';
import 'package:taskati/presentation/home/page/home.dart';
import 'package:taskati/styles/styles.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: image != null
              ? Image.file(
                  File(image!),
                  fit: BoxFit.cover,
                  width: 50,
                  height: 50,
                )
              : Image.asset(ImagesApp.user, width: 50, height: 50),
        ),
        16.w,
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hello!"),
            4.h,
            Text(
              name!,
              style: TextStyles.subtitel.copyWith(
                color: ColorsApp.black,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
