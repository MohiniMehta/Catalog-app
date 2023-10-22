import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_project_1/models/catalog.dart";
import "package:flutter_project_1/widgets/drawer.dart";
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
        appBar: AppBar(
          title: const Text('My App',style: TextStyle(color: Colors.black),),
        ),
        // ignore: unnecessary_null_comparison
        body:(DatalogModel.items!=null && DatalogModel.items.isNotEmpty)? 
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
          ),
          itemBuilder: (context,index){
            final item=DatalogModel.items[index];
            return Card(
              clipBehavior: Clip.antiAlias,
              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: GridTile(
                header: Container(decoration: const BoxDecoration(
                  color:Colors.deepPurple,
                 ),child: Text(item.name, style: const TextStyle(color: Colors.white),),
                 ),
                footer: Container(decoration: const BoxDecoration(
                  color:Colors.black,
                 ),child: Text(item.price.toString(), style: const TextStyle(color: Colors.white),),
                 ),
                child: Image.network(item.image),
              )
              );
          }, 
          itemCount: DatalogModel.length,
         )
         :const Center(child: CircularProgressIndicator(),),
        drawer: const MyDrawer(),
      );
  }
}