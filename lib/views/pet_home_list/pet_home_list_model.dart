import '/components/field_box_widget.dart';
import '/components/pet_list_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'pet_home_list_widget.dart' show PetHomeListWidget;
import 'package:flutter/material.dart';

class PetHomeListModel extends FlutterFlowModel<PetHomeListWidget> {
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
  }

  @override
  void dispose() {
    petListModel.dispose();
    fieldBoxModel.dispose();

    // Breed Name
    nameFieldFocusNode1?.dispose();
    nameFieldTextController1?.dispose();
  }
}
