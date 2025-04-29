import '/components/food_card_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import 'log_food_add_widget.dart' show LogFoodAddWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:paw_r_app/models/pet.dart';
import 'package:paw_r_app/models/food.dart';
import 'package:paw_r_app/view_models/pet_view_model.dart';

import 'package:paw_r_app/views/log_food/log_food_widget.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

class LogFoodAddModel extends FlutterFlowModel<LogFoodAddWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for SearchField widget.
  FocusNode? nameFieldFocusNode;
  TextEditingController? nameFieldTextController;
  String? Function(BuildContext, String?)? nameFieldTextControllerValidator;

  FocusNode? amountFieldFocusNode;
  TextEditingController? amountFieldTextController;
  String? Function(BuildContext, String?)? amountFieldTextControllerValidator;

  FocusNode? caloriesFieldFocusNode;
  TextEditingController? caloriesFieldTextController;
  String? Function(BuildContext, String?)? caloriesFieldTextControllerValidator;

  FocusNode? gLoadFieldFocusNode;
  TextEditingController? gLoadFieldTextController;
  String? Function(BuildContext, String?)? gLoadFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {
    nameFieldTextControllerValidator = (context, value) {
      if (value == null || value.trim().isEmpty) {
        return 'Please enter a food name';
      }
      return null;
    };

    amountFieldTextControllerValidator = (context, value) {
      if (value == null || value.trim().isEmpty) {
        return 'Please enter an amount';
      }
      if (double.tryParse(value.trim()) == null) {
        return 'Amount must be a number';
      }
      return null;
    };

    caloriesFieldTextControllerValidator = (context, value) {
      if (value == null || value.trim().isEmpty) {
        return 'Please enter the calories';
      }
      if (double.tryParse(value.trim()) == null) {
        return 'Calories must be a number';
      }
      return null;
    };

    gLoadFieldTextControllerValidator = (context, value) {
      if (value == null || value.trim().isEmpty) {
        return 'Please enter the glycemic load';
      }
      if (double.tryParse(value.trim()) == null) {
        return 'Glycemic load must be a number';
      }

      if (isDecimal(double.tryParse(value.trim()))) {
        return 'Glycemic load must be a whole number';
      }

      return null;
    };
  }

  @override
  void dispose() {
    nameFieldFocusNode?.dispose();
    nameFieldTextController?.dispose();

    amountFieldFocusNode?.dispose();
    amountFieldTextController?.dispose();

    caloriesFieldFocusNode?.dispose();
    caloriesFieldTextController?.dispose();

    gLoadFieldFocusNode?.dispose();
    gLoadFieldTextController?.dispose();
  }

  bool isDecimal(double? value) {
    if (value != null) {
      return value % 1 != 0;
    }
    return false;
  }

  // amount and calories should have decimal point to be accepted as type double?
  double? modifyNum(String val) {
    if (!isDecimal(double.tryParse(val))) {
      return double.tryParse('${val}.0009');
    }
    return double.tryParse(val);
  }


  Future<void> addFood(
      BuildContext context, GlobalKey<FormState> formKey, Pet pet) async {
    final foodName = nameFieldTextController.text.trim();
    final pet_id = pet.id;

    double? amount = modifyNum(amountFieldTextController.text.trim());
    double? calories = modifyNum(caloriesFieldTextController.text.trim());
    int? gLoad = int.tryParse(gLoadFieldTextController.text.trim());

    if (!formKey.currentState!.validate()) return;

    final newFood = Food(
      foodName: foodName,
      amount: amount,
      calories: calories,
      pet_id: pet_id,
      gLoad: gLoad,
    );

    try {
      await Provider.of<PetViewModel>(context, listen: false).addFood(newFood);
      Navigator.pop(context);
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error adding contact: $error")),
      );
    } finally {
      // do something
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Food added!')),
      );
    }
  }
}
