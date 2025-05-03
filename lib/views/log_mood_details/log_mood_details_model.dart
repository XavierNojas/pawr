import '/components/food_card_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import 'log_mood_details_widget.dart' show LogMoodDetailsWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:paw_r_app/models/foodLog.dart';

import 'package:paw_r_app/view_models/pet_view_model.dart';

import 'package:intl/intl.dart';

class LogMoodDetailsModel extends FlutterFlowModel<LogMoodDetailsWidget> {
  ///  State fields for stateful widgets in this page.

  @override
  void initState(BuildContext context) {
    // foodCardModel1 = createModel(context, () => FoodCardModel());
    // foodCardModel2 = createModel(context, () => FoodCardModel());
    // foodCardModel3 = createModel(context, () => FoodCardModel());
    // foodCardModel4 = createModel(context, () => FoodCardModel());
  }

  @override
  void dispose() {

    // foodCardModel1.dispose();
    // foodCardModel2.dispose();
    // foodCardModel3.dispose();
    // foodCardModel4.dispose();
  }



  String formatDateTime(String rawDateTime) {
    // Step 1: Parse the String to DateTime
    DateTime parsedDateTime = DateTime.parse(rawDateTime);
    // Step 2: Format it however you want
    // Example format: Apr 26, 2025 - 11:10 PM
    String formatted = DateFormat('d MMM yyyy - h:mm a').format(parsedDateTime.toLocal());

    return formatted;
  }

}
