import 'package:paw_r_app/models/friends.dart';
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


import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'dart:math';

import 'package:supabase_flutter/supabase_flutter.dart';

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
  String? Function(BuildContext, String?)?passwordConfirmTextControllerValidator;
  // State field(s) for UserType widget.
  String? userTypeValue;
  FormFieldController<String>? userTypeValueController;


  FocusNode? phoneFocusNode;
  TextEditingController? phoneTextController;
  late bool phoneVisibility;
  String? Function(BuildContext, String?)?phoneTextControllerValidator;


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
      if (value.trim().length > 18) {
        return 'username is long';
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

    phoneTextControllerValidator = (context, value) {
      if (value == null || value.trim().isEmpty) {
        return 'Please enter mobile number';
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

    phoneFocusNode?.dispose();
    phoneTextController?.dispose();
  }


  String generateFriendlyRefCode({
  required String user_id,
  required String mobile,
  required String email,
}) {
  // Clean and extract parts
  final shortUserId = user_id.replaceAll('-', '').substring(0, 8);
  final shortMobile = mobile.replaceAll(RegExp(r'\D'), '').substring(mobile.length - 4);
  final shortEmail = email.split('@').first.substring(0, 3);

  final rawString = '$shortUserId$shortMobile$shortEmail'.toLowerCase();

  // Generate hash
  final hash = sha1.convert(utf8.encode(rawString)).bytes;

  // Convert part of hash into words
  final wordList = ['apple', 'berry', 'cloud', 'delta', 'eagle', 'frost', 'grape', 'hazel', 'iris', 'jade', 'kiwi', 'lemon', 'maple', 'nova', 'oak', 'peach', 'quill', 'raven', 'sage', 'tiger', 'ultra', 'vivid', 'willow', 'xenon', 'yarrow', 'zebra'];

  final index1 = hash[0] % wordList.length;
  final index2 = hash[1] % wordList.length;
  final number = (hash[2] + hash[3]) % 1000;

  return 'REF-${wordList[index1].toUpperCase()}-${wordList[index2].toUpperCase()}-$number';
}


  Future<void> registerUser(
    BuildContext context, GlobalKey<FormState> formKey) async {


    final password = passwordTextController.text.trim();
    final email = emailAddressTextController.text.trim();
    final confirmPassword = passwordTextController.text.trim();
    final username = firstNameTextController.text.trim();
    final phone = phoneTextController.text.trim();
    final supabase = Supabase.instance.client;
    userTypeValue = 'Pet Owner';    

    if (!formKey.currentState!.validate()) return;      

    // Registration mode: ensure passwords match.
    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Passwords do not match.")),
      );
      return;
    }

    try {
      final response = await Supabase.instance.client.auth.signUp(
        email: email,
        password: password,
      );
      if (response.user != null) {
        // add userDetails to a new table

        final user_id = (response.user!.id).toString();
        
        final referenceCode = generateFriendlyRefCode(user_id: user_id, mobile: phone, email: email);

        final newUser = UserDetails(
          username: username,
          userType: userTypeValue ?? 'null',
          userId: user_id,
          email: email,
          phone: phone,
          referenceCode: referenceCode,
        );

        List<String> emptyList = [];

        final newFriendRow = Friends(
          owner_Id: user_id,
          referredFriends: [],
          referredPets: [],
        );

        
        try {
          await Provider.of<PetViewModel>(context, listen: false).addUser(newUser);

          await supabase.from('friends').insert(newFriendRow.toMap());

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                "Registration Complete!",
              ),
            ),
          );
          Navigator.pop(context);
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
