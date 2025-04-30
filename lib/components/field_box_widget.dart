import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'field_box_model.dart';
export 'field_box_model.dart';

class FieldBoxWidget extends StatefulWidget {
  const FieldBoxWidget({super.key});

  @override
  State<FieldBoxWidget> createState() => _FieldBoxWidgetState();
}

class _FieldBoxWidgetState extends State<FieldBoxWidget>
    with TickerProviderStateMixin {
  late FieldBoxModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FieldBoxModel());

    _model.nameFieldTextController ??= TextEditingController();
    _model.nameFieldFocusNode ??= FocusNode();

    animationsMap.addAll({
      'textFieldOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 75.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 75.0.ms,
            duration: 400.0.ms,
            begin: const Offset(10.0, 0.0),
            end: const Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 75.0.ms,
            duration: 200.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _model.nameFieldTextController,
      focusNode: _model.nameFieldFocusNode,
      autofocus: true,
      obscureText: false,
      decoration: InputDecoration(
        hintText: 'Pet Name',
        hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'Manrope',
              color: FlutterFlowTheme.of(context).secondaryText,
              fontSize: 14.0,
              letterSpacing: 0.0,
            ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0x00000000),
            width: 3.0,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: FlutterFlowTheme.of(context).primary,
            width: 3.0,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0x00000000),
            width: 3.0,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0x00000000),
            width: 3.0,
          ),
          borderRadius: BorderRadius.circular(16.0),
        ),
        filled: true,
        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      style: FlutterFlowTheme.of(context).bodyMedium.override(
            fontFamily: 'Manrope',
            color: FlutterFlowTheme.of(context).primary,
            fontSize: 14.0,
            letterSpacing: 0.0,
          ),
      validator: _model.nameFieldTextControllerValidator.asValidator(context),
    ).animateOnPageLoad(animationsMap['textFieldOnPageLoadAnimation']!);
  }
}
