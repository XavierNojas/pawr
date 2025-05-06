import 'package:paw_r_app/view_models/friends_view_model.dart';
import 'package:paw_r_app/views/user_group_manage/user_group_manage_widget.dart';

import '/components/food_card_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import 'user_group_manage_widget.dart' show UserGroupManageAddWidget;
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

class UserGroupManageAddModel extends FlutterFlowModel<UserGroupManageAddWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for SearchField widget.
  FocusNode? nameFieldFocusNode;
  TextEditingController? nameFieldTextController;
  String? Function(BuildContext, String?)? nameFieldTextControllerValidator;

  FocusNode? gLoadFieldFocusNode;
  TextEditingController? gLoadFieldTextController;
  String? Function(BuildContext, String?)? gLoadFieldTextControllerValidator;
    final supabase = Supabase.instance.client;

  @override
  void initState(BuildContext context) {
    nameFieldTextControllerValidator = (context, value) {
      if (value == null || value.trim().isEmpty) {
        return 'Please enter a food name';
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
      return null;
    };

  }

  @override
  void dispose() {
    nameFieldFocusNode?.dispose();
    nameFieldTextController?.dispose();
  }

  Future<void> findUser(
      BuildContext context, GlobalKey<FormState> formKey) async {
    if (!formKey.currentState!.validate()) return;
    final referralCode = nameFieldTextController.text.trim();

    try {
      final String? friend =
          await Provider.of<PetViewModel>(context, listen: false)
              .fetchFriend(referralCode);

      if (friend == supabase.auth.currentUser?.id) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error: You cannot enter your code!')),
        );
        return;
      }

      if (friend == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content:
                  Text('Error: Cannot find friend. Check the referral code.')),
        );
        return;
      }

      await Provider.of<FriendsViewModel>(context, listen: false)
          .insertNewFriend(friend ?? 'NO-REFF-NULL');

      final hasAddedUser = await Provider.of<FriendsViewModel>(context, listen: false)
          .hasAddedUser;

      if (hasAddedUser) {
              ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error: User already Added!')),
      );
      return;
      }

              Navigator.pop(context);
              
      Navigator.pushReplacementNamed(
        context, '/homeNav'
        // MaterialPageRoute(builder: (context) => const UserGroupManageWidget()),
      );

    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error: User cannot be found')),
      );
    } finally {}

    return;
  }


}
