import 'package:paw_r_app/models/moodLog.dart';

import '../../components/mood_log_card_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'log_mood_details_model.dart';
export 'log_mood_details_model.dart';

import 'package:paw_r_app/models/pet.dart';
import 'package:paw_r_app/views/log_food_add/log_food_add_widget.dart';

import 'package:paw_r_app/view_models/pet_view_model.dart';
import 'package:paw_r_app/models/mood.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

class LogMoodDetailsWidget extends StatefulWidget {
  final List<String?> moods;
  final String? description;
  final String? date;

  const LogMoodDetailsWidget(
      {Key? key,
      required this.moods,
      required this.description,
      required this.date})
      : super(key: key);

  static String routeName = 'LogFood';
  static String routePath = '/logFood';

  @override
  State<LogMoodDetailsWidget> createState() => _LogMoodDetailsWidgetState();
}

class _LogMoodDetailsWidgetState extends State<LogMoodDetailsWidget>
    with TickerProviderStateMixin {
  late LogMoodDetailsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LogMoodDetailsModel());

    animationsMap.addAll({
      'textOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: Offset(10.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'foodCardOnPageLoadAnimation0': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 100.ms), // Faster visibility
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 50.0.ms, // Shorter delay
            duration: 200.0.ms, // Faster movement
            begin: Offset(10.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 50.0.ms, // Shorter delay
            duration: 150.0.ms, // Faster fade
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'textOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 100.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 100.0.ms,
            duration: 400.0.ms,
            begin: Offset(10.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 100.0.ms,
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
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(30.0, 20.0, 30.0, 10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30.0,
                        borderWidth: 1.0,
                        buttonSize: 40.0,
                        icon: Icon(
                          Icons.arrow_back_rounded,
                          color: FlutterFlowTheme.of(context).secondary,
                          size: 25.0,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),

                SizedBox(width: 10.0),

                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(30.0, 20.0, 30.0, 10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Text(
                          widget.moods.join(', ') ?? 'list of moods',
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                fontFamily: 'Manrope',
                                color: FlutterFlowTheme.of(context).secondary,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                              ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(30.0, 15.0, 30.0, 15.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        widget.date ?? 'date',
                        style:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: 'Manrope',
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      30.0, 0.0, 30.0, 20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [

                      Container(
                        // width: MediaQuery.sizeOf(context).width * 1.0,
                        // height: MediaQuery.of(context).size.height * 1.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(24.0),
                          border: Border.all(
                            color: valueOrDefault<Color>(
                                FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                FlutterFlowTheme.of(context)
                                    .secondaryBackground),
                            width: 3.0,
                          ),
                        ),
                        child: Row(mainAxisSize: MainAxisSize.max, children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            (widget.description?.isEmpty ?? true) ? 'no description' :
                                              widget.description ?? 'description',
                                            overflow: TextOverflow.fade, // 👈 Optional: use fade/ellipsis/clip
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Manrope',
                                                  color: valueOrDefault<Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .raisinBlack,
                                                    FlutterFlowTheme.of(context)
                                                        .raisinBlack,
                                                  ),
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
                                                  lineHeight: 1.2,
                                                ),
                                          ),
                                        ),
                                      ]),
                                ],
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ).animateOnPageLoad(animationsMap['foodCardOnPageLoadAnimation0']!),
      ),
    );
  }
}
