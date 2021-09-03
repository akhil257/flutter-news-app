import 'package:flutter/material.dart';
import 'package:news/helpers/responsive.dart';
import 'package:news/screens/categoy_list.dart';

class Categories extends StatelessWidget {
  static const categories = [
    'Sports',
    'Health',
    'Entertainment',
    'Business',
    'Technology',
    'Science'
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: Responsive.w(8), vertical: Responsive.w(5)),
      height: 40,
      child: ListView.builder(

          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => 
                        CategoryList(
                              category: categories[index],
                            )));
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(right: Responsive.w(8)),
                padding: EdgeInsets.symmetric(
                    horizontal: Responsive.w(14), vertical: Responsive.w(8)),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black12,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white),
                child: Text(
                  categories[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w300),
                ),
              ),
            );
          }),
    );
  }
}
