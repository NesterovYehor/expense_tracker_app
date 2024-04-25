class CategoryEntity{
  String name;
  String categoryId;
  String icon;
  int color;

  CategoryEntity({
    required this.categoryId,
    required this.name,
    required this.icon,
    required this.color
  });

  Map<String, Object?> toDocument(){
    return{
      "name": name,
      "categoryId": categoryId,
      "icon": icon,
      "color": color
    };
  }

  static CategoryEntity fromDocument( Map<String, dynamic> doc){
    return CategoryEntity(
      categoryId: doc["categoryId"], 
      name: doc["name"], 
      icon: doc["icon"], 
      color: doc["color"]
    );
  }
}