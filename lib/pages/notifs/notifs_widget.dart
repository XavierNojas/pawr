// Assuming this is correct
import '/flutter_flow/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// Keep provider if used elsewhere, not essential for this widget's state
import 'notifs_model.dart'; // Import the updated model
// Import for log

class NotifsWidget extends StatefulWidget {
  const NotifsWidget({super.key});

  static String routeName = 'Notifs';
  static String routePath = '/notifs';

  @override
  State<NotifsWidget> createState() => _NotifsWidgetState();
}

class _NotifsWidgetState extends State<NotifsWidget> {
  // Use the simple class instance
  final _model = NotifsModel();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    debugPrint('NotifsWidget: initState called.');
    // Start fetching reminders and update UI when done
    _model.fetchReminders().then((_) {
      debugPrint(
          'NotifsWidget: Initial fetch complete. Items: ${_model.reminders.length}');
      if (mounted) {
        setState(() {}); // Rebuild UI after data is fetched
      }
    }).catchError((error) {
      // Add error handling for the initial fetch
      debugPrint('NotifsWidget: Error during initial fetch: $error');
      if (mounted) {
        // Show an error message on the UI if the initial fetch fails
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Failed to load reminders. Please try again.')),
        );
        setState(() {}); // Still call setState to show empty list/error message
      }
    });
  }

  @override
  void dispose() {
    debugPrint('NotifsWidget: dispose called.');
    // No explicit dispose for the simple model needed here
    super.dispose();
  }

  // Calculate time remaining for display
  String getTimeRemaining(DateTime reminderTime) {
    final now = DateTime.now();
    final difference = reminderTime.difference(now);

    if (difference.isNegative) {
      // Using total minutes to avoid complex date comparisons for "today"
      if (difference.inMinutes.abs() > 24 * 60) {
        // If more than 24 hours past
        return 'OVERDUE';
      } else {
        // Due today, but the time has passed (within last 24 hours)
        return 'DUE TODAY';
      }
    } else if (difference.inDays > 0) {
      return '${difference.inDays} DAYS LEFT';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} HOURS LEFT';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} MINS LEFT';
    } else {
      return 'DUE SOON'; // For differences less than a minute but not negative
    }
  }

  // Get appropriate icon based on reminder type
  IconData getIconForType(String type) {
    switch (type.toLowerCase()) {
      case 'activity':
        return Icons.directions_walk_rounded;
      case 'food':
        return FontAwesomeIcons.bone;
      case 'medicine':
        return Icons.medication_outlined;
      case 'grooming':
        return FontAwesomeIcons.soap;
      case 'vet visit':
        return Icons.local_hospital_outlined;
      case 'play':
        return Icons.sports_baseball_rounded;
      case 'mood':
        return FontAwesomeIcons.solidSmileBeam;
      default:
        return Icons.event_note;
    }
  }

  // Get status color based on time remaining and completion status
  Color getStatusColor(
      String timeRemaining, bool isCompleted, BuildContext context) {
    if (isCompleted) {
      return FlutterFlowTheme.of(context).secondaryText; // Grey for completed
    } else if (timeRemaining.contains('OVERDUE') ||
        timeRemaining.contains('DUE TODAY')) {
      return Colors.red;
    } else if (timeRemaining.contains('DAYS')) {
      return FlutterFlowTheme.of(context)
          .primary; // Use primary color for green
    } else if (timeRemaining.contains('HOURS')) {
      return Colors.orange;
    } else {
      // DUE SOON or MINS LEFT
      return Colors.orange.shade700; // A bit darker orange for closer times
    }
  }

  // Refresh reminders and rebuild the UI (used for pull-to-refresh or initial load)
  Future<void> _refreshReminders() async {
    debugPrint('NotifsWidget: _refreshReminders called.');
    await _model.fetchReminders(); // Fetch latest data
    if (mounted) {
      setState(() {}); // Rebuild UI
    }
  }

  @override
  Widget build(BuildContext context) {
    // Use a Consumer if you were using ChangeNotifier, but since we are
    // using a simple class and setState, no Consumer is needed here.

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(65.0), // Use const Size
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            automaticallyImplyLeading: false,
            leading: Align(
              alignment:
                  const AlignmentDirectional(0.0, 0.0), // Use const Align
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(
                    10.0, 0.0, 0.0, 0.0), // Use const EdgeInsets
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/pawr_green.png', // Ensure this asset path is correct
                    width:
                        500.0, // These dimensions seem excessive for an app bar logo
                    height: 20.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            title: Align(
              alignment:
                  const AlignmentDirectional(0.0, 0.0), // Use const Align
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(
                    0.0, 10.0, 0.0, 0.0), // Use const EdgeInsets
                child: Text(
                  'Notifications',
                  textAlign: TextAlign.start,
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Manrope',
                        letterSpacing: 0.0,
                      ),
                ),
              ),
            ),
            actions: const [], // Use const
            centerTitle: false,
            elevation: 0.0,
          ),
        ),
        body: _model.isLoading &&
                _model.reminders
                    .isEmpty // Show loading only on initial load if list is empty
            ? const Center(child: CircularProgressIndicator())
            : (_model.reminders
                    .isEmpty // Show message if list is empty AFTER loading
                ? Center(
                    child: Text(
                      'No reminders yet!',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Manrope',
                            letterSpacing: 0.0,
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                    ),
                  )
                : RefreshIndicator(
                    // Enable pull-to-refresh
                    onRefresh: _refreshReminders,
                    child: ListView.builder(
                      // Add AlwaysScrollableScrollPhysics to allow pull-to-refresh even if items don't fill the screen
                      physics: const AlwaysScrollableScrollPhysics(),
                      padding: const EdgeInsets.fromLTRB(0, 4.0, 0, 44.0),
                      itemCount: _model.reminders.length,
                      itemBuilder: (context, index) {
                        // *** id is defined here within the itemBuilder scope ***
                        final reminder = _model.reminders[index];
                        // Safely parse the time, handle potential errors
                        DateTime reminderTime;
                        try {
                          reminderTime = DateTime.parse(reminder['time']);
                        } catch (e) {
                          debugPrint(
                              'Error parsing reminder time for reminder ${reminder['id']}: $e');
                          // Skip this reminder or show an error item
                          return const SizedBox.shrink(); // Skip invalid item
                        }

                        // Define id here, converted to String for comparison and Key
                        final String id = reminder['id'].toString();

                        final String timeLeft = getTimeRemaining(reminderTime);
                        final String type = reminder['type'] ?? 'Activity';
                        final String details =
                            reminder['details'] ?? 'No details provided.';
                        // Safely access the pet name assuming 'pname' column exists
                        final String petName = reminder['pname'] ?? 'No Pet';
                        final bool isCompleted = reminder['status'] == 1;
                        final Color statusColor =
                            getStatusColor(timeLeft, isCompleted, context);

                        return Dismissible(
                          key: Key(
                              id), // Use the defined id here (which is a String)
                          direction: DismissDirection.endToStart,
                          background: Container(
                            color: Colors.red,
                            alignment: AlignmentDirectional.centerEnd,
                            padding:
                                const EdgeInsetsDirectional.only(end: 20.0),
                            child: const Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ),
                          // *** onDismissed is defined within the itemBuilder scope, accessing the id defined above ***
                          onDismissed: (direction) async {
                            // Optimistically remove the item from the list
                            final removedReminder = Map<String, dynamic>.from(
                                _model.reminders[index]); // Create a copy
                            final removedIndex =
                                index; // Store index to potentially re-insert
                            setState(() {
                              _model.reminders.removeAt(index);
                            });

                            // Delete from Supabase
                            try {
                              // *** The 'id' variable from the itemBuilder scope is used here ***
                              await _model.deleteReminder(id);
                              // Show confirmation message only on success
                              if (mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                          '${type.toUpperCase()} reminder for $petName deleted')),
                                );
                              }
                            } catch (e) {
                              debugPrint(
                                  'Failed to delete reminder from DB: $e');
                              // Re-insert the reminder if deletion failed
                              if (mounted) {
                                setState(() {
                                  // Ensure we insert at the correct index and use the copied data
                                  _model.reminders
                                      .insert(removedIndex, removedReminder);
                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'Failed to delete reminder. Please try again.')),
                                );
                              }
                            }
                            // No need for a full refresh here as item was removed locally
                            // and order isn't affected by deletion (only status changes affect order)
                          },
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 8.0),
                            child: Opacity(
                              opacity: isCompleted ? 0.6 : 1.0,
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: isCompleted
                                      ? FlutterFlowTheme.of(context).alternate
                                      : FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                  boxShadow: const [
                                    // Use const
                                    BoxShadow(
                                      blurRadius: 3.0,
                                      color: Color(0x33000000),
                                      offset: Offset(0.0, 1.0),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 1.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width:
                                            40.0, // Slightly larger icon container
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                          color: isCompleted
                                              ? FlutterFlowTheme.of(context)
                                                  .secondaryBackground
                                              : statusColor.withOpacity(0.2),
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: isCompleted
                                                ? FlutterFlowTheme.of(context)
                                                    .secondaryText
                                                : statusColor,
                                            width: 2.0,
                                          ),
                                        ),
                                        child: Align(
                                          alignment: const AlignmentDirectional(
                                              0.0, 0.0), // Use const
                                          child: Icon(
                                            getIconForType(type),
                                            color: isCompleted
                                                ? FlutterFlowTheme.of(context)
                                                    .secondaryText
                                                : statusColor,
                                            size: 20.0, // Adjusted icon size
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(12.0, 0.0, 4.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              // Display Pet Name
                                              Text(
                                                petName,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Manrope',
                                                      color: isCompleted
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      decoration: isCompleted
                                                          ? TextDecoration
                                                              .lineThrough
                                                          : TextDecoration.none,
                                                    ),
                                              ),
                                              // Display Time Remaining and Type
                                              Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        0, 4.0, 0, 4.0),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start, // Align row items
                                                  children: [
                                                    Text(
                                                      '$timeLeft ',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodySmall
                                                          .override(
                                                            fontFamily:
                                                                'Manrope',
                                                            color: isCompleted
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText
                                                                : statusColor,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            decoration: isCompleted
                                                                ? TextDecoration
                                                                    .lineThrough
                                                                : TextDecoration
                                                                    .none,
                                                          ),
                                                    ),
                                                    Expanded(
                                                      // Allow type text to take remaining space
                                                      child: Text(
                                                        '(${type.toUpperCase()})',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Manrope',
                                                                  color: isCompleted
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText
                                                                      : statusColor,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  decoration: isCompleted
                                                                      ? TextDecoration
                                                                          .lineThrough
                                                                      : TextDecoration
                                                                          .none,
                                                                ),
                                                        overflow: TextOverflow
                                                            .ellipsis, // Prevent overflow
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              // Display Details
                                              Text(
                                                details,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Manrope',
                                                      color: isCompleted
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                      letterSpacing: 0.0,
                                                      decoration: isCompleted
                                                          ? TextDecoration
                                                              .lineThrough
                                                          : TextDecoration.none,
                                                    ),
                                              ),
                                              // Display Frequency (Optional, re-added if needed)
                                              // Padding(
                                              //   padding:
                                              //       const EdgeInsetsDirectional.fromSTEB(
                                              //           0.0, 8.0, 0.0, 4.0),
                                              //   child: Text(
                                              //     reminder['frequency'] ?? 'Daily',
                                              //     style: FlutterFlowTheme.of(context)
                                              //         .labelSmall
                                              //         .override(
                                              //           fontFamily: 'Manrope',
                                              //           color: FlutterFlowTheme.of(
                                              //                   context)
                                              //               .secondaryText,
                                              //           letterSpacing: 0.0,
                                              //         ),
                                              //   ),
                                              // ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      // Checkbox for completion status
                                      Theme(
                                        data: ThemeData(
                                          checkboxTheme: CheckboxThemeData(
                                            visualDensity:
                                                VisualDensity.compact,
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                          ),
                                          unselectedWidgetColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                        ),
                                        child: Checkbox(
                                          value: isCompleted,
                                          activeColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          onChanged: (bool? value) async {
                                            if (!mounted) {
                                              return; // Check if mounted
                                            }

                                            final bool newValue =
                                                value ?? false;
                                            final int newStatus =
                                                newValue ? 1 : 0;

                                            // Find the index of the reminder to update
                                            // This now correctly compares string IDs
                                            final int reminderIndex = _model
                                                .reminders
                                                .indexWhere((r) =>
                                                    r['id'].toString() == id);

                                            if (reminderIndex != -1) {
                                              // Optimistically update local state
                                              final previousStatus = _model
                                                      .reminders[reminderIndex]
                                                  ['status'];

                                              // Only perform update if status is actually changing
                                              if (previousStatus != newStatus) {
                                                setState(() {
                                                  _model.reminders[
                                                          reminderIndex]
                                                      ['status'] = newStatus;
                                                });

                                                // Update in Supabase
                                                try {
                                                  await _model.updateReminderStatus(
                                                      id,
                                                      newValue); // Use the id here
                                                  debugPrint(
                                                      'NotifsWidget: UI status updated and DB update successful.');

                                                  // *** REMOVED: Do NOT refresh the list here to prevent reordering ***
                                                  // await _refreshReminders();
                                                } catch (e) {
                                                  debugPrint(
                                                      'NotifsWidget: DB update failed for reminder $id: $e'); // Use the id here
                                                  // Revert local state if DB update fails
                                                  if (mounted) {
                                                    setState(() {
                                                      _model.reminders[
                                                                  reminderIndex]
                                                              ['status'] =
                                                          previousStatus;
                                                    });
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      const SnackBar(
                                                          content: Text(
                                                              'Failed to update reminder status. Please try again.')),
                                                    );
                                                  }
                                                }
                                              } else {
                                                debugPrint(
                                                    'NotifsWidget: Status is already $newStatus, skipping DB update.');
                                              }
                                            } else {
                                              debugPrint(
                                                  'NotifsWidget: Reminder with ID $id not found in local list.'); // Use the id here
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )),
      ),
    );
  }
}
