import 'package:paw_r_app/components/pet_card_model.dart';
import 'package:paw_r_app/components/pet_card_widget.dart';
import 'package:paw_r_app/flutter_flow/flutter_flow_icon_button.dart';
import 'package:paw_r_app/view_models/friends_view_model.dart';
import 'package:paw_r_app/views/log_food/log_food_widget.dart';
import 'package:paw_r_app/views/pet_manage_b/pet_manage_b_widget.dart';
import 'package:paw_r_app/views/screen_navigator.dart';
import 'package:paw_r_app/views/transactions_log/transactions_log_widget.dart';
import 'package:paw_r_app/views/transactions_log_other/transactions_log_other_widget.dart';
import 'package:paw_r_app/views/transactions_log_other_accepted/transactions_log_other_accepted_widget.dart';
import 'package:paw_r_app/views/user_b_group_manage/user_b_group_manage_widget.dart';
import 'package:paw_r_app/views/user_earnings/user_earnings_widget.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'user_friend_profile_model.dart';
export 'user_friend_profile_model.dart';
import 'package:paw_r_app/models/pet.dart';

import 'package:paw_r_app/views/pet_profile_edit/pet_edit_widget.dart';

import 'package:paw_r_app/flutter_flow/flutter_flow_animations.dart';

import 'package:flutter_animate/src/effects/move_effect.dart';

import 'package:flutter_animate/src/effects/visibility_effect.dart';

import 'package:flutter_animate/src/effects/fade_effect.dart';

import 'package:flutter_animate/src/extensions/num_duration_extensions.dart';

import 'package:paw_r_app/views/log_mood/log_mood_widget.dart';

import 'package:paw_r_app/views/log_activity/log_activity_widget.dart';

import 'package:paw_r_app/models/user.dart';

import 'package:paw_r_app/view_models/request_view_model.dart';

import 'package:supabase_flutter/supabase_flutter.dart';


class UserFriendProfileWidget extends StatefulWidget {
  final String userId;
  const UserFriendProfileWidget({Key? key, required this.userId}) : super(key: key);

  static String routeName = 'UserProfile';
  static String routePath = '/petProfile';

  final Color color = Colors.white;

  @override
  State<UserFriendProfileWidget> createState() => _UserFriendProfileWidgetState();
}

class _UserFriendProfileWidgetState extends State<UserFriendProfileWidget> {
  late UserFriendProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  late String username;
  late String email;
  late String phone;
  late String referenceCode;
  late String friendId;
  
  late String totalEarnings;
  late String totalDeficit;

