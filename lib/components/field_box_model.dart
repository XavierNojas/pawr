import '/flutter_flow/flutter_flow_util.dart';
import 'field_box_widget.dart' show FieldBoxWidget;
import 'package:flutter/material.dart';

class FieldBoxModel extends FlutterFlowModel<FieldBoxWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for NameField widget.
  FocusNode? nameFieldFocusNode;
  TextEditingController? nameFieldTextController;
  String? Function(BuildContext, String?)? nameFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nameFieldFocusNode?.dispose();
    nameFieldTextController?.dispose();
  }
}
