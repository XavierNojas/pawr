import 'package:paw_r_app/flutter_flow/flutter_flow_icon_button.dart';
import 'package:paw_r_app/views/log_food/log_food_widget.dart';
import 'package:paw_r_app/views/screen_navigator.dart';
import 'package:paw_r_app/views/transactions_log/transactions_log_widget.dart';
import 'package:paw_r_app/views/transactions_log_other/transactions_log_other_widget.dart';
import 'package:paw_r_app/views/transactions_log_other_accepted/transactions_log_other_accepted_widget.dart';
import 'package:paw_r_app/views/user_earnings/user_earnings_widget.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'user_profile_model.dart';
export 'user_profile_model.dart';
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


class UserProfileWidget extends StatefulWidget {
  final String userId;
  const UserProfileWidget({Key? key, required this.userId}) : super(key: key);

  static String routeName = 'UserProfile';
  static String routePath = '/petProfile';

  final Color color = Colors.white;

  @override
  State<UserProfileWidget> createState() => _UserProfileWidgetState();
}

class _UserProfileWidgetState extends State<UserProfileWidget> {
  late UserProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  late String username;
  late String email;
  late String phone;
  late String referenceCode;
  
  late String totalEarnings;
  late String totalDeficit;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserProfileModel());

    setState(() {
      _model.isLoading = true;
      
      
     fetchUserDetails(widget.userId);
    });

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
            Navigator.pop(context);
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
                                              .info,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
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




                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          _model.logout(context);
                        },
                        text: 'Log out',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 50.0,
                          padding: EdgeInsets.all(8.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          color: FlutterFlowTheme.of(context).error,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
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
                                                builder: (context) => UserEarningsWidget(userId: widget.userId))
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
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 30.0, 10.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'My requests',
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
                                                builder: (context) => const TransactionsLogWidget(status: 'accepted', isFromProfile: true)
                                                )
                                              );
                                          },
                                        ),
                                        const SizedBox(width: 8.0),
                                        Text(
                                          'See accepted requests',
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
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 30.0, 10.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Accepted requests',
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
                                                builder: (context) => const TransactionsLogOtherAcceptedWidget(isFromProfile: true))
                                                );
                                          },
                                        ),
                                        const SizedBox(width: 8.0),
                                        Text(
                                          'See accepted requests',
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

                ]),
          ),
        ).animateOnPageLoad(animationsMap['foodCardOnPageLoadAnimation0']!),
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

  Future<void> fetchUserDetails(userId) async {

    final userVM = Provider.of<RequestViewModel>(context, listen: false);
    final fetchUser = await userVM.fetchOwnerDetails(userId as String);

    setState(() {
      username = fetchUser!.username;
      email = fetchUser!.email;
      phone = fetchUser!.phone;
      referenceCode = fetchUser!.referenceCode;
      _model.isLoading = false;
    });
  }

}
