import 'package:flutter/material.dart';

class AllViewWidget extends StatelessWidget {
  const AllViewWidget({super.key,  this.allViewColor,  this.descriptionColor,required  this.description, this.decorationColor});
  
 final Color? allViewColor ;
 final Color?descriptionColor; 
 final Color?decorationColor; 
 final String description; 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            textAlign: TextAlign.center,
            description,
            style: TextStyle(color: descriptionColor ?? Colors.white, fontSize: 20),
          ),
          InkWell(
            onTap: () {},
            child: Text(
               'All View',
            style: TextStyle(
              decoration: TextDecoration.underline,
              decorationThickness: 1,
              
              decorationColor: descriptionColor ?? Colors.white,
              color: allViewColor ?? Colors.white,
              fontSize: 16,
            ),
            )
           
          ),
        ],
      ),
    );
  }
}
