import 'package:flutter/material.dart';
import 'package:flutter_project_1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class Catalogimage extends StatelessWidget {
  const Catalogimage({
    Key? key,
    required this.image,
  }) : super(key: key);
  final String image;
  @override
  Widget build(BuildContext context) {
    return Image.network(image,
          ).box.rounded.p8.color(MyTheme.creamColor).make().p16().w40(context);
  }
}