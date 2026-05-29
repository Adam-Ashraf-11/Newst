import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:newst_app/core/widget/custom_eleveted_button.dart';
import 'package:newst_app/core/widget/custom_text_form_feild.dart';
import 'package:newst_app/features/auth/presentation/views/register_view.dart';
import 'package:newst_app/features/auth/presentation/views/widgets/inkwell_an_account.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  static const routName = 'login';

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
            key: _formKey,
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
                  obscureText: true,
                  controller: passwordController,
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
                ),
                Gap(20),
                InkwellAnAccount(
                  inkwell: 'Register',
                  routName: RegisterView.routName,
                  textMessage: 'Don\'t have an account?',
                ),
                Gap(40),
                CustomElevetedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {}
                  },
                  title: 'Login',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
