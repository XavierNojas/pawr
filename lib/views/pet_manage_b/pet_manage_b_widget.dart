import 'package:paw_r_app/components/food_card_model.dart';
import 'package:paw_r_app/components/pet_card_widget.dart';
import 'package:paw_r_app/flutter_flow/flutter_flow_icon_button.dart';
import 'package:paw_r_app/models/pet.dart';
import 'package:paw_r_app/views/pet_add/pet_add_widget.dart';

import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pet_manage_b_model.dart';
export 'pet_manage_b_model.dart';



import '/components/food_card_widget.dart';
import 'package:paw_r_app/views/log_food_add/log_food_add_widget.dart';

import 'package:paw_r_app/view_models/pet_view_model.dart';
import 'package:paw_r_app/models/food.dart';
import '../log_food_list/log_food_list_widget.dart';



class PetManageBWidget extends StatefulWidget {
  final isFromProfile;
  final friendId;
  const PetManageBWidget({super.key, required this.isFromProfile, this.friendId});

  static String routeName = 'PetManage';
  static String routePath = '/petManage';

  @override
  State<PetManageBWidget> createState() => _PetManageWidgetState();
}

class _PetManageWidgetState extends State<PetManageBWidget>
    with TickerProviderStateMixin {
  late PetManageBModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  List<PetCardModel> _foodCardModels = [];
  

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PetManageBModel());

    _model.searchFieldTextController ??= TextEditingController();
    _model.searchFieldFocusNode ??= FocusNode();

    final petVM = Provider.of<PetViewModel>(context, listen: false);
    petVM.fetchPets();

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
                      const EdgeInsetsDirectional.fromSTEB(30.0, 30.0, 30.0, 0.0),
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
                      const EdgeInsetsDirectional.fromSTEB(30.0, 20.0, 30.0, 10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          if (widget.isFromProfile)
                          
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
                            'My pets',
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
                      const EdgeInsetsDirectional.fromSTEB(30.0, 15.0, 30.0, 15.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Click on a pet to get started',
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
              backgroundColor: Colors.greenAccent[100],
              onPressed: () async {



                if (widget.isFromProfile) {

                final selectedIndexes = _foodCardModels
                    .asMap()
                    .entries
                    .where((entry) => entry.value.isSelected)
                    .map((entry) => entry.key)
                    .toList();

                // final petId = widget.pet.id;

                if (selectedIndexes.isEmpty) return;

                final List<PetCardModel> petCardCollection = [];

                for (var index in selectedIndexes) {
                  final model = _foodCardModels[index];
                  petCardCollection.add(model);
                }

                await _model.addToFriend(context,  widget.friendId, petCardCollection);

                // await inputObservation(context, activityCardCollection);

                // Optional: visually unselect them afterward
                setState(() {
                  for (var index in selectedIndexes) {
                    _foodCardModels[index].isSelected = false;
                  }
                });

                // // Optionally show a SnackBar or success message
                // ScaffoldMessenger.of(context).showSnackBar(
                //   const SnackBar(content: Text('Activities added to Log!'))
                // }



                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => PetManageBWidget(isFromProfile: true, friendId: widget.friendId)));

                } else {

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const PetProfileAddWidget()));
                

                }

                  
              },
              label: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Icon(
                    Icons.add_rounded,
                    color: Colors.black,
                    size: 24.0,
                  ),
                  Text(
                    (widget.isFromProfile) ? 'Assign Pet' : 'Add pet',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Manrope',
                          color: Colors.black,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ].divide(const SizedBox(width: 8.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget cardCreator(BuildContext context) {
    return Consumer<PetViewModel>(builder: (context, petVM, child) {
      if (petVM.isLoading) {
        return const Center(
          heightFactor: 10.0,
          child: LinearProgressIndicator(),
        );
      }

      /// Dynamically create models only when snacks load or change
      if (_foodCardModels.length != petVM.pets.length) {
        // Dispose old models
        for (var model in _foodCardModels) {
          model.dispose();
        }
        // Create new models
        _foodCardModels = petVM.pets
            .map((_) =>
                createModel<PetCardModel>(context, () => PetCardModel()))
            .toList();
      }

      return petVM.pets.isEmpty
          ? Center(
              child: Text(
                'No pets',
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
              physics: const NeverScrollableScrollPhysics(),
              itemCount: petVM.pets.length,
              itemBuilder: (context, index) {
                return cardTemplate(context, petVM.pets[index],
                    _foodCardModels[index], index, petVM);
              },
            );
    });
  }

  Widget cardTemplate(BuildContext context, Pet pet, PetCardModel model,
      int index, PetViewModel petViewModel) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 30.0, 20.0),
      child: Stack(
        children: [
          wrapWithModel(
            model: model,
            updateCallback: () => safeSetState(() {}),
            child: PetCardWidget(
              title: pet.name,
              subTitle: pet.breed,
              image: 'https://picsum.photos/200',
              cardId: pet.id,
              petObject: pet,
            ),
          ).animateOnPageLoad(animationsMap['foodCardOnPageLoadAnimation2']!),
        ],
      ),
    );
  }
}
