// 💡 هذا الملف يمثل Model للأقسام (Categories)
// قمنا بتغيير اسم المتغير من `category` إلى `name` ليكون الكود مقروءاً بشكل أفضل (Best Practice).
// بحيث نستدعي الاسم كالتالي: category.name بدلاً من category.category.

class CategoryModel {
  final String image;
  final String name; // استخدمنا name بدلاً من اسم الكلاس لمنع التكرار اللفظي
  
  const CategoryModel({required this.image, required this.name});

  // 💡 قمنا بنقل قائمة الأقسام الثابتة (Hardcoded List) إلى هنا بدلاً من تركها في ملف الـ UI.
  // هذا تطبيق لمبدأ الـ Separation of Concerns (فصل المهام)، بحيث يكون الـ UI مسئولاً عن الرسم فقط.
  // جعلناها static const لتوفير استهلاك الذاكرة وإتاحة الوصول لها من أي مكان بدون إنشاء Object جديد.
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
