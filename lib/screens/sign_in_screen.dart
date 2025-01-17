import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_ecommerce/constants/app_colors.dart';
import 'package:mini_ecommerce/service/auth_service.dart';
import 'package:mini_ecommerce/widgets/gradient_background.dart';
import 'package:mini_ecommerce/widgets/titled_textfield.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});

  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 80.0),
        child: Column(
        children: [
          Text(
            'Sign In',
            style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w600,
                color: kteal),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            'Welcome Back You have been missed!',
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.w200),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 30,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TitledTextField(
                  title: 'Email',
                  hint: 'enter your email',
                  controller: _emailcontroller,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TitledTextField(
                  title: 'Password',
                  hint: 'enter your password',
                  controller: _passwordcontroller,
                  isSensitive: true,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 90.0),
            child: ElevatedButton(
              onPressed: () async{
                if(EmailValidator.validate(_emailcontroller.text)){

                                 final didLogin = await AuthService.login(email: _emailcontroller.text, password: _passwordcontroller.text);
                if(didLogin){
                  context.go('/home');
                    ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Login Successfully'),
                      backgroundColor: kteal,
                      )
                  );
                }
                else{
                    ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Something unexpected happened'),
                      backgroundColor: Colors.red,
                      )
                  );
                }

                }
                else{
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Please Enter A Valid Email'),
                      backgroundColor: Colors.red,
                      )
                  );
                }
 
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
                  'Login',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Don\' have an account?'),
              TextButton(
                onPressed: () {
                  context.push('/signup');
                },
                child: Text('Register'),
                style: ButtonStyle(
                    foregroundColor:
                        WidgetStatePropertyAll(kteal),
                    splashFactory: NoSplash.splashFactory),
              )
            ],
          ),
        ],
              ),
      ),
    );
  }
}