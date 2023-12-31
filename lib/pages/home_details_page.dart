// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_project_1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_project_1/models/catalog.dart';
class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:  Container(
        color: Colors.white,
        child: ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: Vx.mH8,
                  children: [
                    "\$${catalog.price}".text.bold.xl4.red800.make(),
                    ElevatedButton(onPressed:(){},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(MyTheme.darkBluishColor),
                      shape: MaterialStateProperty.all(const StadiumBorder(),)
                    ),
                  
                     child: "Add to cart".text.make()
                     ).wh(120, 50)
                  ],
                ).p32(),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: MyTheme.creamColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image)
              ).h32(context),
              Expanded(
                child: VxArc(
                  height: 30.0,
                  
                  arcType: VxArcType.convey,
                  edge: VxEdge.top,
                  child: Container(
                    width: context.screenWidth,
                    color: Colors.white,
                    child: Column(
                      children: [
                        catalog.name.text.xl4.color(MyTheme.darkBluishColor).bold.make(),
                        catalog.desc.text.textStyle(context.captionStyle).xl.make(),
                        10.heightBox,
                        "Labore et dolores nonumy diam kasd diam. Sadipscing ut est magna ipsum dolor consetetur amet dolore consetetur. Voluptua invidunt ipsum sed amet justo, et sed consetetur et sanctus. Eos rebum sed diam diam est. Amet dolores sea et sed, ipsum sit magna stet sed est diam ipsum sadipscing. Sed takimata."
                        .text.textStyle(context.captionStyle).make().p16(),
                      ],
                    ).py64(),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
