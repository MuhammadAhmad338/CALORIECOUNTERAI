import 'package:calorie_counter_ai/Widget/daily_goal_widget.dart';

import '../../../utils/colors.dart';
import 'package:flutter/material.dart';
import '../../../Widget/meal_banner_widget.dart';
import 'package:calorie_counter_ai/utils/const.dart';
import 'package:calorie_counter_ai/Widget/nutrition_widget.dart';
import 'package:calorie_counter_ai/Widget/premium_banner_widget.dart';
import 'package:calorie_counter_ai/Widget/add_meal_and_confirm_image_button.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
               const Padding(
                padding: EdgeInsets.only(left: 12, right: 12, top: 12),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(Const.title,
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold)),
                      Text(
                        Const.calender,
                        style: TextStyle(
                          fontSize: 16,
                          color: CColors.greenColor,
                        ),
                      )
                    ])
              ),           
               const Padding(
                padding: EdgeInsets.only(left: 12, right: 12, top: 12),
                child: Text(Const.dashboardmaintext),
              ),
                const SizedBox(
                height: 10,
              ),
               WeeklyCalendar(),
               const DailyGoalWidget(),
               const NutritionContainer(),
               const SizedBox(
                height: 10,
              ),
               const PremiumBanner(),
               const SizedBox(
                height: 10,
              ),
               const Padding(
                padding: EdgeInsets.only(left: 12, right: 12, top: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Const.dashboardtext1,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      Const.dashboardtext2,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const MealBannerWidget(),
              const SizedBox(
                height: 10,
              ),
              const Positioned(
                bottom: -30,
                left: 0,
                right: 0,
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 20.0),
                  child: AddMealButton(
                    buttonText: Const.addMealButton,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WeeklyCalendar extends StatefulWidget {
  @override
  _WeeklyCalendarState createState() => _WeeklyCalendarState();
}

class _WeeklyCalendarState extends State<WeeklyCalendar> {
  final List<String> days = ['ΔΕΥ', 'ΤΡΙ', 'ΤΕΤ', 'ΠΕΜ', 'ΠΑΡ', 'ΣΑΒ', 'ΚΥΡ'];
  final List<int> dates = [14, 15, 16, 17, 18, 19, 20];
  int selectedIndex = 0; // Tracks the selected day index

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12.0),
      padding: const EdgeInsets.symmetric(vertical: 8.0),
     
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(days.length, (index) {
            bool isSelected = index == selectedIndex;
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 6.0),
                width: 50.0,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.green.shade100 : Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20.0),
                  border: isSelected
                      ? Border.all(color: CColors.greenColor, width: 2.0)
                      : null,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      days[index],
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: isSelected ? Colors.black : Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Container(
                      width: 36.0,
                      height: 36.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: CColors.whiteColor,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: isSelected ? CColors.greenColor : Colors.grey,
                          width: 2.0,
                        ),
                      ),
                      child: Text(
                        dates[index].toString(),
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: isSelected ? CColors.greenColor : CColors.blackColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

