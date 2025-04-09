import '/components/chip_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/index.dart';
import 'getting_started_widget.dart' show GettingStartedWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GettingStartedModel extends FlutterFlowModel<GettingStartedWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for NameField widget.
  FocusNode? nameFieldFocusNode;
  TextEditingController? nameFieldTextController;
  String? Function(BuildContext, String?)? nameFieldTextControllerValidator;
  // Models for Chip dynamic component.
  late FlutterFlowDynamicModels<ChipModel> chipModels;

  @override
  void initState(BuildContext context) {
    chipModels = FlutterFlowDynamicModels(() => ChipModel());
  }

  @override
  void dispose() {
    nameFieldFocusNode?.dispose();
    nameFieldTextController?.dispose();

    chipModels.dispose();
  }
}
