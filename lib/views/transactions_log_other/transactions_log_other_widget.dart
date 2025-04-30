import '/components/food_card_widget.dart';
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
import 'transactions_log_other_model.dart';
export 'transactions_log_other_model.dart';

import 'package:paw_r_app/models/pet.dart';
import 'package:paw_r_app/views/log_food_add/log_food_add_widget.dart';

import 'package:paw_r_app/view_models/request_view_model.dart';
import 'package:paw_r_app/models/food.dart';

import '/components/chart_chip_widget.dart';

import '/components/transaction_card_widget.dart';

import 'package:intl/intl.dart';

import 'package:paw_r_app/models/request.dart';
import 'package:paw_r_app/models/pet.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

class TransactionsLogOtherWidget extends StatefulWidget {
  final String? status;
  const TransactionsLogOtherWidget({super.key, required this.status});

  static String routeName = 'LogFood';
  static String routePath = '/logFood';

  @override
  State<TransactionsLogOtherWidget> createState() =>
      _TransactionsLogOtherWidgetState();
}

class _TransactionsLogOtherWidgetState extends State<TransactionsLogOtherWidget>
    with TickerProviderStateMixin {
  late TransactionsLogOtherModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  final supabase = Supabase.instance.client;

  // List<FoodCardModel> _transactionCardModels = [];
  List<TransactionCardModel> _transactionCardModels = [];

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TransactionsLogOtherModel());

    _model.searchFieldTextController ??= TextEditingController();
    _model.searchFieldFocusNode ??= FocusNode();

    final requestVM = Provider.of<RequestViewModel>(context, listen: false);
    final userId = supabase.auth.currentUser?.id ?? -1;

    if (widget.status == 'pending') {
      requestVM.fetchOtherRequests(widget.status ?? 'pending');
    } else {
      requestVM.fetchOtherAcceptedRequests(userId as String);
    }

    animationsMap.addAll({
      'textOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: const Offset(10.0, 0.0),
            end: const Offset(0.0, 0.0),
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
      'textOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 100.ms),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 100.0.ms,
            duration: 400.0.ms,
            begin: const Offset(10.0, 0.0),
            end: const Offset(0.0, 0.0),
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
            begin: const Offset(10.0, 0.0),
            end: const Offset(0.0, 0.0),
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
            begin: const Offset(10.0, 0.0),
            end: const Offset(0.0, 0.0),
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
            begin: const Offset(10.0, 0.0),
            end: const Offset(0.0, 0.0),
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
            begin: const Offset(10.0, 0.0),
            end: const Offset(0.0, 0.0),
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
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      30.0, 20.0, 30.0, 10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Padding(
                          //   padding: const EdgeInsetsDirectional.fromSTEB(
                          //       0.0, 0.0, 10.0, 0.0),
                          //   child: FlutterFlowIconButton(
                          //     borderColor: Colors.transparent,
                          //     borderRadius: 30.0,
                          //     borderWidth: 1.0,
                          //     buttonSize: 40.0,
                          //     icon: Icon(
                          //       Icons.arrow_back_rounded,
                          //       color: FlutterFlowTheme.of(context).secondary,
                          //       size: 25.0,
                          //     ),
                          //     onPressed: () {
                          //       Navigator.pop(context);
                          //     },
                          //   ),
                          // ),
                          Text(
                            'Other Requests',
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  fontFamily: 'Manrope',
                                  color: FlutterFlowTheme.of(context).secondary,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ).animateOnPageLoad(
                              animationsMap['textOnPageLoadAnimation1']!),
                        ],
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      30.0, 15.0, 30.0, 15.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Pending',
                        style: FlutterFlowTheme.of(context).titleSmall.override(
                              fontFamily: 'Manrope',
                              color: FlutterFlowTheme.of(context).secondary,
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                            ),
                      ).animateOnPageLoad(
                          animationsMap['textOnPageLoadAnimation2']!),
                    ],
                  ),
                ),

                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    cardCreator(context),
                  ],
                ),

                // Padding(
                //   padding:
                //       EdgeInsetsDirectional.fromSTEB(30.0, 15.0, 30.0, 15.0),
                //   child: Row(
                //     mainAxisSize: MainAxisSize.max,
                //     children: [
                //       Text(
                //         'Completed',
                //         style: FlutterFlowTheme.of(context).titleSmall.override(
                //               fontFamily: 'Manrope',
                //               color: FlutterFlowTheme.of(context).secondary,
                //               fontSize: 16.0,
                //               letterSpacing: 0.0,
                //             ),
                //       ).animateOnPageLoad(
                //           animationsMap['textOnPageLoadAnimation2']!),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
        // floatingActionButton: Column(
        //   mainAxisSize: MainAxisSize.min,
        //   children: [
        //     FloatingActionButton.extended(
        //       heroTag: 'fab1',
        //       backgroundColor: Colors.redAccent,
        //       elevation: 3.0,
        //       onPressed: () async {
        //         print('second FAB');

        //         final selectedIndexes = _transactionCardModels
        //             .asMap()
        //             .entries
        //             .where((entry) => entry.value.isSelected)
        //             .map((entry) => entry.key)
        //             .toList();

        //         final selectedIds = selectedIndexes
        //             .map((index) =>
        //                 _transactionCardModels[index].widget?.cardId)
        //             .whereType<int>() // filters out nulls
        //             .toList();

        //         if (selectedIds.isEmpty) return;

        //         // Call the batch delete method
        //         await Provider.of<RequestViewModel>(context, listen: false)
        //             .deleteMultipleRequests(selectedIds);

        //         // Remove the models from the UI
        //         setState(() {
        //           for (var index in selectedIndexes.reversed) {
        //             _transactionCardModels[index].dispose();
        //             _transactionCardModels.removeAt(index);
        //           }
        //         });

        //         Navigator.pushReplacementNamed(context, '/homeNav');

        //       },
        //       label: Row(
        //         mainAxisSize: MainAxisSize.max,
        //         children: [
        //           Icon(
        //             Icons.delete_rounded,
        //             color: Colors.white,
        //             size: 24.0,
        //           ),
        //           Text(
        //             'Delete',
        //             style: FlutterFlowTheme.of(context).bodyMedium.override(
        //                   fontFamily: 'Manrope',
        //                   color: Colors.white,
        //                   letterSpacing: 0.0,
        //                   fontWeight: FontWeight.w600,
        //                 ),
        //           ),
        //         ].divide(SizedBox(width: 8.0)),
        //       ),
        //     ),

        //                     // 👇 Space between the two buttons
        //     // SizedBox(height: 16.0),

        //     // FloatingActionButton(
        //     //   heroTag: 'fab1',
        //     //   onPressed: () async {
        //     //     print('First FAB');
        //     //     // Navigator.push(
        //     //     //   context,
        //     //     //   MaterialPageRoute(
        //     //     //     builder: (context) => LogFoodListWidget(pet: widget.pet)),
        //     //     // );
        //     //   },
        //     //   child: Icon(Icons.list,
        //     //       color: const Color.fromARGB(255, 255, 255, 255)),
        //     //   backgroundColor: FlutterFlowTheme.of(context).primary,
        //     // ),
        //   ],
        // ),
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
      if (_transactionCardModels.length != requestVM.otherRequests.length) {
        // Dispose old models
        for (var model in _transactionCardModels) {
          model.dispose();
        }
        // Create new models
        _transactionCardModels = requestVM.otherRequests
            .map((_) => createModel<TransactionCardModel>(
                context, () => TransactionCardModel()))
            .toList();
      }

      return requestVM.otherRequests.isEmpty
          ? Center(
              child: Text(
                'No ${widget.status} requests',
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
              itemCount: requestVM.otherRequests.length,
              itemBuilder: (context, index) {
                return cardTemplate(context, requestVM.otherRequests[index],
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
}
