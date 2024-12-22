import 'package:calorie_counter_ai/utils/const.dart';
import 'package:flutter/material.dart';
import '../utils/colors.dart';

class MealNameContainer extends StatefulWidget {
  const MealNameContainer({super.key});

  @override
  State<MealNameContainer> createState() => _MealNameContainerState();
}

class _MealNameContainerState extends State<MealNameContainer> {
  String mealName = Const.mealContainerText2;

  void _changeMealName() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ChangeMealNameDialog(
          onNameChanged: (newName) {
            setState(() {
              mealName = newName;
            });
          },
        );
      },
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: CColors.greyColor.withOpacity(0.09),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                Const.mealContainerText1,
                style: TextStyle(
                  fontSize: 14.0,
                  color: CColors.blackColor,
                ),
              ),
              const SizedBox(height: 4.0),
              Text(
               mealName ,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: CColors.blackColor,
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: _changeMealName,
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: CColors.greenColor.withOpacity(0.1),
              ),
              child: const Icon(
                Icons.edit_outlined,
                color: CColors.greenColor,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class ChangeMealNameDialog extends StatelessWidget {
  final Function(String) onNameChanged;
  const ChangeMealNameDialog({required this.onNameChanged, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _textFieldController = TextEditingController();

    return AlertDialog(
      title: const Text('Change Meal Name'),
      content: TextField(
        controller: _textFieldController,
        decoration: const InputDecoration(hintText: "Enter new meal name"),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('CANCEL', style: TextStyle(
            color: CColors.greenColor
          ),),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('OK', style: TextStyle(
                      color: CColors.greenColor

          ),),
          onPressed: () {
            onNameChanged(_textFieldController.text);
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
