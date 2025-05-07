import 'package:paw_r_app/components/food_card_model.dart';
import 'package:paw_r_app/components/friend_contact_model.dart';
import 'package:paw_r_app/components/friend_contact_widget.dart';
import 'package:paw_r_app/components/pet_card_widget.dart';
import 'package:paw_r_app/flutter_flow/flutter_flow_icon_button.dart';
import 'package:paw_r_app/models/pet.dart';
import 'package:paw_r_app/models/user.dart';
import 'package:paw_r_app/view_models/friends_view_model.dart';
import 'package:paw_r_app/views/pet_add/pet_add_widget.dart';
import 'package:paw_r_app/views/user_group_manage_add/user_group_manage_widget.dart';

import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'user_b_group_manage_model.dart';
export 'user_b_group_manage_model.dart';



import '/components/food_card_widget.dart';
import 'package:paw_r_app/views/log_food_add/log_food_add_widget.dart';

import 'package:paw_r_app/view_models/pet_view_model.dart';
import 'package:paw_r_app/models/food.dart';
import '../log_food_list/log_food_list_widget.dart';



class UserGroupBManageWidget extends StatefulWidget {
  // final String friendId;
  // final String username;
  const UserGroupBManageWidget({super.key});

  static String routeName = 'PetManage';
  static String routePath = '/petManage';

  @override
  State<UserGroupBManageWidget> createState() => _UserGroupBManageWidgetState();
}

class _UserGroupBManageWidgetState extends State<UserGroupBManageWidget>
    with TickerProviderStateMixin {
  late UserGroupBManageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  List<FriendCardModel> _FriendCardModels = [];
  

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserGroupBManageModel());

    _model.searchFieldTextController ??= TextEditingController();
    _model.searchFieldFocusNode ??= FocusNode();

    fetchMultipleFriends();

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

    for (var model in _FriendCardModels) {
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

                          //                           Padding(
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
                                                                  FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30.0,
                                          borderWidth: 1.0,
                                          buttonSize: 40.0,
                                          icon: Icon(
                                            Icons.arrow_back_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            size: 25.0,
                                          ),
                                          onPressed: () {
                                            // Your logic here
                                            Navigator.pop(context);
                                          },
                                        ),
                          Text(
                            'Pets',
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
                        'Pets Assigned will appear here',
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
        //   mainAxisSize: MainAxisSize.min,
        //   children: [
        //     FloatingActionButton.extended(
        //       heroTag: 'fab1',
        //       backgroundColor: Colors.greenAccent[100],
        //       onPressed: () async {

        //               Navigator.push(
        //                 context,
        //                 MaterialPageRoute(
        //                   builder: (context) => const UserGroupManageAddWidget()));
                  
        //       },
        //       label: Row(
        //         mainAxisSize: MainAxisSize.max,
        //         children: [
        //           const Icon(
        //             Icons.person_add_alt_rounded,
        //             color: Colors.black,
        //             size: 24.0,
        //           ),
        //           Text(
        //             'Add user',
        //             style: FlutterFlowTheme.of(context).bodyMedium.override(
        //                   fontFamily: 'Manrope',
        //                   color: Colors.black,
        //                   letterSpacing: 0.0,
        //                   fontWeight: FontWeight.w600,
        //                 ),
        //           ),
        //         ].divide(const SizedBox(width: 8.0)),
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }

  Widget cardCreator(BuildContext context) {
    return Consumer<FriendsViewModel>(builder: (context, friendsVM, child) {
      if (friendsVM.isLoading) {
        return const Center(
          heightFactor: 10.0,
          child: LinearProgressIndicator(),
        );
      }

      /// Dynamically create models only when snacks load or change
      if (_FriendCardModels.length != friendsVM.friendsPetsDetails.length) {
        // Dispose old models
        for (var model in _FriendCardModels) {
          model.dispose();
        }
        // Create new models
        _FriendCardModels = friendsVM.friendsPetsDetails
            .map((_) =>
                createModel<FriendCardModel>(context, () => FriendCardModel()))
            .toList();
      }

      return friendsVM.friendsPetsDetails.isEmpty
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
              itemCount: friendsVM.friendsPetsDetails.length,
              itemBuilder: (context, index) {
                return cardTemplate(context, friendsVM.friendsPetsDetails[index],
                    _FriendCardModels[index], index);
              },
            );
    });
  }

  Widget cardTemplate(BuildContext context, Pet pet, FriendCardModel model,
      int index) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 30.0, 20.0),
      child: Stack(
        children: [
          wrapWithModel(
            model: model,
            updateCallback: () => safeSetState(() {}),
            child: PetCardWidget(
              cardId: index,
              title: pet.name,
              subTitle: pet.breed,
              isFromFriend: true,
              petObject: pet,
            ),
          ).animateOnPageLoad(animationsMap['foodCardOnPageLoadAnimation2']!),
        ],
      ),
    );
  }


  Future<void> fetchMultipleFriends() async {

    final friendsVM = Provider.of<FriendsViewModel>(context, listen: false);
    await friendsVM.fetchFriendsPets();

    setState((){
      _model.isLoading = false;
    });
  }


}
