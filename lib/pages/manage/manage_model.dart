import '/components/field_box_widget.dart';
import '/components/pet_list_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/index.dart';
import 'manage_widget.dart' show ManageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ManageModel extends FlutterFlowModel<ManageWidget> {
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
  FocusNode? nameFieldFocusNode2;
  TextEditingController? nameFieldTextController2;
  String? Function(BuildContext, String?)? nameFieldTextController2Validator;
  // State field(s) for NameField widget.
  FocusNode? nameFieldFocusNode3;
  TextEditingController? nameFieldTextController3;
  String? Function(BuildContext, String?)? nameFieldTextController3Validator;
  // State field(s) for NameField widget.
  FocusNode? nameFieldFocusNode4;
  TextEditingController? nameFieldTextController4;
  String? Function(BuildContext, String?)? nameFieldTextController4Validator;
  // State field(s) for NameField widget.
  FocusNode? nameFieldFocusNode5;
  TextEditingController? nameFieldTextController5;
  String? Function(BuildContext, String?)? nameFieldTextController5Validator;
  // State field(s) for NameField widget.
  FocusNode? nameFieldFocusNode6;
  TextEditingController? nameFieldTextController6;
  String? Function(BuildContext, String?)? nameFieldTextController6Validator;

  @override
  void initState(BuildContext context) {
    petListModel = createModel(context, () => PetListModel());
    fieldBoxModel = createModel(context, () => FieldBoxModel());
  }

  @override
  void dispose() {
    petListModel.dispose();
    fieldBoxModel.dispose();
    nameFieldFocusNode1?.dispose();
    nameFieldTextController1?.dispose();

    nameFieldFocusNode2?.dispose();
    nameFieldTextController2?.dispose();

    nameFieldFocusNode3?.dispose();
    nameFieldTextController3?.dispose();

    nameFieldFocusNode4?.dispose();
    nameFieldTextController4?.dispose();

    nameFieldFocusNode5?.dispose();
    nameFieldTextController5?.dispose();

    nameFieldFocusNode6?.dispose();
    nameFieldTextController6?.dispose();
  }
}
