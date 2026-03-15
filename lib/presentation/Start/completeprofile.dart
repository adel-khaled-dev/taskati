import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/core/colors/colors.dart';
import 'package:taskati/core/widgets/image.dart';
import 'package:taskati/core/services/share_preferences.dart';
import 'package:taskati/core/widgets/button.dart';
import 'package:taskati/core/widgets/dilogerror.dart';
import 'package:taskati/core/widgets/extension.dart';
import 'package:taskati/core/widgets/filed_text.dart';
import 'package:taskati/core/widgets/icon_app.dart';
import 'package:taskati/core/widgets/tob_button.dart';
import 'package:taskati/presentation/home/page/home.dart';
import 'package:taskati/styles/styles.dart';

class Completeprofile extends StatefulWidget {
  const Completeprofile({super.key});

  @override
  State<Completeprofile> createState() => _CompleteprofileState();
}

class _CompleteprofileState extends State<Completeprofile> {
  String? path;
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(bottom: 32.0),
          child: Text("Complete Your Profile", style: TextStyles.titel),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              54.h,
              Row(
                children: [
                  Text(
                    "Profile Image",
                    style: TextStyles.hinttext.copyWith(
                      color: ColorsApp.grey,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              21.h,
              Stack(
                children: [
                  CircleAvatar(
                    radius: 85,
                    child: ClipOval(
                      child: path != null
                          ? Image.file(
                              File(path!),
                              width: 170,
                              height: 170,
                              fit: BoxFit.cover,
                            )
                          : Image.asset(
                              ImagesApp.user,
                              fit: BoxFit.cover,
                              width: 170,
                              height: 170,
                            ),
                    ),
                  ),
                  if (path != null)
                    Positioned(
                      bottom: 5,
                      right: 5,
                      child: InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog.adaptive(
                                title: Text("Delete Image"),
                                content: Text(
                                  "Are you sure you want to delete this image?",
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("No"),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        path = null;
                                      });
                                      Navigator.pop(context);
                                    },
                                    child: Text("Yes"),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: ColorsApp.white,
                          child: SvgPicture.asset(IconApp.icondelete),
                        ),
                      ),
                    ),
                ],
              ),
              34.h,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TobButton(
                    name: "From Camera",
                    onPressed: () async {
                      var image = await ImagePicker().pickImage(
                        source: ImageSource.camera,
                      );
                      if (image != null) {
                        setState(() {
                          path = image.path;
                        });
                      }
                    },
                  ),
                  12.w,
                  TobButton(
                    name: "From Gallery",
                    onPressed: () async {
                      var image = await ImagePicker().pickImage(
                        source: ImageSource.gallery,
                      );
                      if (image != null) {
                        setState(() {
                          path = image.path;
                        });
                      }
                    },
                  ),
                ],
              ),
              54.h,
              Row(
                children: [
                  Text(
                    "Your Name",
                    style: TextStyles.hinttext.copyWith(
                      color: ColorsApp.grey,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              8.h,
              FiledText(hint: "Your Name", controller: controller),
              150.h,
              Button(
                name: "Let’s Start !",
                onPressed: () async {
                  if (controller.text.isNotEmpty && path != null) {
                    Sharedprefs.informdata(controller.text, path!);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                    );
                  } else if (controller.text.isEmpty && path != null) {
                    showError(context, "Enter name");
                  } else if (path == null && controller.text.isNotEmpty) {
                    showError(context, "Enter image");
                  } else {
                    showError(context, "Enter name and image");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
