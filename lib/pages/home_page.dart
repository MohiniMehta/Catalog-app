// ignore_for_file: public_member_api_docs, sort_constructors_first
import "dart:convert";

import "package:flutter/material.dart";
import "package:flutter/services.dart";
import 'package:velocity_x/velocity_x.dart';

import "package:flutter_project_1/models/catalog.dart";
import "package:flutter_project_1/widgets/themes.dart";
//import "package:flutter_project_1/widgets/drawer.dart";

 class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }
  loadData() async{
    await Future.delayed(const Duration(seconds: 2));
    final catalogJson=await rootBundle.loadString("assets/files/catalog.json");
    final decodedData=jsonDecode(catalogJson);
    var productsData=decodedData["products"];
    DatalogModel.items=List.from(productsData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyTheme.creamColor,
        // ignore: unnecessary_null_comparison
        body:SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                const CatalogHeader(),
                if(DatalogModel.items.isNotEmpty)
                  const CatalogList().expand()
          
                else
                   const Center(
                    child: CircularProgressIndicator(),
                   )
                ],
            ),
          ),
        )
      );
  }
}
class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: DatalogModel.items.length,
      itemBuilder: (context,index){
        final catalog=DatalogModel.items[index];
        return Catalogitem(catalog: catalog);
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
          Catalogimage(image: catalog.image,),
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
