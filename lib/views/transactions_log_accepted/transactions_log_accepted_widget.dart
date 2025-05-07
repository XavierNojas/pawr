
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
import 'transactions_log_accepted_model.dart';
export 'transactions_log_accepted_model.dart';

import 'package:paw_r_app/models/pet.dart';
import 'package:paw_r_app/views/log_food_add/log_food_add_widget.dart';

import 'package:paw_r_app/view_models/request_view_model.dart';
import 'package:paw_r_app/models/food.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

import '/components/chart_chip_widget.dart';

import '/components/transaction_card_widget.dart';

import 'package:intl/intl.dart';

import 'package:paw_r_app/models/request.dart';
import 'package:paw_r_app/models/pet.dart';

import 'package:paw_r_app/views/transactions_log_other/transactions_log_other_widget.dart';

import 'package:paw_r_app/views/transactions_tab_other.dart';

class TransactionsLogAcceptedWidget extends StatefulWidget {
  final String? status;
  final bool isFromProfile;

  const TransactionsLogAcceptedWidget({Key? key, required this.status, required this.isFromProfile}) : super(key: key);

  static String routeName = 'LogFood';
  static String routePath = '/logFood';

  @override
  State<TransactionsLogAcceptedWidget> createState() => _TransactionsLogAcceptedWidgetState();
}

class _TransactionsLogAcceptedWidgetState extends State<TransactionsLogAcceptedWidget>
    with TickerProviderStateMixin {
  late TransactionsLogAcceptedModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  // List<FoodCardModel> _transactionCardModels = [];
  List<TransactionCardModel> _transactionCardModels = [];

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TransactionsLogAcceptedModel());

    _model.searchFieldTextController ??= TextEditingController();
    _model.searchFieldFocusNode ??= FocusNode();

    final requestVM = Provider.of<RequestViewModel>(context, listen: false);

    requestVM.fetchAcceptedRequests('accepted');

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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: (widget.status == 'pending') ? FlutterFlowTheme.of(context).primaryBackground 
        : FlutterFlowTheme.of(context).accent1,
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          if (widget.isFromProfile ?? false)
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 10.0, 0.0),
                            child: FlutterFlowIconButton(
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
                          ),
                          Text(
                            'My Requests',
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


                 Container(
        width: MediaQuery.sizeOf(context).width * 1.3,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [



                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(30.0, 15.0, 30.0, 15.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        (widget.status == 'pending') 
                              ? 'Pet requests awaiting for approval' : 'Pet requests accepted by other users',
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

                

                  ],
                ),
              ),
            ),

            
          ],
        ),
      ).animateOnPageLoad(animationsMap['textOnPageLoadAnimation1']!),



                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(30.0, 15.0, 30.0, 15.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        (widget.status =='pending') ? 'Pending' : 'Accepted',
                        style: FlutterFlowTheme.of(context).titleSmall.override(
                              fontFamily: 'Manrope',
                              color: FlutterFlowTheme.of(context).secondary,
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                            ),
                      ).animateOnPageLoad(
                          animationsMap['textOnPageLoadAnimation1']!),
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

        floatingActionButton: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton.extended(
              heroTag: 'fab1',
              backgroundColor: Colors.redAccent,
              elevation: 3.0,
              onPressed: () async {
                print('second FAB');

                final selectedIndexes = _transactionCardModels
                    .asMap()
                    .entries
                    .where((entry) => entry.value.isSelected)
                    .map((entry) => entry.key)
                    .toList();

                final selectedIds = selectedIndexes
                    .map((index) =>
                        _transactionCardModels[index].widget?.cardId)
                    .whereType<int>() // filters out nulls
                    .toList();

                if (selectedIds.isEmpty) return;

                // Call the batch delete method
                await Provider.of<RequestViewModel>(context, listen: false)
                    .deleteMultipleRequests(selectedIds);

                // Remove the models from the UI
                setState(() {
                  for (var index in selectedIndexes.reversed) {
                    _transactionCardModels[index].dispose();
                    _transactionCardModels.removeAt(index);
                  }
                });


                Navigator.pushReplacementNamed(context, '/homeNav');
                if (widget.isFromProfile) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TransactionsLogAcceptedWidget(status: 'accepted', isFromProfile: true)));
                } else {
                  Navigator.pushReplacementNamed(context, '/homeNav');
                }
                
              },
              label: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(
                    Icons.delete_rounded,
                    color: Colors.white,
                    size: 24.0,
                  ),
                  Text(
                    'Delete',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Manrope',
                          color: Colors.white,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ].divide(SizedBox(width: 8.0)),
              ),
            ),

            // 👇 Space between the two buttons
            
            SizedBox(height: 16.0),


            if (!widget.isFromProfile)


            FloatingActionButton.extended(
              heroTag: 'fab1',
              backgroundColor: FlutterFlowTheme.of(context).primary,
              elevation: 3.0,
              onPressed: () async {
                print('First FAB');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TransactionsOtherNavigator()),
                );
              },
              label: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(
                    Icons.attach_money_rounded,
                    color: Colors.white,
                  ),
                  Text(
                    'Pet Requests',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Manrope',
                          color: Colors.white,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ].divide(SizedBox(width: 8.0)),
              ),
            ),
          ],
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
      if (_transactionCardModels.length != requestVM.requestsAccepted.length) {
        // Dispose old models
        for (var model in _transactionCardModels) {
          model.dispose();
        }
        // Create new models
        _transactionCardModels = requestVM.requestsAccepted
            .map((_) => createModel<TransactionCardModel>(
                context, () => TransactionCardModel()))
            .toList();
      }

      return requestVM.requestsAccepted.isEmpty
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
              physics: NeverScrollableScrollPhysics(),
              itemCount: requestVM.requestsAccepted.length,
              itemBuilder: (context, index) {
                return cardTemplate(context, requestVM.requestsAccepted[index],
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
