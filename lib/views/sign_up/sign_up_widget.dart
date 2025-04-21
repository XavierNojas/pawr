import '/auth/supabase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:math';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'sign_up_model.dart';
export 'sign_up_model.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:paw_r_app/models/user.dart';
import 'package:paw_r_app/models/pet.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({super.key});

  static String routeName = 'SignUp';
  static String routePath = '/signUp';

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget>
    with TickerProviderStateMixin {
  late SignUpModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SignUpModel());

    _model.firstNameTextController ??= TextEditingController();
    _model.firstNameFocusNode ??= FocusNode();

    // _model.lastNameTextController ??= TextEditingController();
    // _model.lastNameFocusNode ??= FocusNode();

    // _model.genderTextController ??= TextEditingController();
    // _model.genderFocusNode ??= FocusNode();

    // _model.ageTextController ??= TextEditingController();
    // _model.ageFocusNode ??= FocusNode();

    _model.emailAddressTextController ??= TextEditingController();
    _model.emailAddressFocusNode ??= FocusNode();

    _model.passwordTextController ??= TextEditingController();
    _model.passwordFocusNode ??= FocusNode();

    _model.passwordConfirmTextController ??= TextEditingController();
    _model.passwordConfirmFocusNode ??= FocusNode();

    _model.userTypeValueController ??= FormFieldController<String>(null);
    _model.userTypeValue;

    animationsMap.addAll({
      'textOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 100.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 100.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 100.0.ms,
            duration: 400.0.ms,
            begin: Offset(0.0, 30.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'columnOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 400.0.ms,
            begin: Offset(0.0, 60.0),
            end: Offset(0.0, 0.0),
          ),
          TiltEffect(
            curve: Curves.easeInOut,
            delay: 200.0.ms,
            duration: 400.0.ms,
            begin: Offset(-0.349, 0),
            end: Offset(0, 0),
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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0
        ),
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.infinity,
                height: 300.0,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      FlutterFlowTheme.of(context).primary,
                      Color(0xFF3A7BD5)
                    ],
                    stops: [0.0, 1.0],
                    begin: AlignmentDirectional(1.0, 1.0),
                    end: AlignmentDirectional(-1.0, -1.0),
                  ),
                ),
                child: Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0x00FFFFFF),
                        FlutterFlowTheme.of(context).secondaryBackground
                      ],
                      stops: [0.0, 1.0],
                      begin: AlignmentDirectional(0.0, -1.0),
                      end: AlignmentDirectional(0, 1.0),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/pawr_inverted-removebg-preview.png',
                          width: 200.0,
                          height: 100.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
                        child: Text(
                          'Smarter care for furbabies',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Manrope',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                        child: Text(
                          'Sign Up',
                          style: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
                                fontFamily: 'Manrope',
                                letterSpacing: 0.0,
                              ),
                        ).animateOnPageLoad(
                            animationsMap['textOnPageLoadAnimation']!),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 5.0, 16.0),
                              child: Container(
                                width: double.infinity,
                                child: TextFormField(
                                  controller: _model.firstNameTextController,
                                  focusNode: _model.firstNameFocusNode,
                                  autofocus: true,
                                  autofillHints: [AutofillHints.email],
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Username',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Manrope',
                                          letterSpacing: 0.0,
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Manrope',
                                        letterSpacing: 0.0,
                                      ),
                                  keyboardType: TextInputType.emailAddress,
                                  validator: _model
                                      .firstNameTextControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ),
                          // Removed Last Name Textfield
                          // Expanded(
                          //   child: Padding(
                          //     padding: EdgeInsetsDirectional.fromSTEB(
                          //         5.0, 0.0, 0.0, 16.0),
                          //     child: Container(
                          //       width: double.infinity,
                          //       child: TextFormField(
                          //         controller: _model.lastNameTextController,
                          //         focusNode: _model.lastNameFocusNode,
                          //         autofocus: true,
                          //         autofillHints: [AutofillHints.email],
                          //         obscureText: false,
                          //         decoration: InputDecoration(
                          //           labelText: 'Last Name',
                          //           labelStyle: FlutterFlowTheme.of(context)
                          //               .labelMedium
                          //               .override(
                          //                 fontFamily: 'Manrope',
                          //                 letterSpacing: 0.0,
                          //               ),
                          //           enabledBorder: OutlineInputBorder(
                          //             borderSide: BorderSide(
                          //               color: FlutterFlowTheme.of(context)
                          //                   .alternate,
                          //               width: 2.0,
                          //             ),
                          //             borderRadius: BorderRadius.circular(12.0),
                          //           ),
                          //           focusedBorder: OutlineInputBorder(
                          //             borderSide: BorderSide(
                          //               color:
                          //                   FlutterFlowTheme.of(context).primary,
                          //               width: 2.0,
                          //             ),
                          //             borderRadius: BorderRadius.circular(12.0),
                          //           ),
                          //           errorBorder: OutlineInputBorder(
                          //             borderSide: BorderSide(
                          //               color: FlutterFlowTheme.of(context).error,
                          //               width: 2.0,
                          //             ),
                          //             borderRadius: BorderRadius.circular(12.0),
                          //           ),
                          //           focusedErrorBorder: OutlineInputBorder(
                          //             borderSide: BorderSide(
                          //               color: FlutterFlowTheme.of(context).error,
                          //               width: 2.0,
                          //             ),
                          //             borderRadius: BorderRadius.circular(12.0),
                          //           ),
                          //           filled: true,
                          //           fillColor: FlutterFlowTheme.of(context)
                          //               .secondaryBackground,
                          //           contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                          //         ),
                          //         style: FlutterFlowTheme.of(context)
                          //             .bodyMedium
                          //             .override(
                          //               fontFamily: 'Manrope',
                          //               letterSpacing: 0.0,
                          //             ),
                          //         keyboardType: TextInputType.emailAddress,
                          //         validator: _model
                          //             .lastNameTextControllerValidator
                          //             .asValidator(context),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                      // Removed Gender and Age Textfield
                      // Row(
                      //   mainAxisSize: MainAxisSize.max,
                      //   children: [
                      //     Expanded(
                      //       child: Padding(
                      //         padding: EdgeInsetsDirectional.fromSTEB(
                      //             0.0, 0.0, 5.0, 16.0),
                      //         child: Container(
                      //           width: double.infinity,
                      //           child: TextFormField(
                      //             controller: _model.genderTextController,
                      //             focusNode: _model.genderFocusNode,
                      //             autofocus: true,
                      //             autofillHints: [AutofillHints.email],
                      //             obscureText: false,
                      //             decoration: InputDecoration(
                      //               labelText: 'Gender',
                      //               labelStyle: FlutterFlowTheme.of(context)
                      //                   .labelMedium
                      //                   .override(
                      //                     fontFamily: 'Manrope',
                      //                     letterSpacing: 0.0,
                      //                   ),
                      //               enabledBorder: OutlineInputBorder(
                      //                 borderSide: BorderSide(
                      //                   color: FlutterFlowTheme.of(context)
                      //                       .alternate,
                      //                   width: 2.0,
                      //                 ),
                      //                 borderRadius: BorderRadius.circular(12.0),
                      //               ),
                      //               focusedBorder: OutlineInputBorder(
                      //                 borderSide: BorderSide(
                      //                   color:
                      //                       FlutterFlowTheme.of(context).primary,
                      //                   width: 2.0,
                      //                 ),
                      //                 borderRadius: BorderRadius.circular(12.0),
                      //               ),
                      //               errorBorder: OutlineInputBorder(
                      //                 borderSide: BorderSide(
                      //                   color: FlutterFlowTheme.of(context).error,
                      //                   width: 2.0,
                      //                 ),
                      //                 borderRadius: BorderRadius.circular(12.0),
                      //               ),
                      //               focusedErrorBorder: OutlineInputBorder(
                      //                 borderSide: BorderSide(
                      //                   color: FlutterFlowTheme.of(context).error,
                      //                   width: 2.0,
                      //                 ),
                      //                 borderRadius: BorderRadius.circular(12.0),
                      //               ),
                      //               filled: true,
                      //               fillColor: FlutterFlowTheme.of(context)
                      //                   .secondaryBackground,
                      //               contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                      //             ),
                      //             style: FlutterFlowTheme.of(context)
                      //                 .bodyMedium
                      //                 .override(
                      //                   fontFamily: 'Manrope',
                      //                   letterSpacing: 0.0,
                      //                 ),
                      //             keyboardType: TextInputType.emailAddress,
                      //             validator: _model.genderTextControllerValidator
                      //                 .asValidator(context),
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //     Expanded(
                      //       child: Padding(
                      //         padding: EdgeInsetsDirectional.fromSTEB(
                      //             5.0, 0.0, 0.0, 16.0),
                      //         child: Container(
                      //           width: double.infinity,
                      //           child: TextFormField(
                      //             controller: _model.ageTextController,
                      //             focusNode: _model.ageFocusNode,
                      //             autofocus: true,
                      //             autofillHints: [AutofillHints.email],
                      //             obscureText: false,
                      //             decoration: InputDecoration(
                      //               labelText: 'Age',
                      //               labelStyle: FlutterFlowTheme.of(context)
                      //                   .labelMedium
                      //                   .override(
                      //                     fontFamily: 'Manrope',
                      //                     letterSpacing: 0.0,
                      //                   ),
                      //               enabledBorder: OutlineInputBorder(
                      //                 borderSide: BorderSide(
                      //                   color: FlutterFlowTheme.of(context)
                      //                       .alternate,
                      //                   width: 2.0,
                      //                 ),
                      //                 borderRadius: BorderRadius.circular(12.0),
                      //               ),
                      //               focusedBorder: OutlineInputBorder(
                      //                 borderSide: BorderSide(
                      //                   color:
                      //                       FlutterFlowTheme.of(context).primary,
                      //                   width: 2.0,
                      //                 ),
                      //                 borderRadius: BorderRadius.circular(12.0),
                      //               ),
                      //               errorBorder: OutlineInputBorder(
                      //                 borderSide: BorderSide(
                      //                   color: FlutterFlowTheme.of(context).error,
                      //                   width: 2.0,
                      //                 ),
                      //                 borderRadius: BorderRadius.circular(12.0),
                      //               ),
                      //               focusedErrorBorder: OutlineInputBorder(
                      //                 borderSide: BorderSide(
                      //                   color: FlutterFlowTheme.of(context).error,
                      //                   width: 2.0,
                      //                 ),
                      //                 borderRadius: BorderRadius.circular(12.0),
                      //               ),
                      //               filled: true,
                      //               fillColor: FlutterFlowTheme.of(context)
                      //                   .secondaryBackground,
                      //               contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                      //             ),
                      //             style: FlutterFlowTheme.of(context)
                      //                 .bodyMedium
                      //                 .override(
                      //                   fontFamily: 'Manrope',
                      //                   letterSpacing: 0.0,
                      //                 ),
                      //             keyboardType: TextInputType.emailAddress,
                      //             validator: _model.ageTextControllerValidator
                      //                 .asValidator(context),
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                        child: Container(
                          width: double.infinity,
                          child: TextFormField(
                            controller: _model.emailAddressTextController,
                            focusNode: _model.emailAddressFocusNode,
                            autofocus: true,
                            autofillHints: [AutofillHints.email],
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Manrope',
                                    letterSpacing: 0.0,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Manrope',
                                  letterSpacing: 0.0,
                                ),
                            keyboardType: TextInputType.emailAddress,
                            validator: _model
                                .emailAddressTextControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                        child: Container(
                          width: double.infinity,
                          child: TextFormField(
                            controller: _model.passwordTextController,
                            focusNode: _model.passwordFocusNode,
                            autofocus: false,
                            autofillHints: [AutofillHints.password],
                            obscureText: !_model.passwordVisibility,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Manrope',
                                    letterSpacing: 0.0,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                              // suffixIcon: InkWell(
                              //   onTap: () => safeSetState(
                              //     () => _model.passwordVisibility =
                              //         !_model.passwordVisibility,
                              //   ),
                              //   focusNode: FocusNode(skipTraversal: true),
                              //   child: Icon(
                              //     _model.passwordVisibility
                              //         ? Icons.visibility_outlined
                              //         : Icons.visibility_off_outlined,
                              //     color: FlutterFlowTheme.of(context)
                              //         .secondaryText,
                              //     size: 24.0,
                              //   ),
                              // ),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Manrope',
                                  letterSpacing: 0.0,
                                ),
                            validator: _model.passwordTextControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                        child: Container(
                          width: double.infinity,
                          child: TextFormField(
                            controller: _model.passwordConfirmTextController,
                            focusNode: _model.passwordConfirmFocusNode,
                            autofocus: false,
                            autofillHints: const [AutofillHints.password],
                            obscureText: !_model.passwordVisibility,
                            decoration: InputDecoration(
                              labelText: 'Confirm Password',
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Manrope',
                                    letterSpacing: 0.0,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                              suffixIcon: InkWell(
                                onTap: () => safeSetState(
                                  () => _model.passwordVisibility =
                                      !_model.passwordVisibility,
                                ),
                                focusNode: FocusNode(skipTraversal: true),
                                child: Icon(
                                  _model.passwordVisibility
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Manrope',
                                  letterSpacing: 0.0,
                                ),
                            validator: _model
                                .passwordConfirmTextControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 25.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FlutterFlowDropDown<String>(
                                controller: _model.userTypeValueController,
                                options: const ['Pet Owner', 'Care Taker'],
                                onChanged: (val) => safeSetState(
                                    () => _model.userTypeValue = val),
                                width: 360.0,
                                height: 50.0,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Manrope',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 12.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                hintText: 'Select User Type',
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: FlutterFlowTheme.of(context).secondary,
                                  size: 24.0,
                                ),
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                elevation: 2.0,
                                borderColor: _model.showUserError
                                    ? Colors.red
                                    : FlutterFlowTheme.of(context).primary,
                                borderWidth: 1.5,
                                borderRadius: 8.0,
                                margin: const EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 12.0, 0.0),
                                hidesUnderline: true,
                                isOverButton: false,
                                isSearchable: false,
                                isMultiSelect: false,
                              ),

                              // Helper text
                              Padding(
                                padding: _model.showUserError 
                                ? const EdgeInsets.only(left: 12.0, top: 4.0) 
                                : const EdgeInsets.only(left: 0.0, top: 4.0),
                                child: Text(
                                  _model.showUserError 
                                  ? 'Choose a user type'
                                  : '',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                              
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 16.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              // custom validator for flutterflow dropdown
                              if (_model.userTypeValue == null ||
                                  _model.userTypeValue!.isEmpty) {
                                setState(() => _model.showUserError = true);
                              } else {
                                setState(() => _model.showUserError = false);
                              }
                              // call function to register new user and validate form
                              await _model.registerUser(context, formKey);
                            },
                            text: 'Sign Up',
                            options: FFButtonOptions(
                              width: 230.0,
                              height: 52.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Manrope',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 3.0,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                        ),
                      ),
                      // Align(
                      //   alignment: const AlignmentDirectional(0.0, 0.0),
                      //   child: Padding(
                      //     padding: const EdgeInsetsDirectional.fromSTEB(
                      //         0.0, 0.0, 0.0, 8.0),
                      //     child: FFButtonWidget(
                      //       onPressed: () {
                      //         // replace current screen on stack with /signIn
                      //         Navigator.pushReplacementNamed(
                      //             context, '/signIn');
                      //       },
                      //       text: 'Sign In',
                      //       options: FFButtonOptions(
                      //         width: 230.0,
                      //         height: 44.0,
                      //         padding: const EdgeInsetsDirectional.fromSTEB(
                      //             0.0, 0.0, 0.0, 0.0),
                      //         iconPadding: const EdgeInsetsDirectional.fromSTEB(
                      //             0.0, 0.0, 0.0, 0.0),
                      //         color: FlutterFlowTheme.of(context)
                      //             .secondaryBackground,
                      //         textStyle: FlutterFlowTheme.of(context)
                      //             .bodyMedium
                      //             .override(
                      //               fontFamily: 'Manrope',
                      //               letterSpacing: 0.0,
                      //             ),
                      //         elevation: 0.0,
                      //         borderSide: BorderSide(
                      //           color: FlutterFlowTheme.of(context)
                      //               .secondaryBackground,
                      //           width: 2.0,
                      //         ),
                      //         borderRadius: BorderRadius.circular(12.0),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ).animateOnPageLoad(
                      animationsMap['columnOnPageLoadAnimation']!),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


