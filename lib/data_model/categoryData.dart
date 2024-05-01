class CategoryDataModel {
  final String title;
  final String image;

  CategoryDataModel({required this.title, required this.image});
}

List<CategoryDataModel> categories = [
  CategoryDataModel(title: "all", image: "all.png"),
  CategoryDataModel(title: "Shoes", image: "shoes.png"),
  CategoryDataModel(title: "Beauty", image: "beauty.png"),
  CategoryDataModel(title: "Woman's\nfashion", image: "image1.png"),
  CategoryDataModel(title: "Jewelry", image: "jewelry.png"),
  CategoryDataModel(title: "Man's\nFashion", image: "men.png"),
  CategoryDataModel(title: "EarBuds", image: "all/wireless.png"),
  CategoryDataModel(title: "Bands", image: "all/miband.jpg"),
];
