import '/components/food_card_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import 'log_activity_add_widget.dart' show LogActivityAddWidget;
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

import 'package:paw_r_app/models/activity.dart';

class LogActivityAddModel extends FlutterFlowModel<LogActivityAddWidget> {
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


  Future<void> addActivity(
      BuildContext context, GlobalKey<FormState> formKey, Pet pet) async {
    final pet_id = pet.id;

    String? activityName = nameFieldTextController.text.trim();
    String? note = amountFieldTextController.text.trim();

    if (!formKey.currentState!.validate()) return;

    final newActivity = Activity(
      activityName: activityName,
      notes: note,
      petId: pet_id,
    );

    try {
      await Provider.of<PetViewModel>(context, listen: false).addActivity(newActivity);
      Navigator.pop(context);
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error adding activity: $error")),
      );
    } finally {
      // do something
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Food added!')),
      );
    }
  }
}
