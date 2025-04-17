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



class PetProfileWidget extends StatefulWidget {
  final Pet pet;

  const PetProfileWidget({Key? key, required this.pet}) : super(key: key);

  static String routeName = 'PetProfile';
  static String routePath = '/petProfile';

  @override
  State<PetProfileWidget> createState() => _PetProfileWidgetState();
}

class _PetProfileWidgetState extends State<PetProfileWidget> {
  late PetProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

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
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  // determines if parameter is double
  bool isDecimal(double? value) {
    if (value != null) {
      return value % 1 != 0;
    }
    print('value is null');
    return false;
  }

  // determines if value is close to whole number
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
                        EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                    child: Container(
                      width: double.infinity,
                      height: 80.0,
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
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Manrope',
                                            fontSize: 24.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
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
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(1.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 15.0, 8.0),
                              child: Icon(
                                Icons.pets,
                                color: Colors.green[700],
                                size: 24.0,
                                
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
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
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 15.0, 16.0, 15.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
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
                                              'Height',
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
                                            '54 cm',
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
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 32.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 12.0),
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
                                    icon: Icon(Icons.work_outline),
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    iconSize: 24.0,
                                    onPressed: () {
                                      print('icon pressed ...');
                                    }
                                  ),
                                ),
                              ),
                              Text(
                                'Records',
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
                        Flexible(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                4.0, 0.0, 4.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 12.0),
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
                                      icon: Icon(Icons.notifications_outlined),
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      iconSize: 24.0,
                                      onPressed: () {
                                        print('icon pressed ...');
                                      },
                                    ),
                                    
                                  ),
                                ),
                                Text(
                                  'Notifications',
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
                        ),
                        Flexible(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 12.0),
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
                                      print('icon pressed ...');
                                      Navigator.push(
                                        context, 
                                        MaterialPageRoute(
                                          builder: (context) => PetProfileEditWidget(pet: widget.pet),
                                        )
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Text(
                                'Edit Profile',
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
                  //     // Flexible(
                  //     //   child: Padding(
                  //     //     padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                  //     //     child: Container(
                  //     //       width: double.infinity,
                  //     //       height: 330.0,
                  //     //       decoration: BoxDecoration(
                  //     //         color: FlutterFlowTheme.of(context).secondaryBackground,
                  //     //         boxShadow: [
                  //     //           BoxShadow(
                  //     //             blurRadius: 3.0,
                  //     //             color: Color(0x33000000),
                  //     //             offset: Offset(
                  //     //               0.0,
                  //     //               -1.0,
                  //     //             ),
                  //     //           )
                  //     //         ],
                  //     //         borderRadius: BorderRadius.circular(16.0),
                  //     //       ),
                  //     //       // child: Column(
                  //     //       //   mainAxisSize: MainAxisSize.max,
                  //     //       //   crossAxisAlignment: CrossAxisAlignment.start,
                  //     //       //   children: [
                  //     //       //     Padding(
                  //     //       //       padding: EdgeInsetsDirectional.fromSTEB(
                  //     //       //           16.0, 16.0, 16.0, 0.0),
                  //     //       //       child: Column(
                  //     //       //         mainAxisSize: MainAxisSize.max,
                  //     //       //         crossAxisAlignment: CrossAxisAlignment.start,
                  //     //       //         children: [
                  //     //       //           Padding(
                  //     //       //             padding: EdgeInsetsDirectional.fromSTEB(
                  //     //       //                 0.0, 0.0, 0.0, 12.0),
                  //     //       //             child: Text(
                  //     //       //               'Status',
                  //     //       //               style: FlutterFlowTheme.of(context)
                  //     //       //                   .titleMedium
                  //     //       //                   .override(
                  //     //       //                     fontFamily: 'Manrope',
                  //     //       //                     letterSpacing: 0.0,
                  //     //       //                   ),
                  //     //       //             ),
                  //     //       //           ),
                  //     //       //           Padding(
                  //     //       //             padding: EdgeInsetsDirectional.fromSTEB(
                  //     //       //                 0.0, 0.0, 0.0, 8.0),
                  //     //       //             child: Row(
                  //     //       //               mainAxisSize: MainAxisSize.max,
                  //     //       //               mainAxisAlignment: MainAxisAlignment.start,
                  //     //       //               children: [
                  //     //       //                 Padding(
                  //     //       //                   padding: EdgeInsetsDirectional.fromSTEB(
                  //     //       //                       0.0, 8.0, 16.0, 8.0),
                  //     //       //                   child: FaIcon(
                  //     //       //                     FontAwesomeIcons.solidHeart,
                  //     //       //                     color: Color(0xFFFF6BC3),
                  //     //       //                     size: 24.0,
                  //     //       //                   ),
                  //     //       //                 ),
                  //     //       //                 Flexible(
                  //     //       //                   child: Padding(
                  //     //       //                     padding:
                  //     //       //                         EdgeInsetsDirectional.fromSTEB(
                  //     //       //                             0.0, 0.0, 12.0, 0.0),
                  //     //       //                     child: Text(
                  //     //       //                       'Health',
                  //     //       //                       textAlign: TextAlign.start,
                  //     //       //                       style: FlutterFlowTheme.of(context)
                  //     //       //                           .bodyMedium
                  //     //       //                           .override(
                  //     //       //                             fontFamily: 'Manrope',
                  //     //       //                             letterSpacing: 0.0,
                  //     //       //                           ),
                  //     //       //                     ),
                  //     //       //                   ),
                  //     //       //                 ),
                  //     //       //                 Flexible(
                  //     //       //                   child: Padding(
                  //     //       //                     padding:
                  //     //       //                         EdgeInsetsDirectional.fromSTEB(
                  //     //       //                             0.0, 0.0, 12.0, 0.0),
                  //     //       //                     child: Text(
                  //     //       //                       'Last vaccinated (2 mon. ago)',
                  //     //       //                       textAlign: TextAlign.start,
                  //     //       //                       style: FlutterFlowTheme.of(context)
                  //     //       //                           .bodyMedium
                  //     //       //                           .override(
                  //     //       //                             fontFamily: 'Manrope',
                  //     //       //                             fontSize: 10.0,
                  //     //       //                             letterSpacing: 0.0,
                  //     //       //                             fontWeight: FontWeight.w800,
                  //     //       //                           ),
                  //     //       //                     ),
                  //     //       //                   ),
                  //     //       //                 ),
                  //     //       //                 FFButtonWidget(
                  //     //       //                   onPressed: () {
                  //     //       //                     print('CheckHealth pressed ...');
                  //     //       //                   },
                  //     //       //                   text: 'Log Health',
                  //     //       //                   options: FFButtonOptions(
                  //     //       //                     height: 40.0,
                  //     //       //                     padding:
                  //     //       //                         EdgeInsetsDirectional.fromSTEB(
                  //     //       //                             16.0, 0.0, 16.0, 0.0),
                  //     //       //                     iconPadding:
                  //     //       //                         EdgeInsetsDirectional.fromSTEB(
                  //     //       //                             0.0, 0.0, 0.0, 0.0),
                  //     //       //                     color: FlutterFlowTheme.of(context)
                  //     //       //                         .primary,
                  //     //       //                     textStyle:
                  //     //       //                         FlutterFlowTheme.of(context)
                  //     //       //                             .titleSmall
                  //     //       //                             .override(
                  //     //       //                               fontFamily: 'Manrope',
                  //     //       //                               color: Colors.white,
                  //     //       //                               letterSpacing: 0.0,
                  //     //       //                             ),
                  //     //       //                     elevation: 0.0,
                  //     //       //                     borderRadius:
                  //     //       //                         BorderRadius.circular(8.0),
                  //     //       //                   ),
                  //     //       //                 ),
                  //     //       //               ],
                  //     //       //             ),
                  //     //       //           ),
                  //     //       //           Padding(
                  //     //       //             padding: EdgeInsetsDirectional.fromSTEB(
                  //     //       //                 0.0, 0.0, 0.0, 8.0),
                  //     //       //             child: Row(
                  //     //       //               mainAxisSize: MainAxisSize.max,
                  //     //       //               mainAxisAlignment: MainAxisAlignment.start,
                  //     //       //               children: [
                  //     //       //                 Align(
                  //     //       //                   alignment:
                  //     //       //                       AlignmentDirectional(0.0, 0.0),
                  //     //       //                   child: Padding(
                  //     //       //                     padding:
                  //     //       //                         EdgeInsetsDirectional.fromSTEB(
                  //     //       //                             5.0, 8.0, 16.0, 8.0),
                  //     //       //                     child: FaIcon(
                  //     //       //                       FontAwesomeIcons.walking,
                  //     //       //                       color: Color(0xFF10A2FF),
                  //     //       //                       size: 24.0,
                  //     //       //                     ),
                  //     //       //                   ),
                  //     //       //                 ),
                  //     //       //                 Flexible(
                  //     //       //                   child: Padding(
                  //     //       //                     padding:
                  //     //       //                         EdgeInsetsDirectional.fromSTEB(
                  //     //       //                             0.0, 0.0, 12.0, 0.0),
                  //     //       //                     child: Text(
                  //     //       //                       'Activity',
                  //     //       //                       textAlign: TextAlign.start,
                  //     //       //                       style: FlutterFlowTheme.of(context)
                  //     //       //                           .bodyMedium
                  //     //       //                           .override(
                  //     //       //                             fontFamily: 'Manrope',
                  //     //       //                             letterSpacing: 0.0,
                  //     //       //                           ),
                  //     //       //                     ),
                  //     //       //                   ),
                  //     //       //                 ),
                  //     //       //                 Flexible(
                  //     //       //                   child: Padding(
                  //     //       //                     padding:
                  //     //       //                         EdgeInsetsDirectional.fromSTEB(
                  //     //       //                             0.0, 0.0, 12.0, 0.0),
                  //     //       //                     child: Text(
                  //     //       //                       'Last walked (2d ago)',
                  //     //       //                       textAlign: TextAlign.start,
                  //     //       //                       style: FlutterFlowTheme.of(context)
                  //     //       //                           .bodyMedium
                  //     //       //                           .override(
                  //     //       //                             fontFamily: 'Manrope',
                  //     //       //                             fontSize: 10.0,
                  //     //       //                             letterSpacing: 0.0,
                  //     //       //                             fontWeight: FontWeight.w800,
                  //     //       //                           ),
                  //     //       //                     ),
                  //     //       //                   ),
                  //     //       //                 ),
                  //     //       //                 FFButtonWidget(
                  //     //       //                   onPressed: () {
                  //     //       //                     print('CheckHealth pressed ...');
                  //     //       //                   },
                  //     //       //                   text: 'Log Activity',
                  //     //       //                   options: FFButtonOptions(
                  //     //       //                     height: 40.0,
                  //     //       //                     padding:
                  //     //       //                         EdgeInsetsDirectional.fromSTEB(
                  //     //       //                             16.0, 0.0, 16.0, 0.0),
                  //     //       //                     iconPadding:
                  //     //       //                         EdgeInsetsDirectional.fromSTEB(
                  //     //       //                             0.0, 0.0, 0.0, 0.0),
                  //     //       //                     color: FlutterFlowTheme.of(context)
                  //     //       //                         .primary,
                  //     //       //                     textStyle:
                  //     //       //                         FlutterFlowTheme.of(context)
                  //     //       //                             .titleSmall
                  //     //       //                             .override(
                  //     //       //                               fontFamily: 'Manrope',
                  //     //       //                               color: Colors.white,
                  //     //       //                               letterSpacing: 0.0,
                  //     //       //                             ),
                  //     //       //                     elevation: 0.0,
                  //     //       //                     borderRadius:
                  //     //       //                         BorderRadius.circular(8.0),
                  //     //       //                   ),
                  //     //       //                 ),
                  //     //       //               ],
                  //     //       //             ),
                  //     //       //           ),
                  //     //       //           Padding(
                  //     //       //             padding: EdgeInsetsDirectional.fromSTEB(
                  //     //       //                 0.0, 0.0, 0.0, 8.0),
                  //     //       //             child: Row(
                  //     //       //               mainAxisSize: MainAxisSize.max,
                  //     //       //               mainAxisAlignment: MainAxisAlignment.start,
                  //     //       //               children: [
                  //     //       //                 Padding(
                  //     //       //                   padding: EdgeInsetsDirectional.fromSTEB(
                  //     //       //                       0.0, 8.0, 16.0, 8.0),
                  //     //       //                   child: FaIcon(
                  //     //       //                     FontAwesomeIcons.bone,
                  //     //       //                     color: Color(0xFF45F31F),
                  //     //       //                     size: 24.0,
                  //     //       //                   ),
                  //     //       //                 ),
                  //     //       //                 Flexible(
                  //     //       //                   child: Padding(
                  //     //       //                     padding:
                  //     //       //                         EdgeInsetsDirectional.fromSTEB(
                  //     //       //                             0.0, 0.0, 12.0, 0.0),
                  //     //       //                     child: Text(
                  //     //       //                       'Food',
                  //     //       //                       textAlign: TextAlign.start,
                  //     //       //                       style: FlutterFlowTheme.of(context)
                  //     //       //                           .bodyMedium
                  //     //       //                           .override(
                  //     //       //                             fontFamily: 'Manrope',
                  //     //       //                             letterSpacing: 0.0,
                  //     //       //                           ),
                  //     //       //                     ),
                  //     //       //                   ),
                  //     //       //                 ),
                  //     //       //                 Flexible(
                  //     //       //                   child: Padding(
                  //     //       //                     padding:
                  //     //       //                         EdgeInsetsDirectional.fromSTEB(
                  //     //       //                             0.0, 0.0, 12.0, 0.0),
                  //     //       //                     child: Text(
                  //     //       //                       'Last fed (4h ago)',
                  //     //       //                       textAlign: TextAlign.start,
                  //     //       //                       style: FlutterFlowTheme.of(context)
                  //     //       //                           .bodyMedium
                  //     //       //                           .override(
                  //     //       //                             fontFamily: 'Manrope',
                  //     //       //                             fontSize: 10.0,
                  //     //       //                             letterSpacing: 0.0,
                  //     //       //                             fontWeight: FontWeight.w800,
                  //     //       //                           ),
                  //     //       //                     ),
                  //     //       //                   ),
                  //     //       //                 ),
                  //     //       //                 FFButtonWidget(
                  //     //       //                   onPressed: () {
                  //     //       //                     print('CheckFood pressed ...');
                  //     //       //                   },
                  //     //       //                   text: 'Log Food',
                  //     //       //                   options: FFButtonOptions(
                  //     //       //                     height: 40.0,
                  //     //       //                     padding:
                  //     //       //                         EdgeInsetsDirectional.fromSTEB(
                  //     //       //                             16.0, 0.0, 16.0, 0.0),
                  //     //       //                     iconPadding:
                  //     //       //                         EdgeInsetsDirectional.fromSTEB(
                  //     //       //                             0.0, 0.0, 0.0, 0.0),
                  //     //       //                     color: FlutterFlowTheme.of(context)
                  //     //       //                         .primary,
                  //     //       //                     textStyle:
                  //     //       //                         FlutterFlowTheme.of(context)
                  //     //       //                             .titleSmall
                  //     //       //                             .override(
                  //     //       //                               fontFamily: 'Manrope',
                  //     //       //                               color: Colors.white,
                  //     //       //                               letterSpacing: 0.0,
                  //     //       //                             ),
                  //     //       //                     elevation: 0.0,
                  //     //       //                     borderRadius:
                  //     //       //                         BorderRadius.circular(8.0),
                  //     //       //                   ),
                  //     //       //                 ),
                  //     //       //               ],
                  //     //       //             ),
                  //     //       //           ),
                  //     //       //           Padding(
                  //     //       //             padding: EdgeInsetsDirectional.fromSTEB(
                  //     //       //                 0.0, 0.0, 0.0, 8.0),
                  //     //       //             child: Row(
                  //     //       //               mainAxisSize: MainAxisSize.max,
                  //     //       //               mainAxisAlignment: MainAxisAlignment.start,
                  //     //       //               children: [
                  //     //       //                 Padding(
                  //     //       //                   padding: EdgeInsetsDirectional.fromSTEB(
                  //     //       //                       0.0, 8.0, 16.0, 8.0),
                  //     //       //                   child: FaIcon(
                  //     //       //                     FontAwesomeIcons.solidSmileBeam,
                  //     //       //                     color: Color(0xFF6D6FFF),
                  //     //       //                     size: 24.0,
                  //     //       //                   ),
                  //     //       //                 ),
                  //     //       //                 Flexible(
                  //     //       //                   child: Padding(
                  //     //       //                     padding:
                  //     //       //                         EdgeInsetsDirectional.fromSTEB(
                  //     //       //                             0.0, 0.0, 12.0, 0.0),
                  //     //       //                     child: Text(
                  //     //       //                       'Mood',
                  //     //       //                       textAlign: TextAlign.start,
                  //     //       //                       style: FlutterFlowTheme.of(context)
                  //     //       //                           .bodyMedium
                  //     //       //                           .override(
                  //     //       //                             fontFamily: 'Manrope',
                  //     //       //                             letterSpacing: 0.0,
                  //     //       //                           ),
                  //     //       //                     ),
                  //     //       //                   ),
                  //     //       //                 ),
                  //     //       //                 Flexible(
                  //     //       //                   child: Padding(
                  //     //       //                     padding:
                  //     //       //                         EdgeInsetsDirectional.fromSTEB(
                  //     //       //                             0.0, 0.0, 12.0, 0.0),
                  //     //       //                     child: Text(
                  //     //       //                       'Felt sad (2d ago)',
                  //     //       //                       textAlign: TextAlign.start,
                  //     //       //                       style: FlutterFlowTheme.of(context)
                  //     //       //                           .bodyMedium
                  //     //       //                           .override(
                  //     //       //                             fontFamily: 'Manrope',
                  //     //       //                             fontSize: 10.0,
                  //     //       //                             letterSpacing: 0.0,
                  //     //       //                             fontWeight: FontWeight.w800,
                  //     //       //                           ),
                  //     //       //                     ),
                  //     //       //                   ),
                  //     //       //                 ),
                  //     //       //                 FFButtonWidget(
                  //     //       //                   onPressed: () {
                  //     //       //                     print('CheckFood pressed ...');
                  //     //       //                   },
                  //     //       //                   text: 'Log Mood',
                  //     //       //                   options: FFButtonOptions(
                  //     //       //                     height: 40.0,
                  //     //       //                     padding:
                  //     //       //                         EdgeInsetsDirectional.fromSTEB(
                  //     //       //                             16.0, 0.0, 16.0, 0.0),
                  //     //       //                     iconPadding:
                  //     //       //                         EdgeInsetsDirectional.fromSTEB(
                  //     //       //                             0.0, 0.0, 0.0, 0.0),
                  //     //       //                     color: FlutterFlowTheme.of(context)
                  //     //       //                         .primary,
                  //     //       //                     textStyle:
                  //     //       //                         FlutterFlowTheme.of(context)
                  //     //       //                             .titleSmall
                  //     //       //                             .override(
                  //     //       //                               fontFamily: 'Manrope',
                  //     //       //                               color: Colors.white,
                  //     //       //                               letterSpacing: 0.0,
                  //     //       //                             ),
                  //     //       //                     elevation: 0.0,
                  //     //       //                     borderRadius:
                  //     //       //                         BorderRadius.circular(8.0),
                  //     //       //                   ),
                  //     //       //                 ),
                  //     //       //               ],
                  //     //       //             ),
                  //     //       //           ),
                  //     //       //           Padding(
                  //     //       //             padding: EdgeInsetsDirectional.fromSTEB(
                  //     //       //                 0.0, 0.0, 0.0, 8.0),
                  //     //       //             child: Row(
                  //     //       //               mainAxisSize: MainAxisSize.max,
                  //     //       //               mainAxisAlignment: MainAxisAlignment.center,
                  //     //       //               children: [
                  //     //       //                 Padding(
                  //     //       //                   padding: EdgeInsetsDirectional.fromSTEB(
                  //     //       //                       5.0, 5.0, 5.0, 5.0),
                  //     //       //                   child: FFButtonWidget(
                  //     //       //                     onPressed: () {
                  //     //       //                       print('Button pressed ...');
                  //     //       //                     },
                  //     //       //                     text: 'Check Activity',
                  //     //       //                     options: FFButtonOptions(
                  //     //       //                       height: 60.0,
                  //     //       //                       padding:
                  //     //       //                           EdgeInsetsDirectional.fromSTEB(
                  //     //       //                               16.0, 0.0, 16.0, 0.0),
                  //     //       //                       iconPadding:
                  //     //       //                           EdgeInsetsDirectional.fromSTEB(
                  //     //       //                               0.0, 0.0, 0.0, 0.0),
                  //     //       //                       color: FlutterFlowTheme.of(context)
                  //     //       //                           .tertiary,
                  //     //       //                       textStyle:
                  //     //       //                           FlutterFlowTheme.of(context)
                  //     //       //                               .titleSmall
                  //     //       //                               .override(
                  //     //       //                                 fontFamily: 'Manrope',
                  //     //       //                                 color: Colors.white,
                  //     //       //                                 fontSize: 8.0,
                  //     //       //                                 letterSpacing: 0.0,
                  //     //       //                               ),
                  //     //       //                       elevation: 0.0,
                  //     //       //                       borderRadius:
                  //     //       //                           BorderRadius.circular(8.0),
                  //     //       //                     ),
                  //     //       //                   ),
                  //     //       //                 ),
                  //     //       //                 Padding(
                  //     //       //                   padding: EdgeInsetsDirectional.fromSTEB(
                  //     //       //                       5.0, 5.0, 5.0, 5.0),
                  //     //       //                   child: FFButtonWidget(
                  //     //       //                     onPressed: () {
                  //     //       //                       print('Button pressed ...');
                  //     //       //                     },
                  //     //       //                     text: 'Check Food',
                  //     //       //                     options: FFButtonOptions(
                  //     //       //                       height: 60.0,
                  //     //       //                       padding:
                  //     //       //                           EdgeInsetsDirectional.fromSTEB(
                  //     //       //                               16.0, 0.0, 16.0, 0.0),
                  //     //       //                       iconPadding:
                  //     //       //                           EdgeInsetsDirectional.fromSTEB(
                  //     //       //                               0.0, 0.0, 0.0, 0.0),
                  //     //       //                       color: FlutterFlowTheme.of(context)
                  //     //       //                           .primary,
                  //     //       //                       textStyle:
                  //     //       //                           FlutterFlowTheme.of(context)
                  //     //       //                               .titleSmall
                  //     //       //                               .override(
                  //     //       //                                 fontFamily: 'Manrope',
                  //     //       //                                 color: Colors.white,
                  //     //       //                                 fontSize: 8.0,
                  //     //       //                                 letterSpacing: 0.0,
                  //     //       //                               ),
                  //     //       //                       elevation: 0.0,
                  //     //       //                       borderRadius:
                  //     //       //                           BorderRadius.circular(8.0),
                  //     //       //                     ),
                  //     //       //                   ),
                  //     //       //                 ),
                  //     //       //                 Padding(
                  //     //       //                   padding: EdgeInsetsDirectional.fromSTEB(
                  //     //       //                       5.0, 5.0, 5.0, 5.0),
                  //     //       //                   child: FFButtonWidget(
                  //     //       //                     onPressed: () {
                  //     //       //                       print('Button pressed ...');
                  //     //       //                     },
                  //     //       //                     text: 'Check Mood',
                  //     //       //                     options: FFButtonOptions(
                  //     //       //                       height: 60.0,
                  //     //       //                       padding:
                  //     //       //                           EdgeInsetsDirectional.fromSTEB(
                  //     //       //                               16.0, 0.0, 16.0, 0.0),
                  //     //       //                       iconPadding:
                  //     //       //                           EdgeInsetsDirectional.fromSTEB(
                  //     //       //                               0.0, 0.0, 0.0, 0.0),
                  //     //       //                       color: FlutterFlowTheme.of(context)
                  //     //       //                           .info,
                  //     //       //                       textStyle:
                  //     //       //                           FlutterFlowTheme.of(context)
                  //     //       //                               .titleSmall
                  //     //       //                               .override(
                  //     //       //                                 fontFamily: 'Manrope',
                  //     //       //                                 color: Colors.white,
                  //     //       //                                 fontSize: 8.0,
                  //     //       //                                 letterSpacing: 0.0,
                  //     //       //                               ),
                  //     //       //                       elevation: 0.0,
                  //     //       //                       borderRadius:
                  //     //       //                           BorderRadius.circular(8.0),
                  //     //       //                     ),
                  //     //       //                   ),
                  //     //       //                 ),
                  //     //       //               ],
                  //     //       //             ),
                  //     //       //           ),
                  //     //       //         ],
                  //     //       //       ),
                  //     //       //     ),
                  //     //       //   ],
                  //     //       // ),
                  //     //     ),
                  //     //   ),
                  //     // ),
                ]),
          ),
        ),
      ),
    );
  }
}
