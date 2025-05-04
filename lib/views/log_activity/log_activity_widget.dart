import 'package:paw_r_app/views/log_activity_add/log_activity_add_widget.dart';
import 'package:paw_r_app/views/log_activity_list/log_activity_list_widget.dart';

import '/components/activity_card_widget.dart';
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
import 'log_activity_model.dart';
export 'log_activity_model.dart';

import 'package:paw_r_app/models/pet.dart';
import 'package:paw_r_app/views/log_food_add/log_food_add_widget.dart';

import 'package:paw_r_app/view_models/pet_view_model.dart';
import 'package:paw_r_app/models/food.dart';

import 'package:supabase_flutter/supabase_flutter.dart';
import '../log_food_list/log_food_list_widget.dart';

import 'package:paw_r_app/models/activity.dart';

class LogActivityWidget extends StatefulWidget {
  final Pet pet;
  const LogActivityWidget({Key? key, required this.pet}) : super(key: key);

  static String routeName = 'LogActivity';
  static String routePath = '/logFood';

  Object? get amount => null;

  Object? get calories => null;

  @override
  State<LogActivityWidget> createState() => _LogActivityWidgetState();
}

class _LogActivityWidgetState extends State<LogActivityWidget>
    with TickerProviderStateMixin {
  late LogActivityModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  List<ActivityCardModel> _activityCardModels = [];

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LogActivityModel());

    _model.searchFieldTextController ??= TextEditingController();
    _model.searchFieldFocusNode ??= FocusNode();

    _model.inputTextController ??= TextEditingController();

    _model.isTyping = false;

    _model.observationInput = '';

    final activityVM = Provider.of<PetViewModel>(context, listen: false);
    activityVM.fetchActivities(widget.pet.id);

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

    for (var model in _activityCardModels) {
      model.dispose();
    }

    super.dispose();
  }


  Future<void> inputObservation(BuildContext context, List<ActivityCardModel> activityCardCollection) async {
    print('input observation');
    final TextEditingController _noteController = TextEditingController();

    showModalBottomSheet<String>(
      context: context,
      isScrollControlled:
          true, // Important to allow full height when keyboard opens
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom:
                MediaQuery.of(context).viewInsets.bottom, // Adjust for keyboard
            left: 16,
            right: 16,
            top: 24,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Wrap content height
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Enter a note',
                  style: FlutterFlowTheme.of(context).labelMedium),
              SizedBox(height: 12),
              TextField(
                controller: _model.inputTextController,
                autofocus: true,
                maxLines: null, // Allow multiline notes
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Type your observations here...',
                ),
              ),
              SizedBox(height: 16),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  child: Text('Submit'),
                  onPressed: () {
                    final note = _model.inputTextController.text.trim();
                    Navigator.of(context).pop(note); // Return the note
                  },
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        );
      },
    ).then((note) async {
      if (note != null && note.isNotEmpty) {
        // Do something with the note, e.g. save or display it
        print('User entered note: $note');

        setState(() {
          _model.observationInput = note;
        });
      }

      await Provider.of<PetViewModel>(context, listen: false).logActivity(activityCardCollection, _model.observationInput, widget.pet.id);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LogActivityWidget(pet: widget.pet)),
      );
      
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
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(30.0, 30.0, 30.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/pawr_green.png',
                          width: 200.0,
                          height: 100.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
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
                            'log an activity',
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
                      EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 30.0, 30.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        LogActivityAddWidget(pet: widget.pet),
                                  ));

                            },
                            text: 'Add Activity',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 50.0,
                              padding: EdgeInsets.all(8.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 20.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Manrope',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    fontSize: 17.0,
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 0.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                        ),
                      ),

                      // 👇 Space between the two buttons
                      SizedBox(width: 16.0),

                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {

                              final selectedIndexes = _activityCardModels
                                  .asMap()
                                  .entries
                                  .where((entry) => entry.value.isSelected)
                                  .map((entry) => entry.key)
                                  .toList();

                              if (selectedIndexes.isEmpty) return;


                            
                              final selectedIds = selectedIndexes
                                  .map((index) =>
                                      _activityCardModels[index].widget?.cardId)
                                  .whereType<int>() // filters out nulls
                                  .toList();

                                

                              // Call the batch delete method
                              await Provider.of<PetViewModel>(context,
                                      listen: false)
                                  .deleteMultipleActivity(selectedIds);

                              // Remove the models from the UI
                              setState(() {
                                for (var index in selectedIndexes.reversed) {
                                  _activityCardModels[index].dispose();
                                  _activityCardModels.removeAt(index);
                                }
                              });

                              // Navigate or refresh
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        LogActivityWidget(pet: widget.pet)),
                              );
                            },
                            text: 'Delete',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 50.0,
                              padding: EdgeInsets.all(8.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 20.0, 0.0),
                              color: Colors.redAccent,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Manrope',
                                    color: Colors.white,
                                    fontSize: 17.0,
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 0.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
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
                        'Pick a snack',
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
        floatingActionButton: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton.extended(
              heroTag: 'fab1',
              backgroundColor: Colors.greenAccent,
              elevation: 3.0,
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LogActivityListWidget(pet: widget.pet)),
                );
              },
              label: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(
                    Icons.history,
                    color: Colors.white,
                    size: 24.0,
                  ),
                  Text(
                    'History',
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

            FloatingActionButton.extended(
              heroTag: 'fab2',
              backgroundColor: FlutterFlowTheme.of(context).primary,
              elevation: 3.0,
              onPressed: () async {
                final selectedIndexes = _activityCardModels
                    .asMap()
                    .entries
                    .where((entry) => entry.value.isSelected)
                    .map((entry) => entry.key)
                    .toList();

                final petId = widget.pet.id;

                if (selectedIndexes.isEmpty) return;


                final List<ActivityCardModel> activityCardCollection = [];

                for (var index in selectedIndexes) {
                  final model = _activityCardModels[index];
                  activityCardCollection.add(model);
                }

                await inputObservation(context, activityCardCollection);


                // Optional: visually unselect them afterward
                setState(() {
                  for (var index in selectedIndexes) {
                    _activityCardModels[index].isSelected = false;
                  }
                });

                // Optionally show a SnackBar or success message
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Activities added to Log!')),
                );


              },
              label: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  Text(
                    'Log Activity',
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
    return Consumer<PetViewModel>(builder: (context, activityVM, child) {
      if (activityVM.isLoading) {
        return const Center(
          heightFactor: 10.0,
          child: LinearProgressIndicator(),
        );
      }

      /// Dynamically create models only when activities load or change
      if (_activityCardModels.length != activityVM.activities.length) {
        // Dispose old models
        for (var model in _activityCardModels) {
          model.dispose();
        }
        // Create new models
        _activityCardModels = activityVM.activities
            .map((_) =>
                createModel<ActivityCardModel>(context, () => ActivityCardModel()))
            .toList();
      }

      return activityVM.activities.isEmpty
          ? Center(
              child: Text(
                'No activities for ${widget.pet.name}',
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
              itemCount: activityVM.activities.length,
              itemBuilder: (context, index) {
                return cardTemplate(context, activityVM.activities[index],
                    _activityCardModels[index], index, activityVM);
              },
            );
    });
  }

  Widget cardTemplate(BuildContext context, Activity activity, ActivityCardModel model,
      int index, PetViewModel petViewModel) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 30.0, 20.0),
      child: Stack(
        children: [
          wrapWithModel(
            model: model,
            updateCallback: () => safeSetState(() {}),
            child: ActivityCardWidget(
              title: activity.activityName,
              description: activity.notes,
              color: FlutterFlowTheme.of(context).azureWeb,
              cardId: activity.id,
            ),
          ).animateOnPageLoad(animationsMap['foodCardOnPageLoadAnimation2']!),
        ],
      ),
    );
  }
}
