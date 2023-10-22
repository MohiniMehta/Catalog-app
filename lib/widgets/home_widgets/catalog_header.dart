import 'package:flutter/material.dart';
import 'package:flutter_project_1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               "Catalog app".text.xl5.bold.color(MyTheme.darkBluishColor).make(),
               "Trending product".text.xl2.make(),

              ],
            );
  }
}