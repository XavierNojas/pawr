import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'user_earnings_widget.dart' show UserEarningsWidget;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:paw_r_app/models/request.dart';
import 'package:paw_r_app/models/pet.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:paw_r_app/view_models/request_view_model.dart';

import 'package:paw_r_app/views/transactions_log_other/transactions_log_other_widget.dart';

class UserEarningsModel extends FlutterFlowModel<UserEarningsWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Checkbox widget.
  bool? checkboxValue1;
  // State field(s) for Checkbox widget.
  bool? checkboxValue2;
  // State field(s) for Checkbox widget.
  bool? checkboxValue3;
  // State field(s) for Checkbox widget.
  bool? checkboxValue4;
  // State field(s) for Checkbox widget.
  bool? checkboxValue5;
  // State field(s) for Checkbox widget.
  bool? checkboxValue6;
  // State field(s) for Checkbox widget.
  bool? checkboxValue7;
  // State field(s) for Checkbox widget.
  bool? checkboxValue8;
  // State field(s) for Checkbox widget.
  bool? checkboxValue9;
  // State field(s) for Checkbox widget.
  bool? checkboxValue10;
  // State field(s) for Checkbox widget.
  bool? checkboxValue11;
  // State field(s) for TextField widget.

  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  DateTime? selectedDateTime;
  TextEditingController? dateTimeController;

  DateTime? initialDate;
  String? initialDateText = 'Select date';
  String? initialTimeText = 'Select time';
  String? initialDateTimeText = null;

  DateTime? finalDate;
  String? finalDateText = 'Select date';
  String? finalTimeText = 'Select time';
  String? finalDateTimeText = null;

  Duration? difference;
  String? differenceText = '0 hours and 0 minutes';

  bool isHourlySelected = true;
  bool isOneTimeSelected = false;
  bool lockHourly = false;

  double hourlyRateTotal = 0.00;
  double hourlyRate = 120.00;

  late DateTime initialDateA;
  late DateTime initialDateB;

  late TimeOfDay initialTimeA;
  late TimeOfDay initialTimeB;

  bool isDateTimeInvalid = false;
  bool hasEmptyAssignTasks = false;

  late List<bool?> checkBoxCollect;
  late List<String?> checkBoxText;
  late List<String?> result;

  double? oneTimeValue = 880;

  @override
  void initState(BuildContext context) {
    checkBoxText = [
      'Health',
      'Give Medication',
      'Check for allergies',
      'Food',
      'Morning meal (9:30 AM)',
      'Evening meal (9:30 AM)',
      'Fresh water',
      'Mood',
      'Morning Walk (30 min)',
      'Afternoon play time',
      'Evening walk (20 min)'
    ];
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  String formatDateTime(String rawDateTime) {
    // Step 1: Parse the String to DateTime
    DateTime parsedDateTime = DateTime.parse(rawDateTime);

    // Step 2: Format it however you want
    // Example format: Apr 26, 2025 - 11:10 PM
    String formatted = DateFormat('d MMM yyyy - h:mm a').format(parsedDateTime.toLocal());

    return formatted;
  }

  String formatDurationFromSeconds(int totalSeconds) {
    final int hours = totalSeconds ~/ 3600;
    final int minutes = (totalSeconds % 3600) ~/ 60;
    final int seconds = totalSeconds % 60;

    final String hoursStr = hours.toString().padLeft(2, '0');
    final String minutesStr = minutes.toString().padLeft(2, '0');
    final String secondsStr = seconds.toString().padLeft(2, '0');

    return '$hoursStr H :$minutesStr m';
  }


  Future<void> acceptRequest(BuildContext context, Request request, String caretakerId) async {
    try {
        await Provider.of<RequestViewModel>(context, listen: false)
            .acceptRequest(request, caretakerId);

        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => TransactionsLogOtherWidget()),
        //   );

        Navigator.pop(context);

      } catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error accepting request: $error")),
        );
      } finally {
        // do something
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Request Accepted!')),
        );
      }
      
      print('request accepted: $request.id');
    }
}
