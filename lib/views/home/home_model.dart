import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'home_widget.dart' show HomeWidget;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  bool isLoading = true;
  final supabase = Supabase.instance.client;
  late String greetingMessage;

  @override
  void initState(BuildContext context) {
    supabase.auth.currentUser?.id ?? -1;
  }

void updateGreeting() {
  final hour = DateTime.now().hour;

  if (hour >= 5 && hour < 12) {
    greetingMessage = 'Good morning';
  } else if (hour >= 17 || hour < 5) {
    greetingMessage = 'Good evening';
  } else {
    greetingMessage = 'Good afternoon';
  }
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
