import 'package:calorie_counter_ai/utils/const.dart';
import 'package:flutter/material.dart';
import '../utils/colors.dart';



class MealNameContainer extends StatefulWidget {
  const MealNameContainer({Key? key}) : super(key: key);

  @override
  State<MealNameContainer> createState() => _MealNameContainerState();
}

class _MealNameContainerState extends State<MealNameContainer> {
  String mealName = Const.mealContainerText2;
  bool isEditing = false;
  final TextEditingController _textFieldController = TextEditingController();

  void _toggleEditMode() {
    setState(() {
      if (isEditing) {
        mealName = _textFieldController.text.isEmpty
            ? mealName
            : _textFieldController.text;
      } else {
        _textFieldController.text = mealName;
      }
      isEditing = !isEditing;
    });
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
          Expanded(
            child: Column(
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
                isEditing
                    ? TextField(
                        controller: _textFieldController,
                        autofocus: true,
                        decoration: const InputDecoration(
                          isDense: true,
                          border: UnderlineInputBorder(),
                          hintText: 'Enter meal name',
                        ),
                        onSubmitted: (_) => _toggleEditMode(),
                      )
                    : Text(
                        mealName,
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: CColors.blackColor,
                        ),
                      ),
              ],
            ),
          ),
          GestureDetector(
            onTap: _toggleEditMode,
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: CColors.greenColor.withOpacity(0.1),
              ),
              child: Icon(
                isEditing ? Icons.check : Icons.edit_outlined,
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

