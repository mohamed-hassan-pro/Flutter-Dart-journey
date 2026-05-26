class CategoryModel {
  final String image;
  final String name;
  const CategoryModel({required this.image, required this.name});

  static const List<CategoryModel> categories = [
    CategoryModel(image: 'assets/business.avif', name: 'Business'),
    CategoryModel(image: 'assets/entertaiment.avif', name: 'Entertainment'),
    CategoryModel(image: 'assets/general.avif', name: 'General'),
    CategoryModel(image: 'assets/health.avif', name: 'Health'),
    CategoryModel(image: 'assets/science.avif', name: 'Science'),
    CategoryModel(image: 'assets/sports.avif', name: 'Sports'),
    CategoryModel(image: 'assets/technology.jpeg', name: 'Technology'),
  ];
}
