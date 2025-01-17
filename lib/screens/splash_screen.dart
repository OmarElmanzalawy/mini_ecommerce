import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_ecommerce/constants/app_colors.dart';
import 'package:mini_ecommerce/service/init_get_it.dart';
import 'package:mini_ecommerce/service/startup_service.dart';
import 'package:mini_ecommerce/view_model/products_provider.dart';
import 'package:mini_ecommerce/widgets/gradient_background.dart';


class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getIt<StartupService>().loadLocalData(ref);
  }

  @override
  Widget build(BuildContext context) {
  
    final Size size = MediaQuery.sizeOf(context);
    final products = ref.watch(productsProvider);
    WidgetsBinding.instance.addPostFrameCallback((_) async{
    if (products.products.isNotEmpty) {
      await Future.delayed(Duration(seconds: 1));
      context.go(
        FirebaseAuth.instance.currentUser != null ? '/home' : '/signin',
      );
    }
  });
    
    return Scaffold(
      body: GradientBackground(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png',fit: BoxFit.fitWidth,color: kteal,),
            // const SizedBox(height: 20,),
            Row(
              spacing: 12,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Fetching Data'),
                CircularProgressIndicator.adaptive(backgroundColor: Colors.black,),
              ],
            ),
          ],
        )
        )
    );
  }
}