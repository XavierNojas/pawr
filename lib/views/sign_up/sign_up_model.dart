import 'package:paw_r_app/models/user.dart';

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
import 'sign_up_widget.dart' show SignUpWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:paw_r_app/view_models/pet_view_model.dart';

class SignUpModel extends FlutterFlowModel<SignUpWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for FirstName widget.
  FocusNode? firstNameFocusNode;
  TextEditingController? firstNameTextController;
  String? Function(BuildContext, String?)? firstNameTextControllerValidator;
  // State field(s) for LastName widget.
  FocusNode? lastNameFocusNode;
  TextEditingController? lastNameTextController;
  String? Function(BuildContext, String?)? lastNameTextControllerValidator;
  // State field(s) for Gender widget.
  FocusNode? genderFocusNode;
  TextEditingController? genderTextController;
  String? Function(BuildContext, String?)? genderTextControllerValidator;
  // State field(s) for Age widget.
  FocusNode? ageFocusNode;
  TextEditingController? ageTextController;
  String? Function(BuildContext, String?)? ageTextControllerValidator;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  // State field(s) for password confirm widget.
  FocusNode? passwordConfirmFocusNode;
  TextEditingController? passwordConfirmTextController;
  late bool passwordConfirmVisibility;
  String? Function(BuildContext, String?)?
      passwordConfirmTextControllerValidator;
  // State field(s) for UserType widget.
  String? userTypeValue;
  FormFieldController<String>? userTypeValueController;

  String? Function(String?)? setPassword;
  String? Function(String?)? fetchPassword;

  late bool showUserError;

  String? password;

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
    showUserError = false;

    setPassword(value) {
      password = value;
    }

    fetchPassword() {
      return password;
    }

    emailAddressTextControllerValidator = (context, value) {
      if (value == null || value.trim().isEmpty) {
        return 'Please enter an email';
      }
      final regex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
      if (!regex.hasMatch(value.trim())) {
        return 'Enter a valid email';
      }
      return null;
    };

    firstNameTextControllerValidator = (context, value) {
      if (value == null || value.trim().isEmpty) {
        return 'Please enter a username';
      }
      return null;
    };

    passwordTextControllerValidator = (context, value) {
      if (value != null) {
        setPassword(value);
      }

      if (value == null || value.trim().isEmpty) {
        return 'Please enter a password';
      }
      return null;
    };

    passwordConfirmTextControllerValidator = (context, value) {
      if (value == null || value.trim().isEmpty) {
        return 'Please confirm the password';
      }
      if (fetchPassword()!.trim() != value) {
        return 'Passwords does not match';
      }
      return null;
    };
  }

  @override
  void dispose() {
    firstNameFocusNode?.dispose();
    firstNameTextController?.dispose();

    lastNameFocusNode?.dispose();
    lastNameTextController?.dispose();

    genderFocusNode?.dispose();
    genderTextController?.dispose();

    ageFocusNode?.dispose();
    ageTextController?.dispose();

    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();

    passwordConfirmFocusNode?.dispose();
    passwordConfirmTextController?.dispose();

    userTypeValueController?.dispose();
  }

  Future<void> registerUser(
    BuildContext context, GlobalKey<FormState> formKey) async {

    final password = passwordTextController.text.trim();
    final email = emailAddressTextController.text.trim();
    final confirmPassword = passwordTextController.text.trim();
    final username = firstNameTextController.text.trim();

    if (!formKey.currentState!.validate()) return;

    // Registration mode: ensure passwords match.
    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Passwords do not match.")),
      );
      return;
    }
    if (userTypeValue == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Undefined user type.")),
      );
      return;
    }
    try {
      final response = await Supabase.instance.client.auth.signUp(
        email: email,
        password: password,
      );
      if (response.user != null) {
        // add username and usertype to a new table

        final user_id = (response.user!.id).toString();

        final newUser = UserDetails(
          username: username,
          userType: userTypeValue ?? 'null',
          userId: user_id,
        );
        
        try {
          await Provider.of<PetViewModel>(context, listen: false)
              .addUser(newUser);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                "Registration Complete!",
              ),
            ),
          );
          Navigator.pushReplacementNamed(context, '/signIn');
        } catch (error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Error adding contact: $error")),
          );
        } finally {
          // do something here
        }

        return;

      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Registration failed.")),
        );
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Registration error: $error")),
      );
    } finally {
      // do something
    }
  }
}
