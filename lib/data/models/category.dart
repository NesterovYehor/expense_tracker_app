import '../entities/entity.dart';

class Category{
  String name;
  String categoryId;
  String icon;
  int color;

  Category({
    required this.categoryId,
    required this.name,
    required this.icon,
    required this.color
  });

  static final empty = Category(
    categoryId: "",
    name: "",
    icon: "",
    color: 0
  );

  CategoryEntity toEntity(){
    return CategoryEntity(
      name: name,
      categoryId: categoryId,
      icon: icon,
      color: color
    );
  }

  static Category fromEntaty(CategoryEntity entity){
    return Category(
      categoryId: entity.categoryId,
       name: entity.name, 
       icon: entity.icon, 
       color: entity.color
    );
  }
}