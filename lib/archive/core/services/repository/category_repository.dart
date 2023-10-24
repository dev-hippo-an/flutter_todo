import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_todo/archive/core/models/category_model.dart';

class CategoryRepository {
  Future<void> createCategory({
    required CategoryModel category,
  }) async {
    await FirebaseFirestore.instance
        .collection('categories')
        .doc(category.categoryId)
        .set(category.toJson());
  }

  Future<List<CategoryModel>> fetchCategories(String userId) async {
    final response = await FirebaseFirestore.instance
        .collection('categories')
        .where('userId', isEqualTo: userId)
        .get();

    return response.docs
        .map(
          (e) => CategoryModel.fromJson(
            e.data(),
          ),
        )
        .toList();
  }

  Future<void> deleteCategory(CategoryModel category) async {
    await FirebaseFirestore.instance
        .collection('categories')
        .doc(category.categoryId)
        .delete();
  }
}