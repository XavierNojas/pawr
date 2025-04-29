import 'package:paw_r_app/views/home/home_widget.dart';
import '../../view_models/navigation_view_model.dart';
import '../../views/screen_navigator.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:intl/intl.dart';
import 'new_reminder_model.dart';
import 'package:collection/collection.dart'; // Import collection package
export 'new_reminder_model.dart';

/// A StatefulWidget for creating new reminders.
class NewReminderWidget extends StatefulWidget {
  /// The route name for navigation.
  static const String routeName = 'NewReminder';

  /// The route path for navigation.
  static const String routePath = '/newReminder';

  /// Creates the state for this widget.
  const NewReminderWidget({super.key});

  @override
  State<NewReminderWidget> createState() => _NewReminderWidgetState();
}

class _NewReminderWidgetState extends State<NewReminderWidget> {
  late NewReminderModel _model;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Selected values
  String _selectedType = 'Mood';
  String _selectedFrequency = 'Daily';
  DateTime _selectedDateTime = DateTime.now();
  String? _selectedPetName; // Variable to store the selected pet's name

  // Supabase client
  final SupabaseClient _supabase = Supabase.instance.client;

  // Pet data
  List<Map<String, dynamic>> _pets = [];
  bool _isLoadingPets = true;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewReminderModel());
    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();
    _model.switchValue = true;

    // Fetch pets when the widget initializes
    _fetchPetsForUser();
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  /// Fetches pets owned by the current user from Supabase.
  Future<void> _fetchPetsForUser() async {
    final user = _supabase.auth.currentUser;
    if (user == null) {
      // Handle case where user is not logged in
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please log in to see your pets.')),
        );
      }
      setState(() {
        _isLoadingPets = false;
        _pets = [];
      });
      return;
    }

    try {
      final response = await _supabase
          .from('pets')
          .select('id, name') // Select only necessary columns
          .eq('user_id', user.id);

      if (mounted) {
        setState(() {
          _pets = List<Map<String, dynamic>>.from(response);
          _isLoadingPets = false;
          // Optionally, pre-select the first pet if the list is not empty
          if (_pets.isNotEmpty) {
            _selectedPetName = _pets.first['name'];
          } else {
            _selectedPetName = null;
          }
        });
      }
    } catch (e) {
      debugPrint('Error fetching pets: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error loading pets: $e')),
        );
      }
      if (mounted) {
        setState(() {
          _isLoadingPets = false;
          _pets = [];
          _selectedPetName = null;
        });
      }
    }
  }

  /// Saves the reminder to the Supabase database.
  Future<void> _saveReminder() async {
    if (_model.textController1.text.isEmpty) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please enter reminder details')),
        );
      }
      return;
    }
    if (_selectedPetName == null) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select a pet')),
        );
      }
      return;
    }

    try {
      final formattedTime =
          DateFormat('yyyy-MM-dd HH:mm:ss').format(_selectedDateTime);

      await _supabase.from('reminders').insert({
        'type': _selectedType,
        'details': _model.textController1.text,
        'frequency': _selectedFrequency,
        'time': formattedTime,
        'pname': _selectedPetName, // Include the selected pet name
        'user_id': _supabase.auth.currentUser?.id, // Include the user ID
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Reminder created successfully!')),
        );
      }

      // Navigate back to ScreenNavigator and set the selected index to Home
      if (mounted) {
        final navProvider = Provider.of<NavigationProvider>(context,
            listen: false); // Use NavigationProvider
        navProvider.updateIndex(0); // Set the selected index to Home
        Navigator.pop(context); // Go back to the previous screen
      }
    } catch (error) {
      debugPrint('Error creating reminder: $error');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error creating reminder: $error')),
        );
      }
    }
  }

  /// Shows a date and time picker and updates the selected date and time.
  Future<void> _selectDateTime() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDateTime,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      final pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(_selectedDateTime),
      );

      if (pickedTime != null) {
        setState(() {
          _selectedDateTime = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          );
        });
      }
    }
  }

  /// Builds a selectable container widget for Type or Frequency.
  Widget _buildSelectableContainer({
    required String text,
    required bool isSelected,
    required VoidCallback onTap,
    Color? iconColor,
    IconData? icon,
  }) {
    return Expanded(
      // Use Expanded to make containers share space
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity, // Take available width in Expanded
          height: icon != null ? 100.0 : 70.0,
          decoration: BoxDecoration(
            color: isSelected
                ? FlutterFlowTheme.of(context).accent1
                : FlutterFlowTheme.of(context).primaryBackground,
            borderRadius: BorderRadius.circular(12.0),
            border: isSelected
                ? Border.all(
                    color: FlutterFlowTheme.of(context).primary,
                    width: 2.0,
                  )
                : null,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0), // Reduced padding slightly
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null)
                  Padding(
                    padding: const EdgeInsetsDirectional.only(bottom: 8.0),
                    child: icon.toString().contains('FontAwesomeIcons')
                        ? FaIcon(
                            icon,
                            color: iconColor ?? const Color(0xFF4693FF),
                            size: 32.0,
                          )
                        : Icon(
                            icon,
                            color: iconColor ?? const Color(0xFF4693FF),
                            size: 32.0,
                          ),
                  ),
                Text(
                  text,
                  textAlign: TextAlign.center, // Center text
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Manrope',
                        color: isSelected
                            ? FlutterFlowTheme.of(context).primary
                            : FlutterFlowTheme.of(context).secondaryText,
                        fontSize: 12.0,
                        letterSpacing: 0.0,
                        fontWeight:
                            isSelected ? FontWeight.w600 : FontWeight.w500,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Builds a section with a title and content.
  Widget _buildSection({required String title, required Widget content}) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(
          0.0, 16.0, 0.0, 0.0), // Adjusted padding
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: FlutterFlowTheme.of(context).titleMedium.override(
                      fontFamily: 'Manrope',
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(
                  height: 16.0), // Add space between title and content
              content,
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final formattedDateTime =
        DateFormat('MMM d, yyyy - h:mm a').format(_selectedDateTime);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 20.0,
            borderWidth: 1.0,
            buttonSize: 40.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24.0,
            ),
            onPressed: () {
              if (mounted) {
                // Use pop to go back if this screen was pushed
                Navigator.pop(context);
                // Or if you intended to always go to a new instance of HomeWidget:
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const HomeWidget()),
                // );
              }
            },
          ),
          title: Text(
            'Create Reminder',
            style: FlutterFlowTheme.of(context).titleMedium.override(
                  fontFamily: 'Manrope',
                  fontSize: 18.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                ),
          ),
          actions: [
            Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              child: FFButtonWidget(
                onPressed: _saveReminder,
                text: 'Save',
                options: FFButtonOptions(
                  height: 5.0,
                  padding: const EdgeInsets.all(8.0),
                  iconPadding: EdgeInsetsDirectional.zero,
                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Manrope',
                        color: FlutterFlowTheme.of(context).primary,
                        fontSize: 14.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                      ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding:
                const EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Align sections to the start
                children: [
                  _buildSection(
                    title: 'Select Pet',
                    content: _isLoadingPets
                        ? const Center(child: CircularProgressIndicator())
                        : _pets.isEmpty
                            ? Text(
                                'No pets found. Add a pet first?',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Manrope',
                                      letterSpacing: 0.0,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                    ),
                              )
                            : DropdownButtonFormField<String>(
                                value: _selectedPetName,
                                hint: Text(
                                  _pets.isEmpty
                                      ? 'No pets available'
                                      : 'Select a pet',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Manrope',
                                        letterSpacing: 0.0,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                      ),
                                ),
                                items: _pets.map((pet) {
                                  return DropdownMenuItem<String>(
                                    value: pet['name'],
                                    child: Text(
                                      pet['name'],
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Manrope',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _selectedPetName = newValue;
                                  });
                                },
                                decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 12.0,
                                      vertical: 12.0), // Adjust padding
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                ),
                                validator: (value) => value == null
                                    ? 'Please select a pet'
                                    : null,
                              ),
                  ),
                  _buildSection(
                    title: 'Reminder Type',
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildSelectableContainer(
                          text: 'Mood',
                          isSelected: _selectedType == 'Mood',
                          onTap: () => setState(() => _selectedType = 'Mood'),
                          iconColor: const Color(0xFF4693FF),
                          icon: FontAwesomeIcons.solidSmileBeam,
                        ),
                        const SizedBox(width: 12.0), // Add separation
                        _buildSelectableContainer(
                          text: 'Food',
                          isSelected: _selectedType == 'Food',
                          onTap: () => setState(() => _selectedType = 'Food'),
                          iconColor: const Color(0xFFFF7A4C),
                          icon: FontAwesomeIcons.bone,
                        ),
                        const SizedBox(width: 12.0), // Add separation
                        _buildSelectableContainer(
                          text: 'Activity',
                          isSelected: _selectedType == 'Activity',
                          onTap: () =>
                              setState(() => _selectedType = 'Activity'),
                          iconColor: const Color(0xFF37CC49),
                          icon: Icons.directions_run,
                        ),
                      ],
                    ),
                  ),
                  _buildSection(
                    title: 'Details',
                    content: TextFormField(
                      controller: _model.textController1,
                      focusNode: _model.textFieldFocusNode1,
                      autofocus: false,
                      textCapitalization: TextCapitalization.sentences,
                      obscureText: false,
                      decoration: InputDecoration(
                        isDense: false,
                        labelText:
                            'What ${_selectedType.toLowerCase()} do you want to track?',
                        labelStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Manrope',
                                  letterSpacing: 0.0,
                                ),
                        hintStyle: FlutterFlowTheme.of(context)
                            .bodyMedium
                            .override(
                              fontFamily: 'Manrope',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              letterSpacing: 0.0,
                            ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primary,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        filled: true,
                        fillColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Manrope',
                            letterSpacing: 0.0,
                          ),
                      validator:
                          _model.textController1Validator.asValidator(context),
                    ),
                  ),
                  _buildSection(
                    title: 'Frequency',
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildSelectableContainer(
                          text: 'Daily',
                          isSelected: _selectedFrequency == 'Daily',
                          onTap: () =>
                              setState(() => _selectedFrequency = 'Daily'),
                        ),
                        const SizedBox(width: 12.0), // Add separation
                        _buildSelectableContainer(
                          text: 'Weekly',
                          isSelected: _selectedFrequency == 'Weekly',
                          onTap: () =>
                              setState(() => _selectedFrequency = 'Weekly'),
                        ),
                        const SizedBox(width: 12.0), // Add separation
                        _buildSelectableContainer(
                          text: 'Monthly',
                          isSelected: _selectedFrequency == 'Monthly',
                          onTap: () =>
                              setState(() => _selectedFrequency = 'Monthly'),
                        ),
                      ],
                    ),
                  ),
                  _buildSection(
                    title: 'Date & Time',
                    content: InkWell(
                      onTap: _selectDateTime,
                      child: Container(
                        width: double.infinity,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context)
                              .primaryBackground, // Changed to primaryBackground for consistency
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            // Add border
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 1.0,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12.0), // Adjusted padding
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                formattedDateTime,
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'Manrope',
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                              Icon(
                                Icons.calendar_today,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 20.0, // Adjusted size
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Align(
                      alignment: AlignmentDirectional.center,
                      child: FFButtonWidget(
                        onPressed: _saveReminder,
                        text: 'Create Reminder',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 50.0,
                          padding: const EdgeInsets.all(8.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Manrope',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    fontSize: 17.0,
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 0.0,
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Builds a section with a title and content. (Kept for structure, but content now includes padding)
  // Widget _buildSection({required String title, required Widget content}) {
  //   return Padding(
  //     padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0), // Adjusted padding
  //     child: Container(
  //       width: double.infinity,
  //       decoration: BoxDecoration(
  //         color: FlutterFlowTheme.of(context).secondaryBackground,
  //         borderRadius: BorderRadius.circular(12.0),
  //       ),
  //       child: Padding(
  //         padding: const EdgeInsets.all(16.0),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Text(
  //               title,
  //               style: FlutterFlowTheme.of(context).titleMedium.override(
  //                     fontFamily: 'Manrope',
  //                     letterSpacing: 0.0,
  //                     fontWeight: FontWeight.w600,
  //                   ),
  //             ),
  //             const SizedBox(height: 16.0), // Add space between title and content
  //             content,
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}

/// Extension method to separate widgets with a SizedBox.
extension SeparatedChildren on List<Widget> {
  List<Widget> separate(SizedBox separator) {
    if (isEmpty) {
      return [];
    }
    return sublist(1).fold(
      [first],
      (result, element) => result..addAll([separator, element]),
    );
  }
}
