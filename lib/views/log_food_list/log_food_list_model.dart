import '/components/food_card_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import 'log_food_list_widget.dart' show LogFoodListWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:paw_r_app/models/foodLog.dart';

import 'package:paw_r_app/view_models/pet_view_model.dart';

class LogFoodListModel extends FlutterFlowModel<LogFoodListWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for SearchField widget.
  FocusNode? searchFieldFocusNode;
  TextEditingController? searchFieldTextController;
  String? Function(BuildContext, String?)? searchFieldTextControllerValidator;
  // Model for FoodCard component.
  late FoodCardModel foodCardModel1;
  // Model for FoodCard component.
  late FoodCardModel foodCardModel2;
  // Model for FoodCard component.
  late FoodCardModel foodCardModel3;
  // Model for FoodCard component.
  late FoodCardModel foodCardModel4;

  @override
  void initState(BuildContext context) {
    // foodCardModel1 = createModel(context, () => FoodCardModel());
    // foodCardModel2 = createModel(context, () => FoodCardModel());
    // foodCardModel3 = createModel(context, () => FoodCardModel());
    // foodCardModel4 = createModel(context, () => FoodCardModel());
  }

  @override
  void dispose() {
    searchFieldFocusNode?.dispose();
    searchFieldTextController?.dispose();

    // foodCardModel1.dispose();
    // foodCardModel2.dispose();
    // foodCardModel3.dispose();
    // foodCardModel4.dispose();
  }

  Future<void> addFoodLog(
      BuildContext context, FoodCardModel modelCard, int? petId) async {
        
    final petViewModel = Provider.of<PetViewModel>(context, listen: false);
    // Extract info from the modelCard's widget
    final foodName = (modelCard.widget?.title ?? 'failed to fetch foodName').trim();
    final amount = (modelCard.widget?.portion ?? '-1').toString();
    final calories = (modelCard.widget?.calories ?? '-1').toString();
    final gLoad = (modelCard.widget?.label ?? '-1').toString();
    
    final newFoodLog = FoodLog(
      foodName: foodName,
      amount: petViewModel.modifyNum(amount),
      calories: petViewModel.modifyNum(calories),
      pet_id: petId,
      gLoad: int.tryParse(gLoad),
    );

    try {
      await Provider.of<PetViewModel>(context, listen: false).addFoodLog(newFoodLog);

      print('Inserted: $foodName');
    } catch (error) {
      print('Error inserting $foodName: $error');
    } finally {

    }
  }
}
