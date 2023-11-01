import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_todo/controller/auth_controller.dart';
import 'package:todo_todo/controller/calendar_format_controller.dart';
import 'package:todo_todo/controller/calendar_marker_controller.dart';
import 'package:todo_todo/controller/calendar_selected_date_controller.dart';
import 'package:todo_todo/controller/category_controller.dart';
import 'package:todo_todo/controller/task_calendar_reload_controller.dart';
import 'package:todo_todo/controller/task_chart_controller.dart';
import 'package:todo_todo/controller/task_controller.dart';
import 'package:todo_todo/controller/task_tab_open_controller.dart';
import 'package:todo_todo/repository/auth_repository.dart';
import 'package:todo_todo/repository/category_repository.dart';
import 'package:todo_todo/repository/task_repository.dart';
import 'package:todo_todo/repository/user_repository.dart';

final locator = GetIt.I;

void setupLocator() {
  locator.registerLazySingleton(
    () => AuthRepository(auth: FirebaseAuth.instance),
  );

  locator.registerLazySingleton(
    () => UserRepository(firestore: FirebaseFirestore.instance),
  );

  locator.registerLazySingleton(
    () => CategoryRepository(firestore: FirebaseFirestore.instance),
  );

  locator.registerLazySingleton(
    () => TaskRepository(firestore: FirebaseFirestore.instance),
  );

  locator.registerLazySingleton(
    () => TaskTabOpenController(),
  );

  locator.registerLazySingleton(
    () => CategoryController(
      authRepository: locator<AuthRepository>(),
      categoryRepository: locator<CategoryRepository>(),
    ),
  );

  locator.registerLazySingleton(
    () => AuthController(
      authRepository: locator<AuthRepository>(),
      firestoreRepository: locator<UserRepository>(),
      categoryController: locator<CategoryController>(),
    ),
  );

  locator.registerLazySingleton(
    () => TaskController(
      taskRepository: locator<TaskRepository>(),
      authRepository: locator<AuthRepository>(),
      categoryController: locator<CategoryController>(),
    ),
  );
  locator.registerLazySingleton(
        () => CalendarMarkerController(
      locator<TaskRepository>(),
    ),
  );

  locator.registerLazySingleton(
    () => CalendarSelectedDateController(),
  );

  locator.registerLazySingleton(
    () => CalendarFormatController(),
  );

  locator.registerLazySingleton(
        () => TaskCalendarReloadController(),
  );

  locator.registerLazySingleton(
        () => TaskChartController(
      taskRepository: locator<TaskRepository>(),
      authRepository: locator<AuthRepository>(),
    ),
  );

}
