class Item{
  int id;
  String title;
  num price;
  String image;
  int quantity;


Item({
  required this.id,
  required this.title,
  required this.price,
  required this.image,
  required this.quantity,

});

factory Item.fromJson(Map<String, dynamic> parsedJson) {
    return Item(
        id: parsedJson["id"],
        title: parsedJson["title"],
        price: parsedJson["price"],
        image: parsedJson["image"],
        quantity: 1,);
  }

factory Item.cartfromjson(Map<String, dynamic>parsedjson){
  return 
  Item(
    id: parsedjson['id'],
    title: parsedjson['title'],
    price: parsedjson['price'],
    image: parsedjson['image'],
    quantity: parsedjson['quantity'],
  );
}

toJson(){
  Map<String, dynamic> json = {};
  json['id'] = id;
    json['title'] = title;
    json['price'] = price;
    json['image'] = image;
    json['quantity'] = quantity;
    return json;
}

static List itemList(List item) {
  List items = [];
  for (var i = 0; i < item.length; i++) {
    items.add(Item.fromJson(item[i]));
  }
  return items;
}

static List cartList(List item) {
    List items = [];
    for (var i = 0; i < item.length; i++) {
      items.add(Item.cartfromjson(item[i]));
    }
    return items;
  }
}