  List<PetCardModel> _foodCardModels = [];

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserFriendProfileModel());


    _model.isLoading = true;
      
     fetchUserDetails(widget.userId);

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

    for (var model in _foodCardModels) {
      model.dispose();
    }

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

    return (_model.isLoading == true) ? onLoading(context)
    : GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Profile',
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
            Navigator.pushNamed(context, '/homeNav');
          },
        ),
          backgroundColor: FlutterFlowTheme.of(context).accent1,
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

                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16.0, 32.0, 16.0, 32.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 8.0,
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
                              width: 100.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: Image.asset(
                                    'assets/images/user.png',
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
                                    username,
                                    style: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .override(
                                          fontFamily: 'Manrope',
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  Text(
                                    email,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Manrope',
                                          color: FlutterFlowTheme.of(context)
                                              .info,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Text(
                                    phone,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Manrope',
                                          color: FlutterFlowTheme.of(context)
                                              .info,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  Text(
                                    referenceCode,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Manrope',
                                          color: FlutterFlowTheme.of(context)
                                              .persianGreen,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w700,
                                        ),
                                  ),
                                  // Text(
                                  //   friendId,
                                  //   style: FlutterFlowTheme.of(context)
                                  //       .bodyMedium
                                  //       .override(
                                  //         fontFamily: 'Manrope',
                                  //         color: FlutterFlowTheme.of(context)
                                  //             .info,
                                  //         letterSpacing: 0.0,
                                  //       ),
                                  // ),
                                ],
                              ),
                            ),
                          //   Align(
                          //   alignment: AlignmentDirectional(1.0, 0.0),
                          //   child: Padding(
                          //     padding: EdgeInsetsDirectional.fromSTEB(
                          //         0.0, 8.0, 15.0, 8.0),
                          //     child: Icon(
                          //       Icons.verified_user_sharp,
                          //       color: Colors.green[700],
                          //       size: 24.0,
                          //     ),
                          //   ),
                          // ),
                          ].divide(SizedBox(width: 16.0)),
                        ),
                      ),
                    ),
                  ),



                        // Padding(
                        //   padding: EdgeInsetsDirectional.fromSTEB(
                        //       0.0, 20.0, 30.0, 10.0),
                        //   child: Row(
                        //     mainAxisSize: MainAxisSize.max,
                        //     children: [
                        //       Column(
                        //         crossAxisAlignment: CrossAxisAlignment.start,
                        //         children: [
                        //           Text(
                        //             '${username}\'s Pets',
                        //             style: FlutterFlowTheme.of(context)
                        //                 .headlineSmall
                        //                 .override(
                        //                   fontFamily: 'Manrope',
                        //                   color: FlutterFlowTheme.of(context)
                        //                       .secondary,
                        //                   letterSpacing: 0.0,
                        //                   fontWeight: FontWeight.bold,
                        //                 ),
                        //           ).animateOnPageLoad(animationsMap[
                        //               'textOnPageLoadAnimation1']!),
                        //           Padding(
                        //             padding:
                        //                 const EdgeInsetsDirectional.fromSTEB(
                        //                     0.0, 0.0, 10.0, 0.0),
                        //             child: Row(
                        //               mainAxisSize: MainAxisSize.min,
                        //               children: [
                        //                 FlutterFlowIconButton(
                        //                   borderColor: Colors.transparent,
                        //                   borderRadius: 30.0,
                        //                   borderWidth: 1.0,
                        //                   buttonSize: 40.0,
                        //                   icon: Icon(
                        //                     Icons.arrow_back_rounded,
                        //                     color: FlutterFlowTheme.of(context)
                        //                         .secondary,
                        //                     size: 25.0,
                        //                   ),
                        //                   onPressed: () {
                        //                     // Your logic here
                        //                     Navigator.push(
                        //                       context,
                        //                       MaterialPageRoute(
                        //                         builder: (context) => UserGroupBManageWidget(friendId: widget.userId, username: username))
                        //                     );
                        //                   },
                        //                 ),
                        //                 const SizedBox(width: 8.0),
                        //                 Text(
                        //                   'View details',
                        //                   style: FlutterFlowTheme.of(context)
                        //                       .bodyMedium
                        //                       .override(
                        //                         fontFamily: 'Manrope',
                        //                         fontSize: 14.0,
                        //                         fontWeight: FontWeight.w300,
                        //                         letterSpacing: 0.0,
                        //                       ),
                        //                 ),
                        //               ],
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ],
                        //   ),
                        // ),




                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 30.0, 10.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Earnings',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .override(
                                          fontFamily: 'Manrope',
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ).animateOnPageLoad(animationsMap[
                                      'textOnPageLoadAnimation1']!),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 10.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
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
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => UserEarningsWidget(userId: friendId))
                                            );
                                          },
                                        ),
                                        const SizedBox(width: 8.0),
                                        Text(
                                          'View details',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Manrope',
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w300,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                Padding(
                  padding:
                      const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                    
                          Text(
                            'Shared Pets',
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
                        'Pets shared with this user',
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


                ]),
          ),
        ).animateOnPageLoad(animationsMap['foodCardOnPageLoadAnimation0']!),
                floatingActionButton: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton.extended(
              heroTag: 'fab1',
              backgroundColor: Colors.greenAccent[100],
              onPressed: () async {

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PetManageBWidget(isFromProfile: true, friendId: friendId)));
                  
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
                    'Share pets',
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

  Widget onLoading(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Profile',
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
        backgroundColor: FlutterFlowTheme.of(context).accent1,
        body: const SafeArea(
          child: Center(
            child: CircularProgressIndicator(),
          )
        ),
    );
  }

    Widget cardCreator(BuildContext context) {
    return Consumer<FriendsViewModel>(builder: (context, petVM, child) {
      if (petVM.isLoading) {
        return const Center(
          heightFactor: 10.0,
          child: LinearProgressIndicator(),
        );
      }

      /// Dynamically create models only when snacks load or change
      if (_foodCardModels.length != petVM.myPetsDetails.length) {
        // Dispose old models
        for (var model in _foodCardModels) {
          model.dispose();
        }
        // Create new models
        _foodCardModels = petVM.myPetsDetails
            .map((_) =>
                createModel<PetCardModel>(context, () => PetCardModel()))
            .toList();
      }

      return petVM.myPetsDetails.isEmpty
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
              itemCount: petVM.myPetsDetails.length,
              itemBuilder: (context, index) {
                return cardTemplate(context, petVM.myPetsDetails[index],
                    _foodCardModels[index], index, petVM);
              },
            );
    });
  }

  Widget cardTemplate(BuildContext context, Pet pet, PetCardModel model,
      int index, FriendsViewModel petViewModel) {
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
              isFromFriend: true,
            ),
          ).animateOnPageLoad(animationsMap['foodCardOnPageLoadAnimation2']!),
        ],
      ),
    );
  }

  Future<void> fetchUserDetails(userId) async {

    final userVM = Provider.of<RequestViewModel>(context, listen: false);
    final fetchUser = await userVM.fetchOwnerDetails(userId as String);

    final petVM = Provider.of<FriendsViewModel>(context, listen: false);
    petVM.fetchMultiplePets(widget.userId);

    setState(() {
      username = fetchUser!.username;
      email = fetchUser!.email;
      phone = fetchUser!.phone;
      referenceCode = fetchUser!.referenceCode;
      friendId = fetchUser!.userId;
      _model.isLoading = false;
      print('model is loading ??' + _model.isLoading.toString());
    });
    
  }

}
