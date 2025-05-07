import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pet_transact_model.dart';
export 'pet_transact_model.dart';

import 'package:paw_r_app/models/pet.dart';

import '/flutter_flow/flutter_flow_animations.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

class PetTransactWidget extends StatefulWidget {
  final Pet pet;

  const PetTransactWidget({Key? key, required this.pet}) : super(key: key);

  static String routeName = 'PetTransact';
  static String routePath = '/petTransact';

  @override
  State<PetTransactWidget> createState() => _PetTransactWidgetState();
}

class _PetTransactWidgetState extends State<PetTransactWidget> {
  late PetTransactModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PetTransactModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    _model.noteFieldTextController ??= TextEditingController();
    _model.noteFieldFocusNode ??= FocusNode();

    _model.dateTimeController = TextEditingController();

    _model.initialDateA = DateTime.now();
    _model.initialDateB = DateTime.now();

    _model.initialTimeA = TimeOfDay.now();
    _model.initialTimeB = TimeOfDay.now();

    _model.checkBoxCollect = [];

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

  Future<void> _selectDateTime(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _model.initialDateA,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _model.initialTimeA,
    );

    if (pickedDate != null && pickedTime != null) {
      final combinedDateTime = DateTime(
        pickedDate.year,
        pickedDate.month,
        pickedDate.day,
        pickedTime.hour,
        pickedTime.minute,
      );

      setState(() {
        _model.initialDate = combinedDateTime;
        _model.initialDateTimeText = DateFormat('hh:mm:ss a / dd MMM yyyy')
            .format(_model.initialDate ?? combinedDateTime);
        _calculateDifference();
      });
    }

