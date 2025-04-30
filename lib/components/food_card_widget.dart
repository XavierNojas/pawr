import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'food_card_model.dart';
export 'food_card_model.dart';

import 'package:paw_r_app/view_models/pet_view_model.dart';

class FoodCardWidget extends StatefulWidget {
  const FoodCardWidget({
    super.key,
    this.title,
    this.portion,
    this.calories,
    this.label,
    this.image,
    this.cardId,
  });

  final String? title;
  final double? portion;
  final double? calories;
  final int? label;
  final String? image;
  final int? cardId;

  get amount => null;

  @override
  State<FoodCardWidget> createState() => _FoodCardWidgetState();
}

class _FoodCardWidgetState extends State<FoodCardWidget>
    with TickerProviderStateMixin {
  late FoodCardModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FoodCardModel());

    animationsMap.addAll({
      'containerOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 100.0.ms,
            begin: const Offset(1.0, 1.0),
            end: const Offset(0.95, 0.95),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        if (animationsMap['containerOnActionTriggerAnimation'] != null) {
          animationsMap['containerOnActionTriggerAnimation']!
              .controller
              .forward(from: 0.0)
              .whenComplete(animationsMap['containerOnActionTriggerAnimation']!
                  .controller
                  .reverse);
        }
        if (_model.selected!) {
          _model.selected = false;
          _model.isSelected = false;
          safeSetState(() {});
        } else {
          _model.selected = true;
          _model.isSelected = true;
          safeSetState(() {});
        }
      },
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        height: 119.5,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(24.0),
          border: Border.all(
            color: valueOrDefault<Color>(
              _model.selected!
                  ? FlutterFlowTheme.of(context).primary
                  : FlutterFlowTheme.of(context).secondaryBackground,
              FlutterFlowTheme.of(context).secondaryBackground,
            ),
            width: 3.0,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Container(
                  width: 80.0,
                  height: 80.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).warning,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: Image.asset(
                        'assets/images/food.png',
                      ).image,
                    ),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            widget.title!,
                            maxLines: 2,
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  fontFamily: 'Manrope',
                                  color: valueOrDefault<Color>(
                                    _model.selected!
                                        ? FlutterFlowTheme.of(context).primary
                                        : FlutterFlowTheme.of(context)
                                            .primaryText,
                                    FlutterFlowTheme.of(context).primaryText,
                                  ),
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  lineHeight: 1.2,
                                ),
                          ),
                        ),
                        Container(
                          width: 35.0,
                          height: 35.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            shape: BoxShape.circle,
                          ),
                          child: Visibility(
                            visible: _model.selected ?? true,
                            child: Align(
                              alignment: const AlignmentDirectional(1.0, -1.0),
                              child: Icon(
                                Icons.check_circle,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 24.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 8.0, 0.0),
                              child: Text(
                                'Amount: ${widget.portion!}',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Manrope',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                            Text(
                              'Calories: ${widget.calories!}',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Manrope',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                        Container(
                          height: 28.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).secondaryText,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 8.0, 0.0),
                              child: Text(
                                (widget.label!).toString(),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Manrope',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      fontSize: 13.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ).animateOnActionTrigger(
      animationsMap['containerOnActionTriggerAnimation']!,
    );
  }
}
