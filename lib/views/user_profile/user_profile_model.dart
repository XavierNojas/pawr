import 'package:supabase_flutter/supabase_flutter.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'user_profile_widget.dart' show UserProfileWidget;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UserProfileModel extends FlutterFlowModel<UserProfileWidget> {

  late bool isLoading;

  @override
  void initState(BuildContext context) {
    isLoading = false;
  }

  @override
  void dispose() {}

    Future<void> logout(BuildContext context) async {
    try {
      await Supabase.instance.client.auth.signOut();
      Navigator.pushReplacementNamed(context, '/signIn');
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Sign out error: $error")),
      );
    }
  }
  
}
