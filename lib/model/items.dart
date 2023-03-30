class Item{
  int id;
  String title;
  num price;
  String image;
  int quantity;
  int itemAdded;

Item({
  required this.id,
  required this.title,
  required this.price,
  required this.image,
  required this.quantity,
  required this.itemAdded,
});

factory Item.fromJson(Map<String, dynamic> parsedJson) {
    return Item(
        id: parsedJson["id"],
        title: parsedJson["title"],
        price: parsedJson["price"],
        image: parsedJson["image"],
        quantity: 1,
        itemAdded: 0);
  }

factory Item.fromjson(Map<String, dynamic>parsedjson){
  return 
  Item(
    id: parsedjson['id'],
    title: parsedjson['title'],
    price: parsedjson['price'],
    image: parsedjson['image'],
    quantity: parsedjson['quantity'],
    itemAdded: parsedjson['itemAdded'],
  );
}

toJson(){
  Map<String, dynamic> json = {};
  json['id'] = id;
    json['title'] = title;
    json['price'] = price;
    json['image'] = image;
    json['quantity'] = quantity;
    json['itemAdded'] = itemAdded;
    return json;
}

static List itemList(List item) {
  List items = [];
  for (var i = 0; i < item.length; i++) {
    items.add(Item.fromjson(item[i]));
  }
  return items;
}

static List cartList(List item) {
    List item = [];
    for (var i = 0; i < item.length; i++) {
      item.add(Item.fromjson(item[i]));
    }
    return item;
  }
}

