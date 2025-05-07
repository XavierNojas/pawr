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
import 'mood_card_model.dart';
export 'mood_card_model.dart';

import 'package:paw_r_app/view_models/pet_view_model.dart';


class MoodCardWidget extends StatefulWidget {
  const MoodCardWidget({
    super.key,
    this.title,
    this.description,
    required this.color,
    this.cardId,
  });

  final String? title;
  final String? description;
  final Color color;
  final int? cardId;

  get amount => null;


  @override
  State<MoodCardWidget> createState() => _MoodCardWidgetState();
}

class _MoodCardWidgetState extends State<MoodCardWidget>
    with TickerProviderStateMixin {
  late MoodCardModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MoodCardModel());

    animationsMap.addAll({
      'containerOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 100.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(0.95, 0.95),
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
        height: MediaQuery.of(context).size.height * 0.18,
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(24.0),
          border: Border.all(
            color: valueOrDefault<Color>(
              _model.selected!
                  ? FlutterFlowTheme.of(context).primary
                  : widget.color, widget.color
            ),
            width: 3.0,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            // Padding(
            //   padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
            //   child: ClipRRect(
            //     borderRadius: BorderRadius.circular(16.0),
            //     child: Container(
            //       width: 80.0,
            //       height: 80.0,
            //       decoration: BoxDecoration(
            //         color: FlutterFlowTheme.of(context).warning,
            //         image: DecorationImage(
            //           fit: BoxFit.cover,
            //           image: Image.asset(
            //             'assets/images/food.png',
            //           ).image,
            //         ),
            //         borderRadius: BorderRadius.circular(16.0),
            //       ),
            //     ),
            //   ),
            // ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16.0),
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
                            widget!.title!,
                            maxLines: 2,
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  fontFamily: 'Manrope',
                                  color: valueOrDefault<Color>(
                                    _model.selected!
                                        ? FlutterFlowTheme.of(context).primary
                                        : FlutterFlowTheme.of(context).primaryText,
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
                            color: widget.color,
                            shape: BoxShape.circle,
                          ),
                          child: Visibility(
                            visible: _model.selected ?? true,
                            child: Align(
                              alignment: AlignmentDirectional(1.0, -1.0),
                              child: Icon(
                                Icons.check_circle,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 30
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Flexible(
                          // 👈 Wrap the Text in Flexible to prevent overflow
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 8.0, 0.0),
                            child: Text(
                              widget.description ?? '',
                              softWrap: true, // 👈 Allows text to wrap
                              overflow: TextOverflow
                                  .ellipsis, // 👈 Optional: use fade/ellipsis/clip
                              maxLines:
                                  3, // 👈 Set how many lines you want to show (adjust as needed)
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Manrope',
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    letterSpacing: 0.0,
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
