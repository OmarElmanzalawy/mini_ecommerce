import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_ecommerce/constants/app_colors.dart';
import 'package:mini_ecommerce/models/product_model.dart';
import 'package:mini_ecommerce/screens/cart_screen.dart';
import 'package:mini_ecommerce/screens/home_screen.dart';
import 'package:mini_ecommerce/screens/product_details_screen.dart';
import 'package:mini_ecommerce/screens/profile_screen.dart';
import 'package:mini_ecommerce/screens/sign_in_screen.dart';
import 'package:mini_ecommerce/screens/sign_up_screen.dart';
import 'package:mini_ecommerce/screens/splash_screen.dart';
import 'package:mini_ecommerce/service/init_get_it.dart';
import 'package:mini_ecommerce/service/startup_service.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await StartupService.init();

  runApp(ProviderScope(child: const MainApp()));
}

final GoRouter _router = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      builder: (context, state) => SplashScreen(),
    ),
    GoRoute(
      path: '/signin',
      builder: (context, state) => SignIn(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => SignUpScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => HomeScreen(),
    ),
     GoRoute(
      path: '/cart',
      builder: (context, state) => CartScreen(),
    ),
    GoRoute(
      path: '/productdetails',
      builder: (context, state) {
        final product = state.extra as ProductModel;
        return ProductDetailsScreen(model: product,);
      }
    ),
      GoRoute(
      path: '/profile',
      builder: (context, state) => ProfileScreen()
    ),
]);

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.light(
          primary: kprimaryBackground1,
          secondary: kprimaryBackground2,
        ),

      ),
    );
  }
}
