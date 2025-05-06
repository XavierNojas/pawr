import 'package:paw_r_app/components/food_card_model.dart';
import 'package:paw_r_app/components/pet_card_model.dart';
import 'package:paw_r_app/models/foodLog.dart';
import 'package:paw_r_app/view_models/friends_view_model.dart';

import '/components/field_box_widget.dart';
import '/components/pet_list_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/index.dart';
import 'pet_manage_b_widget.dart' show PetManageBWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:paw_r_app/view_models/pet_view_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:paw_r_app/models/pet.dart';

class PetManageBModel extends FlutterFlowModel<PetManageBWidget> {
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

  Future<void> addToFriend(BuildContext context, String friendId,
      List<PetCardModel> petCardCollection) async {
    List<int?> petIdCollection = [];

    for (PetCardModel petCard in petCardCollection) {
      petIdCollection.add(petCard.widget!.cardId);
    }

    try {
      final petVM = Provider.of<FriendsViewModel>(context, listen: false);

      for (int? pet in petIdCollection) {
        await petVM.insertNewPet(friendId, pet.toString());
      }

      if (petVM.hasAddedUser) {
        ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Pet already added!')));
      } else {
        ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Pet successfully added!')));
      }
    } catch (error) {
      // Optionally show a SnackBar or success message
      print('Failed to add pet: $error');
    } finally {
      return;
    }
  }
}
