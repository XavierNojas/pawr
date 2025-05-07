import 'package:paw_r_app/view_models/pet_view_model.dart';
import 'package:paw_r_app/views/log_food/log_food_widget.dart';
import 'package:paw_r_app/views/screen_navigator.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pet_profile_model.dart';
export 'pet_profile_model.dart';
import 'package:paw_r_app/models/pet.dart';

import 'package:paw_r_app/views/pet_profile_edit/pet_edit_widget.dart';

import 'package:paw_r_app/flutter_flow/flutter_flow_animations.dart';

import 'package:flutter_animate/src/effects/move_effect.dart';

import 'package:flutter_animate/src/effects/visibility_effect.dart';

import 'package:flutter_animate/src/effects/fade_effect.dart';

import 'package:flutter_animate/src/extensions/num_duration_extensions.dart';

import 'package:paw_r_app/views/log_mood/log_mood_widget.dart';

import 'package:paw_r_app/views/log_activity/log_activity_widget.dart';

class PetProfileWidget extends StatefulWidget {
  final Pet pet;
  final bool isFromFriend;

  const PetProfileWidget({Key? key, required this.pet, required this.isFromFriend}) : super(key: key);

  static String routeName = 'PetProfile';
  static String routePath = '/petProfile';

  @override
  State<PetProfileWidget> createState() => _PetProfileWidgetState();
}

