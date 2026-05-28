import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:newst_app/core/constant/app_colors.dart';
import 'package:newst_app/core/widget/custom_text_form_feild.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  static const routName = 'register';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/news_papper.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image.asset('assets/images/logo2.png', height: 46)),
              Gap(24),
              Text('Welcome to Newts'),
              Gap(16),
              Text('Email'),
              Gap(8),
              CustomTextFormFeild(hint: 'Aaaad@example.com'),
              Gap(12),
              Text('Password'),
              Gap(8),
              CustomTextFormFeild(hint: '********' , obscureText: true,),
              Gap(12),
              Text('Confirm Password'),
              Gap(8),
              CustomTextFormFeild(hint: '********' , obscureText: true,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account?'),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(color: AppColors.primaryColor),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
