import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_project_1/models/catalog.dart";
import "package:flutter_project_1/widgets/drawer.dart";
import "package:flutter_project_1/widgets/item_widget.dart";
import "dart:convert";

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
    final catalogJson=await rootBundle.loadString("assets/files/catalog.json");
    final decodedData=jsonDecode(catalogJson);
    var productsData=decodedData["products"];
  }
  @override
  Widget build(BuildContext context) {
    final dummyList=List.generate(20,(index)=>DatalogModel.items[0]);
    return Scaffold(
        appBar: AppBar(
          title: const Text('My App',style: TextStyle(color: Colors.black),),
        ),
        body: ListView.builder(
          itemCount: dummyList.length,
          itemBuilder: (context, index) {
            return ItemWidget(
              item: dummyList[index],
            );
          },
        ),
        drawer: const MyDrawer(),
      );
  }
}