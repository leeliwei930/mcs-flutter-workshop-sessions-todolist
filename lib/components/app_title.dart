import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/utils/text_styles.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Icon(Icons.edit, color: Colors.white, size: 24,),
        SizedBox(
          width: 10,
        ),
        Text("todo_title".tr, style: kAppTitleTextStyle.copyWith(color: Colors.white))
      ],
    );
  }
}
