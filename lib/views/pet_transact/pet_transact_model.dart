import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'pet_transact_widget.dart' show PetTransactWidget;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:paw_r_app/models/request.dart';
import 'package:paw_r_app/models/pet.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:paw_r_app/view_models/request_view_model.dart';

class PetTransactModel extends FlutterFlowModel<PetTransactWidget> {
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

  Future<void> sendRequest(BuildContext context, Pet pet) async {
    if (isDateTimeInvalid == true) {
      print('empty date time');
      return;
    }

    if (hasEmptyAssignTasks == true) {
      print('empty tasks');
      return;
    }

    // Get the indexes where the value is true
    List<int> trueIndexes = checkBoxCollect
        .asMap()
        .entries
        .where((entry) => entry.value == true)
        .map((entry) => entry.key)
        .toList();

    // Use those indexes to get the corresponding strings
    result = trueIndexes.map((index) => checkBoxText[index]).toList();
    print(trueIndexes);
    print(result);


    final startDate = DateTime(
      initialDateA.year,
      initialDateA.month,
      initialDateA.day,
      initialTimeA.hour,
      initialTimeA.minute,
    );

    final endDate = DateTime(
      initialDateB.year,
      initialDateB.month,
      initialDateB.day,
      initialTimeB.hour,
      initialDateB.minute,
    );

    final newRequest = Request(
      start_date: startDate.toIso8601String(),
      finish_date: endDate.toIso8601String(),
      status: 'pending',
      rate_type: (isHourlySelected) ? 'hourly' : 'onetime',
      total: (isHourlySelected) ? hourlyRateTotal.toString() : oneTimeValue.toString(),
      instructions: textController.text.trim(),
      duration: difference?.inSeconds,
      tasks: result,
      pet_id: pet.id,
      user_id: Supabase.instance.client.auth.currentUser!.id,
    );

    try {
      await Provider.of<RequestViewModel>(context, listen: false)
          .addRequest(newRequest);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Request Sent!",
          ),
        ),
      );
      Navigator.pop(context);
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error adding request: $error")),
      );
    } finally {
      // do something here
    }
  }
}
