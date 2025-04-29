import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:math';
import 'dart:ui';
import 'transaction_card_widget.dart' show TransactionCardWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TransactionCardModel extends FlutterFlowModel<TransactionCardWidget> {
  ///  Local state fields for this component.

  bool? selected = false;

  bool? completed = false;

  bool isSelected = false;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
  
}
