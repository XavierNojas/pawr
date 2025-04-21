import 'package:paw_r_app/models/foodLog.dart';

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
import 'log_food_list_model.dart';
export 'log_food_list_model.dart';

import 'package:paw_r_app/models/pet.dart';
import 'package:paw_r_app/views/log_food_add/log_food_add_widget.dart';

import 'package:paw_r_app/view_models/pet_view_model.dart';
import 'package:paw_r_app/models/food.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

class LogFoodListWidget extends StatefulWidget {
  final Pet pet;
  const LogFoodListWidget({Key? key, required this.pet}) : super(key: key);

  static String routeName = 'LogFood';
  static String routePath = '/logFood';

  @override
  State<LogFoodListWidget> createState() => _LogFoodListWidgetState();
}

class _LogFoodListWidgetState extends State<LogFoodListWidget>
    with TickerProviderStateMixin {
  late LogFoodListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  List<FoodCardModel> _foodCardModels = [];

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LogFoodListModel());

    _model.searchFieldTextController ??= TextEditingController();
    _model.searchFieldFocusNode ??= FocusNode();

    final snackLogVM = Provider.of<PetViewModel>(context, listen: false);
    snackLogVM.fetchFoodLogs(widget.pet.id);

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

    for (var model in _foodCardModels) {
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
                  padding:
                      EdgeInsetsDirectional.fromSTEB(30.0, 20.0, 30.0, 10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                            'snack history',
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
                  padding:
                      EdgeInsetsDirectional.fromSTEB(30.0, 15.0, 30.0, 15.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'recent',
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
              ],
            ),
          ),
        ),
        // floatingActionButton: Column(
        //     FloatingActionButton(
        //       heroTag: 'fab2',
        //       onPressed: () async {
        //         print('Second FAB');
        //         Navigator.push(
        //           context,
        //           MaterialPageRoute(builder: (context) => LogFoodAddWidget(pet: widget.pet),
        //           ));
        //       },
        //       child: Icon(Icons.add),
        //       backgroundColor: Colors.greenAccent[200],
        //     ),
        //   ],
        // ),
      ),
    );
  }

  Widget cardCreator(BuildContext context) {
    return Consumer<PetViewModel>(builder: (context, snackLogVM, child) {
      if (snackLogVM.isLoading) {
        return const Center(
          heightFactor: 10.0,
          child: LinearProgressIndicator(),
        );
      }

      /// Dynamically create models only when snackLogs load or change
      if (_foodCardModels.length != snackLogVM.snackLogs.length) {
        // Dispose old models
        for (var model in _foodCardModels) {
          model.dispose();
        }
        // Create new models
        _foodCardModels = snackLogVM.snackLogs
            .map((_) =>
                createModel<FoodCardModel>(context, () => FoodCardModel()))
            .toList();
      }

      return snackLogVM.snackLogs.isEmpty
          ? Center(
              child: Text(
                'No snackLogs for ${widget.pet.name}',
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
              itemCount: snackLogVM.snackLogs.length,
              itemBuilder: (context, index) {
                return cardTemplate(context, snackLogVM.snackLogs[index],
                    _foodCardModels[index], index);
              },
            );
    });
  }

  Widget cardTemplate(
      BuildContext context, FoodLog snack, FoodCardModel model, int index) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 30.0, 10.0),
      child: wrapWithModel(
        model: model,
        updateCallback: () => safeSetState(() {}),
        child: GestureDetector(
          // onTap: () {
          //   model.isSelected = !model.isSelected;
          //   safeSetState(() {});
          // },
          child: Card(
            elevation: 0,
            color: model.isSelected
                ? Colors.blue.withOpacity(0.1)
                : Colors.green[200],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    snack.foodName ?? 'No name',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Amount: ${snack.amount}',
                          style: Theme.of(context).textTheme.bodySmall),
                      Text('Calories: ${snack.calories}',
                          style: Theme.of(context).textTheme.bodySmall),
                      Text('Glycemic: ${snack.gLoad}',
                          style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),
                  Text(
                    'Created at: ${snack.created_at}' ,
                    style: Theme.of(context).textTheme.bodySmall,
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
