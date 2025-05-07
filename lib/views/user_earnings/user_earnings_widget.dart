import 'package:paw_r_app/components/transaction_card_model.dart';
import 'package:paw_r_app/components/transaction_card_widget.dart';

import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'user_earnings_model.dart';
export 'user_earnings_model.dart';

import 'package:paw_r_app/models/pet.dart';
import 'package:paw_r_app/models/request.dart';
import 'package:paw_r_app/models/user.dart';

import 'package:paw_r_app/view_models/request_view_model.dart';


import '/flutter_flow/flutter_flow_animations.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

class UserEarningsWidget extends StatefulWidget {
  final String userId;
  const UserEarningsWidget({Key? key, required this.userId}) : super(key: key);

  static String routeName = 'PetTransact';
  static String routePath = '/petTransact';

  @override
  State<UserEarningsWidget> createState() =>
      _UserEarningsWidgetState();
}

class _UserEarningsWidgetState extends State<UserEarningsWidget> {
  late UserEarningsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  final supabase = Supabase.instance.client;

  late bool isOwner;

  int selectedIndex = 0; // Default to first button

  final List<String> options = ['Day', 'Week', 'Month', 'Year'];
  
  List<TransactionCardModel> _transactionCardModels = [];


  late String totalEarnings;
  late String monthEarnings;
  late String weekEarnings;
  late String dayEarnings;

  late String totalCosts;
  late String monthCosts;
  late String weekCosts;
  late String dayCosts;

  late String showEarnings;

