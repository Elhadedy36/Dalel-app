import 'package:dalel/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class categoryItem extends StatelessWidget {
  const categoryItem({super.key, required this.name, required this.image});
  final String name;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 74,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.8),
            blurRadius: 8,
            offset: const Offset(0, 8), // changes position of shadow
          ),
        ],
      ),
      child: Column(
       
        children: [
        Container(
          height: 90,
          width: 74,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5), topRight: Radius.circular(5)),
              image: DecorationImage(
                  image: AssetImage(image), fit: BoxFit.fill)),
        ),
        const SizedBox(
          height: 3,
        ),
        Text(
          name,
          style: CustomTextStyles.poppins500style18
              .copyWith(fontSize: 14, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ]),
    );
  }
}
