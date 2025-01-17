import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mini_ecommerce/view_model/splash_dot_index_notifier.dart';
import 'package:mini_ecommerce/widgets/gradient_background.dart';
import 'package:mini_ecommerce/widgets/splash/splash_btn.dart';
import 'package:mini_ecommerce/widgets/splash/splash_item.dart';

class SplashScreen extends ConsumerWidget {
  SplashScreen({super.key});

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context,WidgetRef ref) {
  
    final Size size = MediaQuery.sizeOf(context);
    final index = ref.watch(dotIndexProvider);
    return Scaffold(
      body: GradientBackground(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      //mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          //color: Colors.red,
          height: size.height * 0.75,
          child: PageView(
            controller: _pageController,
            onPageChanged: (value) =>
                ref.read(dotIndexProvider.notifier).changeIndex(value),
            children: [
              SplashItem(
                title: 'Stay Organized, Achieve More!',
                imagePath: 'task-organization.json',
                subtitle:
                    'Track your tasks and deadlines in one place. Your goals are within reach when you\'re organized!',
              ),
              SplashItem(
                title: 'Complete Tasks, Earn Rewards!',
                imagePath: 'earn-rewards.json',
                subtitle:
                    'Every task you complete earns you in-app currency, which can be redeemed for rewards you create. Get motivated to accomplish more!',
              ),
              SplashItem(
                title: 'Customize Your Goals!',
                imagePath: 'task-organization.json',
                subtitle:
                    'Set personal rewards and track your progress towards achieving them. With every completed task, you\'re one step closer.',
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15.0, bottom: 70),
          child: DotsIndicator(
            position: index,
            dotsCount: 4,
            decorator: DotsDecorator(
              // color: AppColors.darkGreen,
              // activeColor: AppColors.lightGreen,
              size: Size.square(9),
              activeSize: Size(24, 8),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
            ),
          ),
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: SplashButton(
              isfinalIndex: index == 3 ? true : false,
              ontap: () {
                  if(index<3){
                  ref.read(dotIndexProvider.notifier).changeIndex(index + 1,pagecontroller: _pageController);
                  }
                  else{
                    Navigator.pushNamed(context, '/signin');
                  }
              }
            ))
      ],
    )
        ),
    );
  }
}