    _model.initialDateA = pickedDate!;
    _model.initialTimeA = pickedTime!;
  }

  Future<void> _selectDateTimeB(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _model.initialDateB,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _model.initialTimeB,
    );

    if (pickedDate != null && pickedTime != null) {
      final combinedDateTime = DateTime(
        pickedDate.year,
        pickedDate.month,
        pickedDate.day,
        pickedTime.hour,
        pickedTime.minute,
      );

      setState(() {
        _model.finalDate = combinedDateTime;
        _model.finalDateTimeText = DateFormat('hh:mm:ss a / dd MMM yyyy')
            .format(_model.finalDate ?? combinedDateTime);
        _calculateDifference();
      });
    }

    _model.initialDateB = pickedDate!;
    _model.initialTimeB = pickedTime!;
  }

  Future<void> _calculateDifference() async {
    final startDate = _model.initialDate;
    final endDate = _model.finalDate ?? DateTime.now();

    if (startDate == null) return;

    final duration = endDate.difference(startDate);
    final minutes = duration.inMinutes;
    final hours = duration.inHours;
    final remainder = minutes.remainder(60);

    setState(() {
      _model.difference = duration;

      // if difference is close to 60 minutes then display

      if (minutes > 59) {
        _model.differenceText = '$hours H : $remainder m';
        _model.isHourlySelected = true;
        _model.isOneTimeSelected = false;
        _model.lockHourly = false;
      } else {
        _model.differenceText = '0 H : 0 m';
        _model.lockHourly = true;
        _model.isOneTimeSelected = false;
        _model.isHourlySelected = false;
      }

      _verifyDateTimeValidity();
      _calculateHourly(hours);
    });
  }

  Future<void> _calculateHourly(int duration) async {
    setState(() {
      if (duration > 0) {
        _model.hourlyRateTotal = _model.hourlyRate * duration.toDouble();
      } else {
        _model.hourlyRateTotal = 120.00;
      }
    });
  }

  Future<void> _verifyEmptyTasks() async {
    setState(() {
      // _model.checkBoxCollect = [
      //   _model.checkboxValue1,
      //   _model.checkboxValue2,
      //   _model.checkboxValue3,
      //   _model.checkboxValue4,
      //   _model.checkboxValue5,
      //   _model.checkboxValue6,
      //   _model.checkboxValue7,
      //   _model.checkboxValue8,
      //   _model.checkboxValue9,
      //   _model.checkboxValue10,
      //   _model.checkboxValue11,
      // ];

      // if (_model.checkBoxCollect.any((value) => value == true) == false) {
      //   _model.hasEmptyAssignTasks = true;
      // } else {
      //   _model.hasEmptyAssignTasks = false;
      // }

      if (_model.noteFieldTextController.text.isEmpty) {
        _model.hasEmptyAssignTasks = true;
      } else {
        _model.hasEmptyAssignTasks = false;
      }



    });
  }

  Future<void> _verifyDateTimeValidity() async {
    setState(() {
      if (_model.initialDateTimeText == null ||
          _model.finalDateTimeText == null ||
          _model.differenceText == '0 H : 0 m') {
        _model.isDateTimeInvalid = true;
      } else {
        _model.isDateTimeInvalid = false;
      }
    });
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
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderRadius: 20.0,
            buttonSize: 40.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24.0,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Pet Sit',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Manrope',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 24.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5.0,
                            color: Color(0x10000000),
                            offset: Offset(
                              0.0,
                              2.0,
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: 80.0,
                              height: 80.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: Image.asset(
                                    'assets/images/Urie.jpg',
                                  ).image,
                                ),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 2.0,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.pet.name,
                                    style: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .override(
                                          fontFamily: 'Manrope',
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  Text(
                                    '${widget.pet.breed}• ${widget.pet.age} Years',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Manrope',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  // Padding(
                                  //   padding: EdgeInsetsDirectional.fromSTEB(
                                  //       0.0, 8.0, 0.0, 0.0),
                                  //   child: Row(
                                  //     mainAxisSize: MainAxisSize.max,
                                  //     children: [
                                  //       Container(
                                  //         width: 70.0,
                                  //         decoration: BoxDecoration(
                                  //           color: Color(0x15000000),
                                  //           borderRadius:
                                  //               BorderRadius.circular(20.0),
                                  //         ),
                                  //         child: Padding(
                                  //           padding:
                                  //               EdgeInsetsDirectional.fromSTEB(
                                  //                   8.0, 4.0, 8.0, 4.0),
                                  //           child: Row(
                                  //             mainAxisSize: MainAxisSize.max,
                                  //             mainAxisAlignment:
                                  //                 MainAxisAlignment.center,
                                  //             children: [
                                  //               Icon(
                                  //                 Icons.favorite,
                                  //                 color: FlutterFlowTheme.of(
                                  //                         context)
                                  //                     .primary,
                                  //                 size: 16.0,
                                  //               ),
                                  //               Text(
                                  //                 'Friendly',
                                  //                 style: FlutterFlowTheme.of(
                                  //                         context)
                                  //                     .bodySmall
                                  //                     .override(
                                  //                       fontFamily: 'Manrope',
                                  //                       letterSpacing: 0.0,
                                  //                       fontWeight:
                                  //                           FontWeight.w500,
                                  //                     ),
                                  //               ),
                                  //             ].divide(SizedBox(width: 4.0)),
                                  //           ),
                                  //         ),
                                  //       ),
                                  //       Container(
                                  //         width: 80.0,
                                  //         decoration: BoxDecoration(
                                  //           color: Color(0x15000000),
                                  //           borderRadius:
                                  //               BorderRadius.circular(20.0),
                                  //         ),
                                  //         child: Padding(
                                  //           padding:
                                  //               EdgeInsetsDirectional.fromSTEB(
                                  //                   8.0, 4.0, 8.0, 4.0),
                                  //           child: Row(
                                  //             mainAxisSize: MainAxisSize.max,
                                  //             mainAxisAlignment:
                                  //                 MainAxisAlignment.center,
                                  //             children: [
                                  //               Icon(
                                  //                 Icons.pets,
                                  //                 color: FlutterFlowTheme.of(
                                  //                         context)
                                  //                     .primary,
                                  //                 size: 16.0,
                                  //               ),
                                  //               Text(
                                  //                 'Playful',
                                  //                 style: FlutterFlowTheme.of(
                                  //                         context)
                                  //                     .bodySmall
                                  //                     .override(
                                  //                       fontFamily: 'Manrope',
                                  //                       letterSpacing: 0.0,
                                  //                       fontWeight:
                                  //                           FontWeight.w500,
                                  //                     ),
                                  //               ),
                                  //             ].divide(SizedBox(width: 4.0)),
                                  //           ),
                                  //         ),
                                  //       ),
                                  //     ].divide(SizedBox(width: 8.0)),
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          ].divide(SizedBox(width: 16.0)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 12.0),
                    child: Text(
                      'Select Date',
                      style: FlutterFlowTheme.of(context).titleMedium.override(
                            fontFamily: 'Manrope',
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5.0,
                            color: Color(0x10000000),
                            offset: Offset(
                              0.0,
                              2.0,
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Start Date & Time',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Manrope',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                        onTap: () async {
                                          await _selectDateTime(context);
                                        },
                                        child: Container(        
                                          width: MediaQuery.sizeOf(context).width * 0.6,
                                          decoration: BoxDecoration(
                                            color: Color(0x10000000),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(12.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Icon(
                                                  Icons.calendar_today,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 20.0,
                                                ),
                                                Text(
                                                  _model?.initialDateTimeText ??
                                                      'Select Date',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ].divide(SizedBox(width: 8.0)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'End Date & Time',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Manrope',
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                        onTap: () async {
                                          await _selectDateTimeB(context);
                                        },
                                        child: Container(
                                          width: MediaQuery.sizeOf(context).width * 0.6,
                                          decoration: BoxDecoration(
                                            color: Color(0x10000000),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(12.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Icon(
                                                  Icons.calendar_today,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 20.0,
                                                ),
                                                Text(
                                                  _model?.finalDateTimeText ??
                                                      'Select Date',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ].divide(SizedBox(width: 8.0)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              width: double.infinity,
                              height: 1.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).alternate,
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total Duration:',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Manrope',
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                Text(
                                  _model!.differenceText ?? '0 hours',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Manrope',
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ],
                            ),
                            if (_model.isDateTimeInvalid)
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    (_model.isDateTimeInvalid)
                                        ? 'Choose a valid Date and Time'
                                        : '',
                                    style: (_model.isDateTimeInvalid)
                                        ? const TextStyle(
                                            fontSize: 12,
                                            color: Colors.red,
                                          )
                                        : null,
                                  ),
                                ],
                              ),
                          ].divide(SizedBox(height: 16.0)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5.0,
                            color: Color(0x10000000),
                            offset: Offset(
                              0.0,
                              2.0,
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (_model.lockHourly == true) {
                                            return;
                                          }

                                          _model.isHourlySelected =
                                              !_model.isHourlySelected;

                                          if (_model.isOneTimeSelected ==
                                              true) {
                                            _model.isOneTimeSelected = false;
                                          }
                                        });
                                      },
                                      child: Container(
                                        width: 24.0,
                                        height: 24.0,
                                        decoration: BoxDecoration(
                                          color: _model.isHourlySelected
                                              ? FlutterFlowTheme.of(context)
                                                  .primary
                                              : FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 2.0,
                                          ),
                                        ),
                                        child: _model.isHourlySelected
                                            ? Icon(
                                                Icons.check,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                size: 16.0,
                                              )
                                            : null,
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Hourly Rate',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Manrope',
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    (_model.isHourlySelected)
                                                        ? FontWeight.w800
                                                        : FontWeight.w600,
                                              ),
                                        ),
                                        Text(
                                          '₱${_model.hourlyRate} per hour',
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall
                                              .override(
                                                fontFamily: 'Manrope',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ].divide(SizedBox(width: 12.0)),
                                ),
                                Text(
                                  '₱${_model.hourlyRateTotal}',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Manrope',
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        color: (_model.isHourlySelected)
                                            ? null
                                            : FlutterFlowTheme.of(context)
                                                .secondaryText,
                                      ),
                                ),
                              ],
                            ),


                            Container(
                              width: double.infinity,
                              height: 1.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).alternate,
                              ),
                            ),


                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (_model.lockHourly == true) return;

                                          _model.isOneTimeSelected =
                                              !_model.isOneTimeSelected;

                                          if (_model.isHourlySelected == true) {
                                            _model.isHourlySelected = false;
                                          }
                                        });
                                      },
                                      child: Container(
                                        width: 24.0,
                                        height: 24.0,
                                        decoration: BoxDecoration(
                                          color: _model.isOneTimeSelected
                                              ? FlutterFlowTheme.of(context)
                                                  .primary
                                              : FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 2.0,
                                          ),
                                        ),
                                        child: _model.isOneTimeSelected
                                            ? Icon(
                                                Icons.check,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                size: 16.0,
                                              )
                                            : null,
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Fixed Rate',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Manrope',
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    (_model.isOneTimeSelected)
                                                        ? FontWeight.w800
                                                        : FontWeight.w500,
                                              ),
                                        ),
                                        Text(
                                          'One-time payment',
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall
                                              .override(
                                                fontFamily: 'Manrope',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ].divide(SizedBox(width: 12.0)),
                                ),
                                Text(
                                  '₱800.00',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Manrope',
                                        color: (_model.isOneTimeSelected)
                                            ? null
                                            : FlutterFlowTheme.of(context)
                                                .secondaryText,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ],
                            ),
                          ].divide(SizedBox(height: 16.0)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 12.0),
                    child: Text(
                      'Assign Tasks',
                      style: FlutterFlowTheme.of(context).titleMedium.override(
                            fontFamily: 'Manrope',
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),


                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          16.0, 16.0, 16.0, 16.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5.0,
                              color: Color(0x10000000),
                              offset: Offset(0.0, 2.0),
                            )
                          ],
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Column(
                            // Changed from Row to Column for vertical layout
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 12.0),
                              TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Add tasks',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  fillColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  filled: true,
                                ),
                                onChanged: (value) {

                                  setState(() {
                                     _model.noteFieldTextController.text = value; // Save to model if needed
                                  });
                                 
                                },
                                maxLines: 8,
                              ),


                            if (_model.hasEmptyAssignTasks)
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    (_model.hasEmptyAssignTasks)
                                        ? 'Choose a Task.'
                                        : 'empty',
                                    style: (_model.hasEmptyAssignTasks)
                                        ? const TextStyle(
                                            fontSize: 12,
                                            color: Colors.red,
                                          )
                                        : null,
                                  ),
                                ],
                              ),
                            ],


                          ),
                        ),
                      ),
                    ),
                  ),
                  
                  
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 12.0),
                    child: Text(
                      'Special Instructions',
                      style: FlutterFlowTheme.of(context).titleMedium.override(
                            fontFamily: 'Manrope',
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          16.0, 16.0, 16.0, 16.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5.0,
                              color: Color(0x10000000),
                              offset: Offset(0.0, 2.0),
                            )
                          ],
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Column(
                            // Changed from Row to Column for vertical layout
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 12.0),
                              TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Add special instructions (optional)',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  fillColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  filled: true,
                                ),
                                onChanged: (value) {
                                  _model.textController.text =
                                      value; // Save to model if needed
                                },
                                maxLines: 2,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          16.0, 16.0, 16.0, 16.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5.0,
                              color: Color(0x10000000),
                              offset: Offset(
                                0.0,
                                2.0,
                              ),
                            )
                          ],
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Total Amount',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Manrope',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Text(
                                    (_model.isHourlySelected) ?  '₱ ${_model.hourlyRateTotal}' : '₱ ${_model.oneTimeValue}',
                                    style: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .override(
                                          fontFamily: 'Manrope',
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ],
                              ),
                              FFButtonWidget(
                                onPressed: () async {

                                  print(_model.textController.text.trim());
                                  print(_model.noteFieldTextController.text.trim());

                                  await _verifyDateTimeValidity();
                                  await _verifyEmptyTasks();
                                  await _model.sendRequest(context, widget.pet);
                                },
                                text: 'Send Request',
                                options: FFButtonOptions(
                                  height: 50.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Manrope',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        letterSpacing: 0.0,
                                      ),
                                  elevation: 2.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ).animateOnPageLoad(animationsMap['foodCardOnPageLoadAnimation0']!),
      ),
    );
  }
}
