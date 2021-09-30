enum ElementCardImages {
  rastvor,
  beton,
  gidrobeton,
  betonanasos,
  jbi,
  bloc_build,
  ascel,
  luki,
  luki_chugun,
  develop
}

class ElementCard {
  late String categoryId;
  late String categoryName;
  late String type;
  late String imagepath = "";
  late List<CategoryList> categoryList;
  CategoryList? _selectedElement;

  final List<String> pathImageUrl = [
    "https://chernomorbeton.ru/wp-content/uploads/2018/11/kupit-cementnyj-rastvor-v-anape-i-anapskom-rajone.jpg", //rastvor,
    "https://chernomorbeton.ru/wp-content/uploads/2018/11/kupit-beton-v-anape-i-anapskom-rajone.jpg", // beton
    "https://chernomorbeton.ru/wp-content/uploads/2018/11/kupit-gidrotexnicheskij-beton-v-anape-i-anapskom-rajone.jpg", // gidrobeton
    "https://chernomorbeton.ru/wp-content/uploads/2018/11/1522152740_arenda_betononasosa_2.jpg",
    "https://chernomorbeton.ru/wp-content/uploads/2019/04/zavod-zhbi-oficialnyj-sajt-anapa-novorossijsk.jpg", // jbi
    "https://chernomorbeton.ru/wp-content/uploads/2019/04/proizvodstvo-stroitelnyx-blokov-1.jpg", //bloc_build
    "https://chernomorbeton.ru/wp-content/uploads/2019/04/asbestocementnye-truby-anapa-novorossijsk.jpg", // ascel
    "https://chernomorbeton.ru/wp-content/uploads/2019/04/kupit-plastikovyj-kanalizacionnyj-lyuk-anapa-novorossijsk.jpg", //luki,
    "https://chernomorbeton.ru/wp-content/uploads/2019/04/lyuk-kanalizacionnyj-chugunnyj-anapa-novorossijsk.jpg", // luki_chugun
    "https://chernomorbeton.ru/wp-content/uploads/2019/12/Рытье-котлована-с-перевозкой-грунта.jpg", //develop
  ];
  late String imageuri;
  ElementCard(
      {required this.categoryId,
      required this.categoryName,
      required this.type,
      required this.categoryList});

  ElementCard.fromJson(Map<String, dynamic> json) {
    categoryName = json['category_name'];
    type = json['type'];
    categoryId = json['category_id'];
    imagepath = getImageById();
    if (json['category_list'] != null) {
      categoryList = <CategoryList>[];
      json['category_list'].forEach((v) {
        categoryList.add(CategoryList.fromJson(v));
      });
    }
  }
  String getImageById() {
    switch (this.categoryId) {
      case "36":
        return pathImageUrl[ElementCardImages.rastvor.index];
      case "42":
        return pathImageUrl[ElementCardImages.beton.index];
      case "52":
        return pathImageUrl[ElementCardImages.gidrobeton.index];
      case "58":
        return pathImageUrl[ElementCardImages.betonanasos.index];
      case "64":
        return pathImageUrl[ElementCardImages.jbi.index];
      case "81":
        return pathImageUrl[ElementCardImages.bloc_build.index];
      case "94":
        return pathImageUrl[ElementCardImages.ascel.index];
      case "110":
        return pathImageUrl[ElementCardImages.luki.index];
      case "120":
        return pathImageUrl[ElementCardImages.luki_chugun.index];
      case "124":
        return pathImageUrl[ElementCardImages.develop.index];
    }

    return "https://chernomorbeton.ru/wp-content/uploads/2018/11/about-us.jpg";
  }

  void setCurrent(CategoryList current) {
    this._selectedElement = current;
  }

  CategoryList? getCurrent() {
    return this._selectedElement ?? null;
  }
}

class CategoryList {
  final String id;
  final String type;
  final String name;
  final String price;

  CategoryList(
      {required this.id,
      required this.type,
      required this.name,
      required this.price});

  factory CategoryList.fromJson(Map<String, dynamic> json) {
    return CategoryList(
        id: json['id'] as String,
        type: json['type'] as String,
        name: json['name'] as String,
        price: json['price'] as String);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['name'] = this.name;
    data['price'] = this.price;
    return data;
  }
}