  late String showCosts;


  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserEarningsModel());

    fetchUserDetails();

    showEarnings = '0';
    showCosts = '0';


    final requestVM = Provider.of<RequestViewModel>(context, listen: false);
    requestVM.fetchRequests('pending');

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
            duration: 100.0.ms, // Faster movement
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

        for (var model in _transactionCardModels) {
      model.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return (_model.isLoading == true) ? onLoading(context) : 
    GestureDetector(
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
            'Cash Report',
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
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 12.0),
                    child: Text(
                      'Amount',
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
                                    'Total Earnings',
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
                                    '₱ ${showEarnings}',
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
                                    'Total Costs',
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
                                    '₱ ${showCosts}',
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
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(options.length, (index) {
                          final isSelected = index == selectedIndex;
                          return ElevatedButton(
                            onPressed: () {
                              setState(() {
                                selectedIndex = index;

                                switch(selectedIndex) {
                                  case 0:
                                    showEarnings = dayEarnings;
                                    showCosts = dayCosts;
                                    break;
                                  case 1:
                                    showEarnings = weekEarnings;
                                    showCosts = weekCosts;
                                    break;
                                  case 2:
                                    showEarnings = monthEarnings;
                                    showCosts = monthCosts;
                                    break;
                                  default:
                                    showEarnings = totalEarnings;
                                    showCosts = totalCosts;
                                    break;
                                } 

                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: isSelected
                                  ? FlutterFlowTheme.of(context).persianGreen
                                  : FlutterFlowTheme.of(context)
                                      .primaryBackground,
                              foregroundColor:
                                  isSelected ? Colors.white : Colors.black,
                            ),
                            child: Text(options[index]),
                          );
                        }),
                      ),
                    ),
                  ),

                  // Padding(
                  //   padding: EdgeInsets.all(16.0),
                  //   child: Container(
                  //     width: double.infinity,
                  //     decoration: BoxDecoration(
                  //       color: FlutterFlowTheme.of(context).secondaryBackground,
                  //       boxShadow: [
                  //         BoxShadow(
                  //           blurRadius: 5.0,
                  //           color: Color(0x10000000),
                  //           offset: Offset(
                  //             0.0,
                  //             2.0,
                  //           ),
                  //         )
                  //       ],
                  //       borderRadius: BorderRadius.circular(16.0),
                  //     ),
                  //     child: Padding(
                  //       padding: EdgeInsets.all(16.0),
                  //       child: Column(
                  //         mainAxisSize: MainAxisSize.max,
                  //         children: [
                            
                  //           Row(
                  //             mainAxisSize: MainAxisSize.max,
                  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //             children: [
                  //               Row(
                  //                 mainAxisSize: MainAxisSize.max,
                  //                 children: [
                  //                   Column(
                  //                     mainAxisSize: MainAxisSize.max,
                  //                     crossAxisAlignment:
                  //                         CrossAxisAlignment.start,
                  //                     children: [
                  //                       Text(
                  //                         'Total Earnings for this year',
                  //                         style: FlutterFlowTheme.of(context)
                  //                             .bodyMedium
                  //                             .override(
                  //                               fontFamily: 'Manrope',
                  //                               letterSpacing: 0.0,
                  //                               fontWeight: FontWeight.w800,
                  //                               color: FlutterFlowTheme.of(context).primary,
                  //                             ),
                  //                       ),
                  //                     ],
                  //                   ),
                  //                 ].divide(SizedBox(width: 12.0)),
                  //               ),
                  //               Text(
                  //                 totalEarnings,
                  //                 style: FlutterFlowTheme.of(context)
                  //                     .bodyMedium
                  //                     .override(
                  //                       fontFamily: 'Manrope',
                  //                       letterSpacing: 0.0,
                  //                       fontWeight: FontWeight.w600,
                  //                       color: FlutterFlowTheme.of(context)
                  //                               .secondaryText,
                  //                     ),
                  //               ),
                  //             ],
                  //           ),



                  //           Container(
                  //             width: double.infinity,
                  //             height: 1.0,
                  //             decoration: BoxDecoration(
                  //               color: FlutterFlowTheme.of(context).alternate,
                  //             ),
                  //           ),



                  //           Row(
                  //             mainAxisSize: MainAxisSize.max,
                  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //             children: [
                  //               Row(
                  //                 mainAxisSize: MainAxisSize.max,
                  //                 children: [
                  //                   Column(
                  //                     mainAxisSize: MainAxisSize.max,
                  //                     crossAxisAlignment:
                  //                         CrossAxisAlignment.start,
                  //                     children: [
                  //                       Text(
                  //                         'Total Earnings for this month',
                  //                         style: FlutterFlowTheme.of(context)
                  //                             .bodyMedium
                  //                             .override(
                  //                               fontFamily: 'Manrope',
                  //                               letterSpacing: 0.0,
                  //                               fontWeight:FontWeight.w800,
                  //                               color: FlutterFlowTheme.of(context).primary,
                  //                             ),
                  //                       ),
                  //                       // Text(
                  //                       //   'One-time payment',
                  //                       //   style: FlutterFlowTheme.of(context)
                  //                       //       .bodySmall
                  //                       //       .override(
                  //                       //         fontFamily: 'Manrope',
                  //                       //         letterSpacing: 0.0,
                  //                       //       ),
                  //                       // ),
                  //                     ],
                  //                   ),
                  //                 ].divide(SizedBox(width: 12.0)),
                  //               ),
                  //               Text(
                  //                 '₱800.00',
                  //                 style: FlutterFlowTheme.of(context)
                  //                     .bodyMedium
                  //                     .override(
                  //                       fontFamily: 'Manrope',
                  //                       color: (!_model.isOneTimeSelected)
                  //                           ? null
                  //                           : FlutterFlowTheme.of(context)
                  //                               .secondaryText,
                  //                       letterSpacing: 0.0,
                  //                     ),
                  //               ),
                  //             ],
                  //           ),


                  

                  //         ].divide(SizedBox(height: 16.0)),
                  //       ),
                  //     ),
                  //   ),
                  // ),



                  // Padding(
                  //   padding: EdgeInsets.all(16.0),
                  //   child: Container(
                  //     width: double.infinity,
                  //     decoration: BoxDecoration(
                  //       color: FlutterFlowTheme.of(context).secondaryBackground,
                  //       boxShadow: [
                  //         BoxShadow(
                  //           blurRadius: 5.0,
                  //           color: Color(0x10000000),
                  //           offset: Offset(
                  //             0.0,
                  //             2.0,
                  //           ),
                  //         )
                  //       ],
                  //       borderRadius: BorderRadius.circular(16.0),
                  //     ),
                  //     child: Padding(
                  //       padding: EdgeInsets.all(16.0),
                  //       child: Column(
                  //         mainAxisSize: MainAxisSize.max,
                  //         children: [
                    

                  //         Row(
                  //             mainAxisSize: MainAxisSize.max,
                  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //             children: [
                  //               Row(
                  //                 mainAxisSize: MainAxisSize.max,
                  //                 children: [
                  //                   Column(
                  //                     mainAxisSize: MainAxisSize.max,
                  //                     crossAxisAlignment:
                  //                         CrossAxisAlignment.start,
                  //                     children: [
                  //                       Text(
                  //                         'Total Defecit for this year',
                  //                         style: FlutterFlowTheme.of(context)
                  //                             .bodyMedium
                  //                             .override(
                  //                               fontFamily: 'Manrope',
                  //                               letterSpacing: 0.0,
                  //                               fontWeight:FontWeight.w800,
                  //                               color: FlutterFlowTheme.of(context).primary,
                  //                             ),
                  //                       ),
                  //                       // Text(
                  //                       //   'One-time payment',
                  //                       //   style: FlutterFlowTheme.of(context)
                  //                       //       .bodySmall
                  //                       //       .override(
                  //                       //         fontFamily: 'Manrope',
                  //                       //         letterSpacing: 0.0,
                  //                       //       ),
                  //                       // ),
                  //                     ],
                  //                   ),
                  //                 ].divide(SizedBox(width: 12.0)),
                  //               ),
                  //               Text(
                  //                 totalCosts,
                  //                 style: FlutterFlowTheme.of(context)
                  //                     .bodyMedium
                  //                     .override(
                  //                       fontFamily: 'Manrope',
                  //                       color: (!_model.isOneTimeSelected)
                  //                           ? null
                  //                           : FlutterFlowTheme.of(context)
                  //                               .secondaryText,
                  //                       letterSpacing: 0.0,
                  //                     ),
                  //               ),
                  //             ],
                  //           ),


                  //                                       Container(
                  //             width: double.infinity,
                  //             height: 1.0,
                  //             decoration: BoxDecoration(
                  //               color: FlutterFlowTheme.of(context).alternate,
                  //             ),
                  //           ),




                  //           Row(
                  //             mainAxisSize: MainAxisSize.max,
                  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //             children: [
                  //               Row(
                  //                 mainAxisSize: MainAxisSize.max,
                  //                 children: [
                  //                   Column(
                  //                     mainAxisSize: MainAxisSize.max,
                  //                     crossAxisAlignment:
                  //                         CrossAxisAlignment.start,
                  //                     children: [
                  //                       Text(
                  //                         'Total Defecit for this month',
                  //                         style: FlutterFlowTheme.of(context)
                  //                             .bodyMedium
                  //                             .override(
                  //                               fontFamily: 'Manrope',
                  //                               letterSpacing: 0.0,
                  //                               fontWeight:FontWeight.w800,
                  //                               color: FlutterFlowTheme.of(context).primary,
                  //                             ),
                  //                       ),
                  //                       // Text(
                  //                       //   'One-time payment',
                  //                       //   style: FlutterFlowTheme.of(context)
                  //                       //       .bodySmall
                  //                       //       .override(
                  //                       //         fontFamily: 'Manrope',
                  //                       //         letterSpacing: 0.0,
                  //                       //       ),
                  //                       // ),
                  //                     ],
                  //                   ),
                  //                 ].divide(SizedBox(width: 12.0)),
                  //               ),
                  //               Text(
                  //                 '₱800.00',
                  //                 style: FlutterFlowTheme.of(context)
                  //                     .bodyMedium
                  //                     .override(
                  //                       fontFamily: 'Manrope',
                  //                       color: (!_model.isOneTimeSelected)
                  //                           ? null
                  //                           : FlutterFlowTheme.of(context)
                  //                               .secondaryText,
                  //                       letterSpacing: 0.0,
                  //                     ),
                  //               ),
                  //             ],
                  //           ),



                  //         ].divide(SizedBox(height: 16.0)),
                  //       ),
                  //     ),
                  //   ),
                  // ),


                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    cardCreator(context),
                  ],
                ),






                ],
              ).animateOnPageLoad(animationsMap['foodCardOnPageLoadAnimation0']!),
            ),
          ),
        ),
      ),
    );
  }




    Widget cardCreator(BuildContext context) {
    return Consumer<RequestViewModel>(builder: (context, requestVM, child) {
      if (requestVM.isLoading) {
        return const Center(
          heightFactor: 10.0,
          child: LinearProgressIndicator(),
        );
      }

      /// Dynamically create models only when snackLogs load or change
      if (_transactionCardModels.length != requestVM.requests.length) {
        // Dispose old models
        for (var model in _transactionCardModels) {
          model.dispose();
        }
        // Create new models
        _transactionCardModels = requestVM.requests
            .map((_) => createModel<TransactionCardModel>(
                context, () => TransactionCardModel()))
            .toList();
      }

      return requestVM.requests.isEmpty
          ? Center(
              child: Text(
                'No transactions made',
                style: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Manrope',
                      color: FlutterFlowTheme.of(context).secondary,
                      fontSize: 16.0,
                      letterSpacing: 0.0,
                    ),
              ).animateOnPageLoad(animationsMap['textOnPageLoadAnimation2']!),
            )
          : ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: requestVM.requests.length,
              itemBuilder: (context, index) {
                return cardTemplate(context, requestVM.requests[index],
                    _transactionCardModels[index], index, requestVM);
              },
            );
    });
  }

  Widget cardTemplate(
      BuildContext context,
      Request requestLog,
      TransactionCardModel model,
      int index,
      RequestViewModel requestViewModel) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 30.0, 20.0),
      child: Stack(
        children: [
          wrapWithModel(
                  model: model,
                  updateCallback: () => safeSetState(() {}),
                  child: TransactionCardWidget(
                    title: '₱ ${requestLog.total}',
                    startDate: _model.formatDateTime(requestLog.start_date),
                    finishDate: _model.formatDateTime(requestLog.finish_date),
                    total: _model
                        .formatDurationFromSeconds(requestLog.duration ?? 888),
                    cardId: requestLog.id,
                    rateType: requestLog.rate_type,
                    duration: requestLog.status,
                    petId: requestLog.pet_id,
                    userId: requestLog.user_id ?? '-1',
                    requestObject: requestLog,
                  ))
              .animateOnPageLoad(
                  animationsMap['foodCardOnPageLoadAnimation2']!),
        ],
      ),
    );
  }
  


    Widget onLoading(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Cash Report',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Manrope',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                ),
          ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
              color: FlutterFlowTheme.of(context).primaryText),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: const SafeArea(
          child: Center(
            child: CircularProgressIndicator(),
          )
        ),
    );
  }


  Future<void> fetchUserDetails() async {

    final userVM = Provider.of<RequestViewModel>(context, listen: false);

    // fetch everything in pne gp
    final fetchTotalEarnings = await userVM.fetchEarnings('caretaker_id', TimeFilter.year);
    final fetchMonthEarnings = await userVM.fetchEarnings('caretaker_id', TimeFilter.month);
    final fetchWeekEarnings = await userVM.fetchEarnings('caretaker_id', TimeFilter.week);
    final fetchDayEarnings = await userVM.fetchEarnings('caretaker_id', TimeFilter.day);


    final fetchTotalCosts = await userVM.fetchEarnings('user_id', TimeFilter.year);
    final fetchMonthCosts = await userVM.fetchEarnings('user_id', TimeFilter.month);
    final fetchWeekCosts = await userVM.fetchEarnings('user_id', TimeFilter.week);
    final fetchDayCosts = await userVM.fetchEarnings('user_id', TimeFilter.day);


    setState(() {

      totalEarnings = fetchTotalEarnings!;
      monthEarnings = fetchMonthEarnings!;
      weekEarnings = fetchWeekEarnings!;
      dayEarnings = fetchDayEarnings!;

      totalCosts = fetchTotalCosts!;
      monthCosts = fetchMonthCosts!;
      weekCosts = fetchWeekCosts!;
      dayCosts = fetchDayCosts!;

      _model.isLoading = false;

      // if totalEarnings is null, then everything is
      if (totalEarnings == null) {
        _model.isLoading = true;
      }

      print(' Year ' + totalCosts + ' Month ' + monthCosts + ' Week ' + weekCosts + ' day ' + dayCosts);

    });
  }

}
