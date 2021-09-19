class ElementCard {
  late String categoryId;
  late String categoryName;
  late String type;
  late List<CategoryList> categoryList;
  ElementCard(
      {required this.categoryId,
      required this.categoryName,
      required this.type,
      required this.categoryList});

  ElementCard.fromJson(Map<String, dynamic> json) {
    categoryName = json['category_name'];
    type = json['type'];
    categoryId = json['category_id'];
    if (json['category_list'] != null) {
      categoryList = <CategoryList>[];
      json['category_list'].forEach((v) {
        categoryList.add(CategoryList.fromJson(v));
      });
    }
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