class _PetProfileWidgetState extends State<PetProfileWidget> {
  late PetProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  late String petName;
  late String petBreed;
  late String petAge;
  late String petWeight;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PetProfileModel());
    petName = widget.pet.name;
    petBreed = widget.pet.breed;
    petAge = (widget.pet.age).toString();

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
      'textFieldOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 75.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 75.0.ms,
            duration: 400.0.ms,
            begin: Offset(10.0, 0.0),
            end: Offset(0.0, 0.0),
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
      'foodCardOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 200.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 400.0.ms,
            begin: Offset(10.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 200.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'foodCardOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 300.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 400.0.ms,
            begin: Offset(10.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 200.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'foodCardOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 400.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 400.0.ms,
            duration: 400.0.ms,
            begin: Offset(10.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 400.0.ms,
            duration: 200.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'foodCardOnPageLoadAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 500.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 500.0.ms,
            duration: 400.0.ms,
            begin: Offset(10.0, 0.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 500.0.ms,
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

  // determaxes if parameter is double
  bool isDecimal(double? value) {
    if (value != null) {
      return value % 1 != 0;
    }
    print('value is null');
    return false;
  }

  // determaxes if value is close to whole number
  bool isFirstDecimalDigitZero(double? value) {
    if (isDecimal(value)) {
      final stringValue = value.toString();
      final decimalIndex = stringValue.indexOf('.');
      final valAfterDot = int.tryParse(stringValue[decimalIndex + 1]);

      return valAfterDot == 0;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    // removes mantissa if decimal is close to whole number
    double? weight;
    late int intWeight;

    if (isFirstDecimalDigitZero(widget.pet.weight)) {
      // if weight does not have decimal, remove mantissa
      intWeight = (widget.pet.weight)?.toInt() ?? -1;
      weight = intWeight.toDouble();
    } else {
      weight = widget.pet.weight;
    }
    petWeight = (weight).toString();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Pet Profile'),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {

              if (widget.isFromFriend) {
                Navigator.pop(context);
              } else {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ScreenNavigator(), // replace with your widget
                  ),
                );
              }

            },
          ),
        ),
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).accent1,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    width: 140.0,
                    child: Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 0.0),
                            child: Container(
                              width: 100.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                shape: BoxShape.circle,
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(2.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50.0),
                                  child: Image.asset(
                                    'assets/images/Urie.jpg',
                                    width: 300.0,
                                    height: 100.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4.0,
                            color: Color(0x33000000),
                            offset: Offset(
                              0.0,
                              2.0,
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.circular(12.0),
                        shape: BoxShape.rectangle,
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15.0, 0.0, 0.0, 0.0),
                                    child: Text(
                          '$petName',
                          textAlign: TextAlign.start,
                          style: FlutterFlowTheme.of(context).bodyMedium
                              .override(
                                fontFamily: 'Manrope',
                                fontSize: 24.0,
                                color: FlutterFlowTheme.of(context).secondary,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                              ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      '$petBreed',
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Manrope',
                                            color: FlutterFlowTheme.of(context).primary,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                ),



                            const SizedBox(height: 10.0),

                            Container(
                              width: double.infinity,
                              height: 1.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).alternate,
                              ),
                            ),

                            const SizedBox(height: 10.0),




                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 90.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, -1.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 5.0, 0.0),
                                            child: Text(
                                              'Age',
                                              textAlign: TextAlign.center,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 1.0),
                                          child: Text(
                                            '$petAge years old',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Manrope',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 100.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, -1.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 5.0, 0.0),
                                            child: Text(
                                              'Weight',
                                              textAlign: TextAlign.center,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 1.0),
                                          child: Text(
                                            '$petWeight kg',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Manrope',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // Container(
                                  //   width: 100.0,
                                  //   height: 40.0,
                                  //   decoration: BoxDecoration(
                                  //     color: FlutterFlowTheme.of(context)
                                  //         .secondaryBackground,
                                  //   ),
                                  //   child: Stack(
                                  //     children: [
                                  //       Align(
                                  //         alignment:
                                  //             AlignmentDirectional(0.0, -1.0),
                                  //         child: Padding(
                                  //           padding:
                                  //               EdgeInsetsDirectional.fromSTEB(
                                  //                   5.0, 0.0, 5.0, 0.0),
                                  //           child: Text(
                                  //             'Height',
                                  //             textAlign: TextAlign.center,
                                  //             style:
                                  //                 FlutterFlowTheme.of(context)
                                  //                     .bodyMedium
                                  //                     .override(
                                  //                       fontFamily: 'Manrope',
                                  //                       letterSpacing: 0.0,
                                  //                       fontWeight:
                                  //                           FontWeight.w600,
                                  //                     ),
                                  //           ),
                                  //         ),
                                  //       ),
                                  //       Align(
                                  //         alignment:
                                  //             AlignmentDirectional(0.0, 1.0),
                                  //         child: Text(
                                  //           '54 cm',
                                  //           style: FlutterFlowTheme.of(context)
                                  //               .bodyMedium
                                  //               .override(
                                  //                 fontFamily: 'Manrope',
                                  //                 letterSpacing: 0.0,
                                  //               ),
                                  //         ),
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                            
                              ],
                            ),
                          ),
                          // Align(
                          //   alignment: AlignmentDirectional(1.0, 0.0),
                          //   child: Padding(
                          //     padding: EdgeInsetsDirectional.fromSTEB(
                          //         0.0, 8.0, 15.0, 8.0),
                          //     child: Icon(
                          //       Icons.pets,
                          //       color: Colors.green[700],
                          //       size: 24.0,
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding:
                  //       EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                  //   child: Container(
                  //     width: double.infinity,
                  //     decoration: BoxDecoration(
                  //       color: FlutterFlowTheme.of(context).secondaryBackground,
                  //       boxShadow: [
                  //         BoxShadow(
                  //           blurRadius: 3.0,
                  //           color: Color(0x33000000),
                  //           offset: Offset(
                  //             0.0,
                  //             -1.0,
                  //           ),
                  //         )
                  //       ],
                  //       borderRadius: BorderRadius.circular(15.0),
                  //     ),
                  //     child: Padding(
                  //       padding: EdgeInsetsDirectional.fromSTEB(
                  //           16.0, 15.0, 16.0, 15.0),
                  //       child: Column(
                  //         mainAxisSize: MainAxisSize.max,
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Padding(
                  //             padding: EdgeInsetsDirectional.fromSTEB(
                  //                 0.0, 0.0, 0.0, 8.0),
                  //             child: Row(
                  //               mainAxisSize: MainAxisSize.max,
                  //               mainAxisAlignment: MainAxisAlignment.center,
                  //               children: [
                  //                 Container(
                  //                   width: 90.0,
                  //                   height: 40.0,
                  //                   decoration: BoxDecoration(
                  //                     color: FlutterFlowTheme.of(context)
                  //                         .secondaryBackground,
                  //                   ),
                  //                   child: Stack(
                  //                     children: [
                  //                       Align(
                  //                         alignment:
                  //                             AlignmentDirectional(0.0, -1.0),
                  //                         child: Padding(
                  //                           padding:
                  //                               EdgeInsetsDirectional.fromSTEB(
                  //                                   5.0, 0.0, 5.0, 0.0),
                  //                           child: Text(
                  //                             'Age',
                  //                             textAlign: TextAlign.center,
                  //                             style:
                  //                                 FlutterFlowTheme.of(context)
                  //                                     .bodyMedium
                  //                                     .override(
                  //                                       fontFamily: 'Manrope',
                  //                                       letterSpacing: 0.0,
                  //                                       fontWeight:
                  //                                           FontWeight.w600,
                  //                                     ),
                  //                           ),
                  //                         ),
                  //                       ),
                  //                       Align(
                  //                         alignment:
                  //                             AlignmentDirectional(0.0, 1.0),
                  //                         child: Text(
                  //                           '$petAge years old',
                  //                           style: FlutterFlowTheme.of(context)
                  //                               .bodyMedium
                  //                               .override(
                  //                                 fontFamily: 'Manrope',
                  //                                 letterSpacing: 0.0,
                  //                               ),
                  //                         ),
                  //                       ),
                  //                     ],
                  //                   ),
                  //                 ),
                  //                 Container(
                  //                   width: 100.0,
                  //                   height: 40.0,
                  //                   decoration: BoxDecoration(
                  //                     color: FlutterFlowTheme.of(context)
                  //                         .secondaryBackground,
                  //                   ),
                  //                   child: Stack(
                  //                     children: [
                  //                       Align(
                  //                         alignment:
                  //                             AlignmentDirectional(0.0, -1.0),
                  //                         child: Padding(
                  //                           padding:
                  //                               EdgeInsetsDirectional.fromSTEB(
                  //                                   5.0, 0.0, 5.0, 0.0),
                  //                           child: Text(
                  //                             'Weight',
                  //                             textAlign: TextAlign.center,
                  //                             style:
                  //                                 FlutterFlowTheme.of(context)
                  //                                     .bodyMedium
                  //                                     .override(
                  //                                       fontFamily: 'Manrope',
                  //                                       letterSpacing: 0.0,
                  //                                       fontWeight:
                  //                                           FontWeight.w600,
                  //                                     ),
                  //                           ),
                  //                         ),
                  //                       ),
                  //                       Align(
                  //                         alignment:
                  //                             AlignmentDirectional(0.0, 1.0),
                  //                         child: Text(
                  //                           '$petWeight kg',
                  //                           style: FlutterFlowTheme.of(context)
                  //                               .bodyMedium
                  //                               .override(
                  //                                 fontFamily: 'Manrope',
                  //                                 letterSpacing: 0.0,
                  //                               ),
                  //                         ),
                  //                       ),
                  //                     ],
                  //                   ),
                  //                 ),
                  //                 // Container(
                  //                 //   width: 100.0,
                  //                 //   height: 40.0,
                  //                 //   decoration: BoxDecoration(
                  //                 //     color: FlutterFlowTheme.of(context)
                  //                 //         .secondaryBackground,
                  //                 //   ),
                  //                 //   child: Stack(
                  //                 //     children: [
                  //                 //       Align(
                  //                 //         alignment:
                  //                 //             AlignmentDirectional(0.0, -1.0),
                  //                 //         child: Padding(
                  //                 //           padding:
                  //                 //               EdgeInsetsDirectional.fromSTEB(
                  //                 //                   5.0, 0.0, 5.0, 0.0),
                  //                 //           child: Text(
                  //                 //             'Height',
                  //                 //             textAlign: TextAlign.center,
                  //                 //             style:
                  //                 //                 FlutterFlowTheme.of(context)
                  //                 //                     .bodyMedium
                  //                 //                     .override(
                  //                 //                       fontFamily: 'Manrope',
                  //                 //                       letterSpacing: 0.0,
                  //                 //                       fontWeight:
                  //                 //                           FontWeight.w600,
                  //                 //                     ),
                  //                 //           ),
                  //                 //         ),
                  //                 //       ),
                  //                 //       Align(
                  //                 //         alignment:
                  //                 //             AlignmentDirectional(0.0, 1.0),
                  //                 //         child: Text(
                  //                 //           '54 cm',
                  //                 //           style: FlutterFlowTheme.of(context)
                  //                 //               .bodyMedium
                  //                 //               .override(
                  //                 //                 fontFamily: 'Manrope',
                  //                 //                 letterSpacing: 0.0,
                  //                 //               ),
                  //                 //         ),
                  //                 //       ),
                  //                 //     ],
                  //                 //   ),
                  //                 // ),
                  //               ],
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),



                  Padding(
                    padding:
                        const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [


                      if (!widget.isFromFriend)

                        Flexible(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Container(
                                  width: 44.0,
                                  height: 44.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    shape: BoxShape.circle,
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: IconButton(
                                      icon: Icon(Icons.delete),
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      iconSize: 24.0,
                                      onPressed: () async {
                                        print('icon pressed ...');


                                          final vmPet = Provider.of<PetViewModel>(context, listen: false);
                                          await vmPet.deletePet(widget.pet.id!);
                                          await vmPet.fetchPets;

                                          if (widget.isFromFriend) {

                                            Navigator.pop(context);

                                          } else {

                                          Navigator.pushReplacement(context, MaterialPageRoute(
                                            builder: (context) =>
                                            ScreenNavigator(), // replace with your widget
                                            ),
                                          );

                                          }


                                      }),
                                ),
                              ),
                              Text(
                                'Delete',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Manrope',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        // Flexible(
                        //   child: Padding(
                        //     padding: EdgeInsetsDirectional.fromSTEB(
                        //         4.0, 0.0, 4.0, 0.0),
                        //     child: Column(
                        //       mainAxisSize: MainAxisSize.max,
                        //       children: [
                        //         Padding(
                        //           padding: EdgeInsetsDirectional.fromSTEB(
                        //               0.0, 0.0, 0.0, 12.0),
                        //           child: Container(
                        //             width: 44.0,
                        //             height: 44.0,
                        //             decoration: BoxDecoration(
                        //               color: FlutterFlowTheme.of(context)
                        //                   .secondaryBackground,
                        //               shape: BoxShape.circle,
                        //             ),
                        //             alignment: AlignmentDirectional(0.0, 0.0),
                        //             child: IconButton(
                        //               icon: Icon(Icons.notifications_outlined),
                        //               color: FlutterFlowTheme.of(context)
                        //                   .primaryText,
                        //               iconSize: 24.0,
                        //               onPressed: () {
                        //                 print('icon pressed ...');
                        //               },
                        //             ),
                        //           ),
                        //         ),
                        //         Text(
                        //           'Notifications',
                        //           textAlign: TextAlign.center,
                        //           style: FlutterFlowTheme.of(context)
                        //               .titleSmall
                        //               .override(
                        //                 fontFamily: 'Manrope',
                        //                 letterSpacing: 0.0,
                        //               ),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),

                    if (!widget.isFromFriend)
                    
                        Flexible(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Container(
                                  width: 44.0,
                                  height: 44.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    shape: BoxShape.circle,
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: IconButton(
                                    icon: const Icon(Icons.edit_note),
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    iconSize: 24.0,
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                PetProfileEditWidget(
                                                    pet: widget.pet,
                                                    isFromFriend: widget.isFromFriend),
                                          ));
                                    },
                                  ),
                                ),
                              ),
                              Text(
                                'Profile',
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Manrope',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 3.0,
                            color: Color(0x33000000),
                            offset: Offset(
                              0.0,
                              -1.0,
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 16.0, 16.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 12.0),
                                  child: Text(
                                    'Status',
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily: 'Manrope',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                                // Padding(
                                //   padding: EdgeInsetsDirectional.fromSTEB(
                                //       0.0, 0.0, 0.0, 8.0),
                                //   child: Row(
                                //     mainAxisSize: MainAxisSize.max,
                                //     mainAxisAlignment: MainAxisAlignment.start,
                                //     children: [
                                //       Padding(
                                //         padding: EdgeInsetsDirectional.fromSTEB(
                                //             0.0, 8.0, 16.0, 8.0),
                                //         child: FaIcon(
                                //           FontAwesomeIcons.solidHeart,
                                //           color: Color(0xFFFF6BC3),
                                //           size: 24.0,
                                //         ),
                                //       ),
                                //       Flexible(
                                //         child: Padding(
                                //           padding:
                                //               EdgeInsetsDirectional.fromSTEB(
                                //                   0.0, 0.0, 12.0, 0.0),
                                //           child: Text(
                                //             'Health',
                                //             textAlign: TextAlign.start,
                                //             style: FlutterFlowTheme.of(context)
                                //                 .bodyMedium
                                //                 .override(
                                //                   fontFamily: 'Manrope',
                                //                   letterSpacing: 0.0,
                                //                 ),
                                //           ),
                                //         ),
                                //       ),
                                //       Flexible(
                                //         child: Padding(
                                //           padding:
                                //               EdgeInsetsDirectional.fromSTEB(
                                //                   0.0, 0.0, 12.0, 0.0),
                                //           child: Text(
                                //             'Last vaccinated (2 mon. ago)',
                                //             textAlign: TextAlign.start,
                                //             style: FlutterFlowTheme.of(context)
                                //                 .bodyMedium
                                //                 .override(
                                //                   fontFamily: 'Manrope',
                                //                   fontSize: 10.0,
                                //                   letterSpacing: 0.0,
                                //                   fontWeight: FontWeight.w800,
                                //                 ),
                                //           ),
                                //         ),
                                //       ),
                                //       FFButtonWidget(
                                //         onPressed: () {
                                //           print('CheckHealth pressed ...');
                                //         },
                                //         text: 'Log Health',
                                //         options: FFButtonOptions(
                                //           height: 40.0,
                                //           padding:
                                //               EdgeInsetsDirectional.fromSTEB(
                                //                   16.0, 0.0, 16.0, 0.0),
                                //           iconPadding:
                                //               EdgeInsetsDirectional.fromSTEB(
                                //                   0.0, 0.0, 0.0, 0.0),
                                //           color: FlutterFlowTheme.of(context)
                                //               .primary,
                                //           textStyle:
                                //               FlutterFlowTheme.of(context)
                                //                   .titleSmall
                                //                   .override(
                                //                     fontFamily: 'Manrope',
                                //                     color: Colors.white,
                                //                     letterSpacing: 0.0,
                                //                   ),
                                //           elevation: 0.0,
                                //           borderRadius:
                                //               BorderRadius.circular(8.0),
                                //         ),
                                //       ),
                                //     ],
                                //   ),
                                // ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 8.0, 16.0, 8.0),
                                          child: FaIcon(
                                            FontAwesomeIcons.walking,
                                            color: Color(0xFF10A2FF),
                                            size: 24.0,
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 12.0, 0.0),
                                          child: Text(
                                            'Activity',
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Manrope',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 12.0, 0.0),
                                          child: Text(
                                            'Last walked (2d ago)',
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Manrope',
                                                  fontSize: 10.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w800,
                                                ),
                                          ),
                                        ),
                                      ),
                                      FFButtonWidget(
                                        onPressed: () {
                                          print('CheckHealth pressed ...');
                                           Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    LogActivityWidget(
                                                        pet: widget.pet),
                                              ));
                                        },
                                        text: 'Log Activity',
                                        options: FFButtonOptions(
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Manrope',
                                                    color: Colors.white,
                                                    letterSpacing: 0.0,
                                                  ),
                                          elevation: 0.0,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 16.0, 8.0),
                                        child: FaIcon(
                                          FontAwesomeIcons.bone,
                                          color: Color(0xFF45F31F),
                                          size: 24.0,
                                        ),
                                      ),
                                      Flexible(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 12.0, 0.0),
                                          child: Text(
                                            'Food',
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Manrope',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 12.0, 0.0),
                                          child: Text(
                                            'Last fed (4h ago)',
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Manrope',
                                                  fontSize: 10.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w800,
                                                ),
                                          ),
                                        ),
                                      ),
                                      FFButtonWidget(
                                        onPressed: () {
                                          print('CheckFood pressed ...');
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    LogFoodWidget(
                                                        pet: widget.pet),
                                              ));
                                        },
                                        text: 'Log Food',
                                        options: FFButtonOptions(
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Manrope',
                                                    color: Colors.white,
                                                    letterSpacing: 0.0,
                                                  ),
                                          elevation: 0.0,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 16.0, 8.0),
                                        child: FaIcon(
                                          FontAwesomeIcons.solidSmileBeam,
                                          color: Color(0xFF6D6FFF),
                                          size: 24.0,
                                        ),
                                      ),
                                      Flexible(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 12.0, 0.0),
                                          child: Text(
                                            'Mood',
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Manrope',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 12.0, 0.0),
                                          child: Text(
                                            'Felt sad (2d ago)',
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Manrope',
                                                  fontSize: 10.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w800,
                                                ),
                                          ),
                                        ),
                                      ),
                                      FFButtonWidget(
                                        onPressed: () {
                                          print('CheckFood pressed ...');
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    LogMoodWidget(
                                                        pet: widget.pet),
                                              ));
                                        },
                                        text: 'Log Mood',
                                        options: FFButtonOptions(
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Manrope',
                                                    color: Colors.white,
                                                    letterSpacing: 0.0,
                                                  ),
                                          elevation: 0.0,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // Padding(
                                //   padding: EdgeInsetsDirectional.fromSTEB(
                                //       0.0, 0.0, 0.0, 8.0),
                                //   child: Row(
                                //     mainAxisSize: MainAxisSize.max,
                                //     mainAxisAlignment: MainAxisAlignment.center,
                                //     children: [
                                //       Padding(
                                //         padding: EdgeInsetsDirectional.fromSTEB(
                                //             5.0, 5.0, 5.0, 5.0),
                                //         child: FFButtonWidget(
                                //           onPressed: () {
                                //             print('Button pressed ...');
                                //           },
                                //           text: 'Check Activity',
                                //           options: FFButtonOptions(
                                //             height: 60.0,
                                //             padding:
                                //                 EdgeInsetsDirectional.fromSTEB(
                                //                     16.0, 0.0, 16.0, 0.0),
                                //             iconPadding:
                                //                 EdgeInsetsDirectional.fromSTEB(
                                //                     0.0, 0.0, 0.0, 0.0),
                                //             color: FlutterFlowTheme.of(context)
                                //                 .tertiary,
                                //             textStyle:
                                //                 FlutterFlowTheme.of(context)
                                //                     .titleSmall
                                //                     .override(
                                //                       fontFamily: 'Manrope',
                                //                       color: Colors.white,
                                //                       fontSize: 8.0,
                                //                       letterSpacing: 0.0,
                                //                     ),
                                //             elevation: 0.0,
                                //             borderRadius:
                                //                 BorderRadius.circular(8.0),
                                //           ),
                                //         ),
                                //       ),
                                //       Padding(
                                //         padding: EdgeInsetsDirectional.fromSTEB(
                                //             5.0, 5.0, 5.0, 5.0),
                                //         child: FFButtonWidget(
                                //           onPressed: () {
                                //             print('Button pressed ...');
                                //           },
                                //           text: 'Check Food',
                                //           options: FFButtonOptions(
                                //             height: 60.0,
                                //             padding:
                                //                 EdgeInsetsDirectional.fromSTEB(
                                //                     16.0, 0.0, 16.0, 0.0),
                                //             iconPadding:
                                //                 EdgeInsetsDirectional.fromSTEB(
                                //                     0.0, 0.0, 0.0, 0.0),
                                //             color: FlutterFlowTheme.of(context)
                                //                 .primary,
                                //             textStyle:
                                //                 FlutterFlowTheme.of(context)
                                //                     .titleSmall
                                //                     .override(
                                //                       fontFamily: 'Manrope',
                                //                       color: Colors.white,
                                //                       fontSize: 8.0,
                                //                       letterSpacing: 0.0,
                                //                     ),
                                //             elevation: 0.0,
                                //             borderRadius:
                                //                 BorderRadius.circular(8.0),
                                //           ),
                                //         ),
                                //       ),
                                //       Padding(
                                //         padding: EdgeInsetsDirectional.fromSTEB(
                                //             5.0, 5.0, 5.0, 5.0),
                                //         child: FFButtonWidget(
                                //           onPressed: () {
                                //             print('Button pressed ...');
                                //           },
                                //           text: 'Check Mood',
                                //           options: FFButtonOptions(
                                //             height: 60.0,
                                //             padding:
                                //                 EdgeInsetsDirectional.fromSTEB(
                                //                     16.0, 0.0, 16.0, 0.0),
                                //             iconPadding:
                                //                 EdgeInsetsDirectional.fromSTEB(
                                //                     0.0, 0.0, 0.0, 0.0),
                                //             color: FlutterFlowTheme.of(context)
                                //                 .info,
                                //             textStyle:
                                //                 FlutterFlowTheme.of(context)
                                //                     .titleSmall
                                //                     .override(
                                //                       fontFamily: 'Manrope',
                                //                       color: Colors.white,
                                //                       fontSize: 8.0,
                                //                       letterSpacing: 0.0,
                                //                     ),
                                //             elevation: 0.0,
                                //             borderRadius:
                                //                 BorderRadius.circular(8.0),
                                //           ),
                                //         ),
                                //       ),
                                //     ],
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
          ),
        ).animateOnPageLoad(animationsMap['foodCardOnPageLoadAnimation0']!),
      ),
    );
  }
}
