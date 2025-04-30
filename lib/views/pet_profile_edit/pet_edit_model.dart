import '/components/field_box_widget.dart';
import '/components/pet_list_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/index.dart';
import 'pet_edit_widget.dart' show PetProfileEditWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:paw_r_app/view_models/pet_view_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:paw_r_app/models/pet.dart';

import 'package:paw_r_app/views/pet_profile/pet_profile_widget.dart';

class PetProfileEditModel extends FlutterFlowModel<PetProfileEditWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for PetList component.
  late PetListModel petListModel;
  // Model for FieldBox component.
  late FieldBoxModel fieldBoxModel;
  // State field(s) for NameField widget.
  FocusNode? nameFieldFocusNode1;
  TextEditingController? nameFieldTextController1;
  String? Function(BuildContext, String?)? nameFieldTextController1Validator;
  // State field(s) for NameField widget.
  // FocusNode? nameFieldFocusNode2;
  // TextEditingController? nameFieldTextController2;
  // String? Function(BuildContext, String?)? nameFieldTextController2Validator;
  // // State field(s) for NameField widget.
  // FocusNode? nameFieldFocusNode3;
  // TextEditingController? nameFieldTextController3;
  // String? Function(BuildContext, String?)? nameFieldTextController3Validator;
  // // State field(s) for NameField widget.
  // FocusNode? nameFieldFocusNode4;
  // TextEditingController? nameFieldTextController4;
  // String? Function(BuildContext, String?)? nameFieldTextController4Validator;
  // // State field(s) for NameField widget.
  FocusNode? nameFieldFocusNode5;
  TextEditingController? nameFieldTextController5;
  String? Function(BuildContext, String?)? nameFieldTextController5Validator;
  // State field(s) for NameField widget.
  FocusNode? nameFieldFocusNode6;
  TextEditingController? nameFieldTextController6;
  String? Function(BuildContext, String?)? nameFieldTextController6Validator;

  // State field(s) for NameField widget.
  FocusNode? petNameFocusNode;
  TextEditingController? petNameTextController;
  String? Function(BuildContext, String?)? petNameTextControllerValidator;

  @override
  void initState(BuildContext context) {
    petListModel = createModel(context, () => PetListModel());
    fieldBoxModel = createModel(context, () => FieldBoxModel());

    petNameTextControllerValidator = (context, value) {
      if (value == null || value.trim().isEmpty) {
        return 'Please enter a pet name';
      }
      return null;
    };

    nameFieldTextController1Validator = (context, value) {
      if (value == null || value.trim().isEmpty) {
        return 'Please enter a breed';
      }
      return null;
    };

    nameFieldTextController5Validator = (context, value) {
      if (value == null || value.trim().isEmpty) {
        return 'Please enter an age';
      }
      if (double.tryParse(value.trim()) == null) {
        return 'Age must be a number';
      }
      return null;
    };

    nameFieldTextController6Validator = (context, value) {
      if (value == null || value.trim().isEmpty) {
        return 'Please enter a weight';
      }
      if (double.tryParse(value.trim()) == null) {
        return 'Weight must be a number';
      }
      return null;
    };
  }

  @override
  void dispose() {
    petListModel.dispose();
    fieldBoxModel.dispose();

    // Breed Name
    nameFieldFocusNode1?.dispose();
    nameFieldTextController1?.dispose();

    // nameFieldFocusNode2?.dispose();
    // nameFieldTextController2?.dispose();

    // nameFieldFocusNode3?.dispose();
    // nameFieldTextController3?.dispose();

    // nameFieldFocusNode4?.dispose();
    // nameFieldTextController4?.dispose();

    // Age
    nameFieldFocusNode5?.dispose();
    nameFieldTextController5?.dispose();

    // Weight
    nameFieldFocusNode6?.dispose();
    nameFieldTextController6?.dispose();

    // Pet Name
    petNameFocusNode?.dispose();
    petNameTextController?.dispose();
  }

  bool isDecimal(double? value) {
    if (value != null) {
      return value % 1 == 0;
    }
    return false;
  }

// determines if value is close to whole number
  bool isFirstDecimalDigitZero(double? value) {
    final stringValue = value.toString();
    final decimalIndex = stringValue.indexOf('.');
    final valAfterDot = int.tryParse(stringValue[decimalIndex + 1]);

    return valAfterDot == 0;
  }

  Future<void> addNewPet(
      BuildContext context, GlobalKey<FormState> formKey, Pet pet) async {
    final petName = petNameTextController.text.trim();
    final petBreed = nameFieldTextController1.text.trim();
    final age = nameFieldTextController5.text.trim();
    var weightString = nameFieldTextController6.text.trim();

    if (formKey.currentState?.validate() ?? false) {
      // verify if weight has decimal
      if (isDecimal(double.tryParse(nameFieldTextController6.text.trim()))) {
        weightString = '$weightString.0009';
      } else {
        weightString = weightString;
      }

      double? age = double.tryParse(nameFieldTextController5.text.trim());
      double? weight = double.tryParse(weightString);

      final updatePet = Pet(
        id: widget?.pet.id ?? -1,
        name: petName,
        user_id: Supabase.instance.client.auth.currentUser?.id ??
            'failed_user_authentication',
        breed: petBreed,
        age: age?.toInt() ?? -1,
        weight: weight,
      );

      try {
        await Provider.of<PetViewModel>(context, listen: false)
            .updatePet(updatePet);
        // Navigator.popUntil(context, ModalRoute.withName('/homeNav'));
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => PetProfileWidget(pet: updatePet)));
      } catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error updating contact: $error")),
        );
      } finally {
        // do something
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Pet Profile Updated!')),
        );
      }
    }
  }
}
