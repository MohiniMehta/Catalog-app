import 'package:flutter/material.dart';
import 'package:flutter_project_1/models/catalog.dart';
import 'package:flutter_project_1/pages/home_details_page.dart';
//import 'package:flutter_project_1/pages/home_page.dart';
import 'package:flutter_project_1/widgets/home_widgets/catalog_image.dart';
import 'package:flutter_project_1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: DatalogModel.items.length,
      itemBuilder: (context,index){
        final catalog=DatalogModel.items[index];
        return InkWell(
          onTap:()=>Navigator.push(
                    context, MaterialPageRoute(
            builder: (context)=>HomeDetailPage(
              catalog: catalog
            )
            )
            ),
          child: Catalogitem(catalog: catalog
          )
          );
      },
    );
  }
}
class Catalogitem extends StatelessWidget {
  final Item catalog;
  const Catalogitem({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero
          (
            tag: Key(catalog.id.toString()),
            child: Catalogimage(image: catalog.image,
            )
            ),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.lg.color(MyTheme.darkBluishColor).bold.make(),
              catalog.desc.text.textStyle(context.captionStyle).make(),
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: Vx.mH8,
                children: [
                  "\$${catalog.price}".text.bold.xl.make(),
                  ElevatedButton(onPressed:(){},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(MyTheme.darkBluishColor),
                    shape: MaterialStateProperty.all(const StadiumBorder(),)
                  ),
                
                   child: "Buy".text.make())
                ],
              )
            ],
          ))
        ],
      ),
    ).white.roundedLg.square(150).make().py16();
  }
}