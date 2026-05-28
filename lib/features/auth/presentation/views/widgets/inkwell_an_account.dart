import 'package:flutter/material.dart';
import 'package:newst_app/core/constant/app_colors.dart';

class InkwellAnAccount extends StatelessWidget {
  const InkwellAnAccount({super.key, required this.inkwell, required this.routName, required this.textMessage});
  
final String inkwell ;
final String routName ;
final String textMessage ;

  @override
  Widget build(BuildContext context) {
    return      Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(textMessage),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, routName);
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(color: AppColors.primaryColor),
                      ),
                    ),
                  ],
                );
  }
}