// ignore_for_file: public_member_api_docs, sort_constructors_first
import "dart:convert";

import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_project_1/utils/routes.dart";
import 'package:flutter_project_1/widgets/home_widgets/catalog_header.dart';
import 'package:flutter_project_1/widgets/home_widgets/catalog_list.dart';
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
        floatingActionButton: FloatingActionButton(
        onPressed: ()=>Navigator.pushNamed(context, MyRoutes.cartRoute),
        backgroundColor: MyTheme.darkBluishColor,
        child: const Icon(CupertinoIcons.cart),
      ),
        // ignore: unnecessary_null_comparison
        body:SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                const CatalogHeader(),
                if(DatalogModel.items.isNotEmpty)
                  const CatalogList().py16().expand()
          
                else
                    Center(
                    child: const CircularProgressIndicator().centered().expand(),
                   )
                ],
            ),
          ),
        )
      );
  }
}

