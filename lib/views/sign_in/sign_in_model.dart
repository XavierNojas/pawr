import '/auth/supabase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import '/index.dart';
import 'sign_in_widget.dart' show SignInWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

enum AuthMode { signIn, register }

class SignInModel extends FlutterFlowModel<SignInWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;

  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  final AuthMode _authMode = AuthMode.signIn;

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
  }

  @override
  void dispose() {
    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();
  }

  Future<void> verifyUser(
      BuildContext context, GlobalKey<FormState> formKey) async {
    final email = emailAddressTextController.text;
    final password = passwordTextController.text;

    if (!formKey.currentState!.validate()) return;

    if (_authMode == AuthMode.signIn) {
      // Sign in using Supabase's signInWithPassword.
      try {
        final response = await Supabase.instance.client.auth.signInWithPassword(
          email: email.trim(),
          password: password.trim(),
        );
        if (response.session != null) {
          // Sign in successful, navigate to the phonebook screen.
          Navigator.pushReplacementNamed(context, '/homeNav');
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Sign in failed. Please try again.')),
          );
        }
      } catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Sign in error: $error')),
        );
      } finally {}
    }
  }
}
