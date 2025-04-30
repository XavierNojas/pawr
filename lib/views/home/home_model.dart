import '/flutter_flow/flutter_flow_util.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:flutter/material.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  @override
  void initState(BuildContext context) {}

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
