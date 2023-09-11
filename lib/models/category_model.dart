import 'package:flutter/material.dart';
import 'package:todo_todo/consts/enums.dart';

class CategoryModel {
  CategoryModel({
    required this.id,
    required this.name,
    this.categoryState = CategoryState.activated,
    required this.color,
    this.isDeleted = false,
    DateTime? createdAt,
    DateTime? updatedAt,
  })
      : createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  final String id;
  final String name;
  final CategoryState categoryState;
  final Color color;
  final bool isDeleted;
  final DateTime createdAt;
  final DateTime updatedAt;

  CategoryModel copyWith({
    required String? id,
    required String? name,
    required CategoryState? categoryState,
    required Color? color,
    required bool? isDeleted,
    required DateTime? createdAt,
    required DateTime? updatedAt,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      name: name ?? this.name,
      categoryState: categoryState ?? this.categoryState,
      color: color ?? this.color,
      isDeleted: isDeleted ?? this.isDeleted,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
