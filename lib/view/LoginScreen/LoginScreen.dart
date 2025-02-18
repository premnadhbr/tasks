import 'package:flutter/material.dart';
import 'package:flutter_application_19/controller/loginScreen/bloc/login_bloc.dart';
import 'package:flutter_application_19/widgets/CustomButton.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            children: [
              Text(
                "Sign in to your \nAccount",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Text(
                "Enter your email and password to log in",
                style: TextStyle(
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  "Forgot password ?",
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              MaterialButton(
                onPressed: () {
                  print("button pressed");
                  // BlocProvider.of<LoginBloc>(context).add(
                  //     LoginButtonPressedEvent(
                  //         email: emailController.text,
                  //         password: passwordController.text));
                  context.read<LoginBloc>().add(LoginButtonPressedEvent(
                        email: 'musavir.mate@gmail.com',
                        password: '123456789',
                      ));
                },
                // ignore: sort_child_properties_last
                child: Text(
                  "Log in",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                color: Colors.amber,
                height: 50,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      "Or",
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              CustomButton(
                imagePath: 'assets/images/google.png',
                buttonText: "Continue with Google",
                onPressed: () {},
              ),
              SizedBox(
                height: 3.h,
              ),
              CustomButton(
                imagePath: 'assets/images/Facebook.png',
                buttonText: "Continue with Facebook",
                onPressed: () {},
              ),
              SizedBox(height: 6.h),
              Center(child: Text("Dont have an account? Sign Up"))
            ],
          ),
        );
      },
    );
  }
}
