import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_ecommerce/constants/app_colors.dart';
import 'package:mini_ecommerce/widgets/titled_textfield.dart';

class SignUpScreen extends StatelessWidget {
 
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        // iconTheme: IconThemeData(color: Colors.red),
      ),
      body: Column(
        children: [
          Text(
            'Sign Up',
            style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w600,
                color: kteal),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 25,
          ),
          Column(
            children: [
                Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TitledTextField(
                  title: 'User Name',
                  hint: 'enter your username',
                  controller: _usernameController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TitledTextField(
                  title: 'Email',
                  hint: 'enter your email',
                  controller: _emailController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TitledTextField(
                  title: 'Password',
                  hint: 'enter your password',
                  controller: _passwordController,
                  isSensitive: true,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: ElevatedButton(
              onPressed: () async{

              },
              style: ButtonStyle(
                padding: WidgetStatePropertyAll(EdgeInsets.all(12)),
                backgroundColor: WidgetStatePropertyAll(kteal),
                foregroundColor: WidgetStatePropertyAll(Colors.white),
                splashFactory: NoSplash.splashFactory,
              ),
              child: Container(
                constraints: BoxConstraints(minWidth: size.width * 0.85),
                decoration: BoxDecoration(
                  color: kteal,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Register',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Already have an account?'),
              TextButton(
                onPressed: () {
                  context.push('/signin');
                },
                child: Text('Login'),
                style: ButtonStyle(
                    foregroundColor:
                        WidgetStatePropertyAll(kteal),
                    splashFactory: NoSplash.splashFactory),
              ),
            ],
          ),
        ],
      ),
    );
  }
}