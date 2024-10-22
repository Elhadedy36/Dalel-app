import 'package:dalel/features/home/data/category_model.dart';
import 'package:dalel/features/home/presentation/widgets/category_item.dart';
import 'package:flutter/material.dart';

class CustomCategoryHorizontalListView extends StatelessWidget {
  const CustomCategoryHorizontalListView({super.key, required this.categlist});
  final List<CategoryModel> categlist;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      
      height: 133,
     
      child: ListView.separated(
        clipBehavior: Clip.none,
          scrollDirection: Axis.horizontal,
          itemCount: categlist.length,
          separatorBuilder: (context, index) => const SizedBox(
            width: 16,
          ),
          itemBuilder: (context, index) {
            return categoryItem(
                name: categlist[index].name, image: categlist[index].image);
          }),
    );
  }
}
