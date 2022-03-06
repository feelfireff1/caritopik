import 'package:get/get.dart';

import 'package:caritopik/app/modules/add_product/bindings/add_product_binding.dart';
import 'package:caritopik/app/modules/add_product/views/add_product_view.dart';
import 'package:caritopik/app/modules/edit_product/bindings/edit_product_binding.dart';
import 'package:caritopik/app/modules/edit_product/views/edit_product_view.dart';
import 'package:caritopik/app/modules/home/bindings/home_binding.dart';
import 'package:caritopik/app/modules/home/views/home_view.dart';
import 'package:caritopik/app/modules/login/bindings/login_binding.dart';
import 'package:caritopik/app/modules/login/views/login_view.dart';
import 'package:caritopik/app/modules/register/bindings/register_binding.dart';
import 'package:caritopik/app/modules/register/views/register_view.dart';
import 'package:caritopik/app/modules/welcome/bindings/welcome_binding.dart';
import 'package:caritopik/app/modules/welcome/views/welcome_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.ADD_PRODUCT,
      page: () => AddProductView(),
      binding: AddProductBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PRODUCT,
      page: () => EditProductView(),
      binding: EditProductBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => WelcomeView(),
      binding: WelcomeBinding(),
    ),
  ];
}
