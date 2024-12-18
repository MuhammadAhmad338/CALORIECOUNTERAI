import '../../../utils/colors.dart';
import 'package:flutter/material.dart';
import '../../../Widget/meal_banner_widget.dart';
import 'package:calorie_counter_ai/utils/const.dart';
import 'package:calorie_counter_ai/Widget/add_meal_button.dart';
import 'package:calorie_counter_ai/Widget/premium_banner_widget.dart';


class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [  
            Padding(
              padding: EdgeInsets.only(left: 12, right: 12, top: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(Const.title,
                   style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold)),
                  Text(
                    Const.calender,
                    style: TextStyle(
                      fontSize: 16,
                      color: CColors.greenColor,
                      ),
                  ) 
                ]
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 12, right: 12, top: 12),
              child: Text(Const.dashboardmaintext),
            ),
            SizedBox(height: 10,),
            PremiumBanner(),
            SizedBox(height: 10,),
            MealBannerWidget(),
            SizedBox(height: 10,),
            AddMealButton()
          ],
        ),
      ),
    );
  }
}
