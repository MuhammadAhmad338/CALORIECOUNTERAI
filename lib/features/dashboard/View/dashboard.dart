import 'dart:math' as math;
import '../../../utils/colors.dart';
import 'package:flutter/material.dart';
import '../../../Widget/meal_banner_widget.dart';
import 'package:calorie_counter_ai/utils/const.dart';
import 'package:calorie_counter_ai/Widget/nutrition_widget.dart';
import 'package:calorie_counter_ai/Widget/daily_goal_widget.dart';
import 'package:calorie_counter_ai/Widget/premium_banner_widget.dart';
import 'package:calorie_counter_ai/Widget/add_meal_and_confirm_image_button.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: CColors.whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
               Padding(
                  padding:const  EdgeInsets.only(left: 12, right: 12, top: 12),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(Const.title,
                            style: TextStyle(
                                fontSize: 26, fontWeight: FontWeight.bold)),
                        GestureDetector(
                          onTap: () {
                            // Show the popup when the calendar text is tapped
                        // Show the bottom sheet when the calendar text is tapped
                        showModalBottomSheet(
                          context: context,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16.0),
                              topRight: Radius.circular(16.0),
                            ),
                          ),
                          builder: (context) => const AccountRequiredBottomSheet(),
                        );
                          },
                          child: const Text(
                            Const.calender,
                            style: TextStyle(
                              fontSize: 16,
                              color: CColors.greenColor,
                            ),
                          ),
                        )
                      ])),
              const Padding(
                padding: EdgeInsets.only(left: 12, right: 12, top: 12),
                child: Text(
                  Const.dashboardmaintext,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 14,
                    color: CColors.blackColor,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const DaySelectorWidget(),
              const SizedBox(height: 5),
              const DailyGoalWidget(),
              const SizedBox(
                height: 10,
              ),
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
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: AddMealButton(
                  buttonText: Const.addMealButton,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class DaySelectorWidget extends StatefulWidget {
  final Function(int)? onDaySelected;
  final int initialSelectedDay;

  const DaySelectorWidget({
    Key? key,
    this.onDaySelected,
    this.initialSelectedDay = 14,
  }) : super(key: key);

  @override
  State<DaySelectorWidget> createState() => _DaySelectorWidgetState();
}

class _DaySelectorWidgetState extends State<DaySelectorWidget> {
  late int selectedDay;
  final List<String> days = ['ΔΕΥ', 'ΤΡΙ', 'ΤΕΤ', 'ΠΕΜ', 'ΠΑΡ', 'ΣΑΒ', 'ΚΥΡ'];
  final List<int> dates = [14, 15, 16, 17, 18, 19, 20];

  @override
  void initState() {
    super.initState();
    selectedDay = widget.initialSelectedDay;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          days.length,
          (index) {
            bool isSelected = dates[index] == selectedDay;
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedDay = dates[index];
                });
                widget.onDaySelected?.call(dates[index]);
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                decoration: BoxDecoration(
                  color: isSelected ? const Color(0xFFE6F4E6) : const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      days[index],
                      style: const TextStyle(
                        fontSize: 13,
                        color: CColors.blackColor,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: 36,
                      height: 36,
                      child: CustomPaint(
                        painter: CircularProgressPainter(
                          progress: isSelected ? 0.6 : 1.0,
                          color: isSelected 
                            ? CColors.greenColor  // Green color when selected
                            : Colors.grey.withOpacity(0.3),
                          strokeWidth: 3,
                        ),
                        child: Center(
                          child: Text(
                            dates[index].toString(),
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color:CColors.blackColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class CircularProgressPainter extends CustomPainter {
  final double progress;
  final Color color;
  final double strokeWidth;

  CircularProgressPainter({
    required this.progress,
    required this.color,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    // Draw white background circle
    final bgPaint = Paint()
      ..color = CColors.whiteColor
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, radius + strokeWidth / 2, bgPaint);

   // Draw progress arc
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth + 2.0 // Increase width by 4
      ..strokeCap = StrokeCap.round;
  

    final progressAngle = 2 * math.pi * progress;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,  // Start from top
      progressAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
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
                  color: isSelected
                      ? CColors.greenColor.withOpacity(0.09)
                      : CColors.greyColor.withOpacity(0.02),
                  borderRadius: BorderRadius.circular(32.0),
                  //border: isSelected
                  //    ? Border.all(color: CColors.greenColor, width: 2.0)
                  //   : null,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      days[index],
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: isSelected ? CColors.blackColor : CColors.greyColor,
                      ),
                    ),
                    const SizedBox(height: 8.0),
              isSelected ?      Stack(
                        alignment: Alignment.center,

                      children: [
                        const Center(
                          child:  CircularProgressIndicator(
                            color: CColors.greenColor,
                            strokeWidth: 4,
                            value: 0.8,
                          ),
                        ),
                        // Container(
                        //   // width: 36.0,
                        //   height: 36.0,
                        //   alignment: Alignment.center,
                        //   decoration: BoxDecoration(
                        //     color: CColors.whiteColor,
                        //     shape: BoxShape.circle,
                        //     border: Border.all(
                        //       color: isSelected ? CColors.greenColor : Colors.grey,
                        //       width: 2.0,
                        //     ),
                        //   ),
                        //   child:
                        // ),
                        Center(
                          child: Text(
                            dates[index].toString(),
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: isSelected
                                  ? CColors.greenColor
                                  : CColors.blackColor,
                            ),
                          ),
                        ),
                      ],
                    ) :   Stack(
                        alignment: Alignment.center,

                      children: [
                      const   Center(
                          child:  CircularProgressIndicator(
                            color: CColors.greyColor,
                            strokeWidth: 4,
                            value: 0,
                          ),
                        ),
                        // Container(
                        //   // width: 36.0,
                        //   height: 36.0,
                        //   alignment: Alignment.center,
                        //   decoration: BoxDecoration(
                        //     color: CColors.whiteColor,
                        //     shape: BoxShape.circle,
                        //     border: Border.all(
                        //       color: isSelected ? CColors.greenColor : Colors.grey,
                        //       width: 2.0,
                        //     ),
                        //   ),
                        //   child:
                        // ),
                        Center(
                          child: Text(
                            dates[index].toString(),
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: isSelected
                                  ? CColors.greenColor
                                  : CColors.blackColor,
                            ),
                          ),
                        ),
                      ],
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


// class CircularProgressPainter extends CustomPainter {
//   final double progress;
//   final Color color;
//   final double strokeWidth;

//   CircularProgressPainter({
//     required this.progress,
//     required this.color,
//     required this.strokeWidth,
//   });

//   @override
//   void paint(Canvas canvas, Size size) {
//     final center = Offset(size.width / 2, size.height / 2);
//     final radius = (size.width - strokeWidth) / 2;

//     // Draw white background circle
//     final bgPaint = Paint()
//       ..color = CColors.whiteColor
//       ..style = PaintingStyle.fill;
//     canvas.drawCircle(center, radius + strokeWidth / 2, bgPaint);

//     // Draw progress arc
//     final paint = Paint()
//       ..color = color
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = strokeWidth + 2.0 // Increase width by 4
//       ..strokeCap = StrokeCap.round;

//     final progressAngle = 2 * math.pi * progress;
//     canvas.drawArc(
//       Rect.fromCircle(center: center, radius: radius),
//       -math.pi / 2, // Start from top
//       progressAngle,
//       false,
//       paint,
//     );
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => true;
// }