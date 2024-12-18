import 'package:cure_connect_service/views/screens/6_categoryies_pages/dentist.dart';
import 'package:cure_connect_service/views/screens/6_categoryies_pages/nephrologist.dart';
import 'package:cure_connect_service/views/screens/6_categoryies_pages/neurologist.dart';
import 'package:cure_connect_service/views/screens/6_categoryies_pages/ophthalmologist.dart';
import 'package:cure_connect_service/views/screens/6_categoryies_pages/pediatrician.dart';
import 'package:cure_connect_service/views/screens/6_categoryies_pages/physiotherapist.dart';
import 'package:cure_connect_service/views/utils/category_widget_colors.dart';
import 'package:cure_connect_service/widgets/home_content/category_designs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> categoryPages = [
      Physiotherapist(),
      Dentist(),
      Ophthalmologist(),
      Neurologist(),
      Pediatrician(),
      Nephrologist()
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: categoryTitles.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Get.to(() => categoryPages[index % categoryPages.length],
                transition: Transition.size);
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: categoryColors[index % categoryColors.length],
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  categorysImages[index],
                  height: 40,
                  width: 40,
                ),
                const SizedBox(height: 8),
                Text(
                  categoryTitles[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                    color:
                        categoryTextColors[index % categoryTextColors.length],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
