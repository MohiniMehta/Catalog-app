class DatalogModel{
static final items=[Item(
  id: 1,
   name: "iPhone 12 Pro",
    desc: "Apple Iphone 12th generation",
     price: 999, 
     color: "33505a",
      image: "https://th.bing.com/th/id/OIP.1EkDbhtuD0YW-h1G3XowXAHaHa?pid=ImgDet&rs=1")];
}


class Item{
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item({required this.id, required this.name, required this.desc, required this.price, required this.color, required this.image}); 
}
