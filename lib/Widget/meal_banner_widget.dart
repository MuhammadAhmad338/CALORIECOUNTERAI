import 'package:flutter/material.dart';
import '../utils/colors.dart';

class MealBannerWidget extends StatelessWidget {
  const MealBannerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: CColors.whiteColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Αυγά με 2 φέτες ψωμί',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: CColors.greenColor.withOpacity(0.1),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.grey.withOpacity(0.1),
                  //     spreadRadius: 1,
                  //     blurRadius: 3,
                  //     offset: Offset(0, 1),
                  //   ),
                  // ],
                ),
                child: IconButton(
                  padding: EdgeInsets.all(12),
                  constraints: BoxConstraints(), // Removes default minimum size
                  onPressed: () {},
                  icon: const Icon(
                    Icons.edit_outlined,
                    color: CColors.greenColor,
                    size: 20,
                  ),
                ),
              ),
              // IconButton(
              //     padding: EdgeInsets.all(12),
              //     color: CColors.whiteColor,
              //     onPressed: () {},
              //     icon: const Icon(
              //       Icons.edit_outlined,
              //       color: CColors.greenColor,
              //     ),
              //   ),
              // Container(height: 20,
              // color: CColors.blackColor,

              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.circular(12)
              // ),
              // child: Text("asdsd"),
              // )
              // Container(
              // height: 20,
              //   color: CColors.blackColor,
              //   decoration: const BoxDecoration(
              //     shape: BoxShape.circle
              //   ),
              //   // child:
              // ),
            ],
          ),

          // Macronutrients
          const Padding(
            padding: EdgeInsets.only(top: 12, bottom: 12),
            child: Wrap(
              spacing: 10, // Horizontal spacing between items
              runSpacing: 5, // Vertical spacing between lines
              children: [
                Text(
                  'Πρωτεΐνες: 30g',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                Text(
                  'Υδατάνθρακες: 24g',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                Text(
                  'Λιπαρά: 4,3g',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),

          // Calories and Meal Tag
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFFE9FDF1), // Light green background
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Θερμίδες: 326',
                  style: TextStyle(
                    color: Color(0xFF2C5E2C), // Dark green
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFFE9F1FD), // Light blue background
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Πρωινό',
                  style: TextStyle(
                    color: Color(0xFF2C5C8C), // Dark blue
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
