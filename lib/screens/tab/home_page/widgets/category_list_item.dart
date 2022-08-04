import 'package:flutter/material.dart';

class CategoryListItem extends StatelessWidget {
  const CategoryListItem({Key? key, required this.onTap, required this.categoryName, required this.selectedCategoryIndex, required this.index}) : super(key: key);

  final VoidCallback onTap;
  final String categoryName;
  final int selectedCategoryIndex;
  final int index;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        margin: const EdgeInsets.symmetric(horizontal: 6),
        decoration: BoxDecoration(
            color: selectedCategoryIndex == index
                ? Colors.black
                : Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
                color: Colors.grey.shade400, width: 2)),
        child: Center(
            child: Text(
              categoryName,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: selectedCategoryIndex != index
                    ? Colors.black
                    : Colors.white,
              ),
            )),
      ),
    );
  }
}
