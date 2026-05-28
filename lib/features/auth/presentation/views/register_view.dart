import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:newst_app/core/widget/custom_eleveted_button.dart';
import 'package:newst_app/core/widget/custom_text_form_feild.dart';
import 'package:newst_app/features/auth/presentation/views/login_view.dart';
import 'package:newst_app/features/auth/presentation/views/widgets/inkwell_an_account.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});
  static const routName = 'register';
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> form = GlobalKey();
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
          child: Form(
            key: form,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset('assets/images/logo2.png', height: 46),
                ),
                Gap(24),
                Text('Welcome to Newts'),
                Gap(16),
                Text('Email'),
                Gap(8),
                CustomTextFormFeild(
                  hint: 'Aaaad@example.com',
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    final emailRegex = RegExp(
                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                    );
                    if (!emailRegex.hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                Gap(12),
                Text('Password'),
                Gap(8),
                CustomTextFormFeild(
                  hint: '********',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    final passwordRegex = RegExp(
                      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
                    );
                    if (!passwordRegex.hasMatch(value)) {
                      return 'Please enter a strong password';
                    }
                    return null;
                  },
                  obscureText: true,
                  controller: passwordController,
                ),
                Gap(12),
                Text('Confirm Password'),
                Gap(8),
                CustomTextFormFeild(
                  hint: '********',
                  validator: (value) {
                    if (passwordController != confirmPasswordController) {
                      return 'not password the same';
                    } else {
                      return null;
                    }
                  },
                  obscureText: true,
                  controller: confirmPasswordController,
                ),
                Gap(20),
                InkwellAnAccount(
                  inkwell: 'Login',
                  routName: LoginView.routName,
                  textMessage: 'Already have an account?',
                ),
                Gap(40),
                CustomElevetedButton(
                  onPressed: () {
                    if (form.currentState!.validate()) {}
                  },
                  title: 'Register',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
