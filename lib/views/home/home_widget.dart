
import 'package:paw_r_app/backend/supabase/database/database.dart';
import 'package:paw_r_app/pages/new_reminder/new_reminder_widget.dart';
import 'package:paw_r_app/pages/notifs/notifs_widget.dart';
import 'package:paw_r_app/views/user_profile/user_profile_widget.dart';

import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  static String routeName = 'Home';
  static String routePath = '/home';

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  List<Map<String, dynamic>> reminders = [];
  List<Map<String, dynamic>> pets = [];
  bool isLoading = true;

  late String username; // Default value


  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    _model.updateGreeting();

    _fetchReminders();
    _fetchPets(); // Fetch pet details
    _fetchUsername(); // Fetch username
    username = '';

    _model.isLoading = true;
  }

  Future<void> _fetchReminders() async {
    setState(() {
      isLoading = true;
    });

    try {
      final user = Supabase.instance.client.auth.currentUser;
      if (user == null) {
        throw Exception('User not logged in');
      }

      final response = await Supabase.instance.client
          .from('reminders')
          .select('*')
          .eq('user_id', user.id)
          .order('time', ascending: true);

      setState(() {
        reminders = List<Map<String, dynamic>>.from(response);
      });
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching reminders: $error')),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _fetchPets() async {
    setState(() {
      isLoading = true;
    });

    try {
      final user = Supabase.instance.client.auth.currentUser;
      if (user == null) {
        throw Exception('User not logged in');
      }

      final response = await Supabase.instance.client
          .from('pets')
          .select('*')
          .eq('user_id', user.id);

      debugPrint(
          'Fetched pets: $response'); // Debug statement to verify response

      setState(() {
        pets = List<Map<String, dynamic>>.from(response);
      });
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching pet details: $error')),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _fetchUsername() async {

  
    try {
      final user = Supabase.instance.client.auth.currentUser;
      if (user == null) {
        throw Exception('User not logged in');
      }

      debugPrint('Logged-in user ID: ${user.id}'); // Debug user ID

      final response = await Supabase.instance.client
          .from('userDetails')
          .select('username')
          .eq('userId', user.id) // Ensure this matches your table structure
          .single();

      debugPrint('Fetched username response: $response'); // Debug response

      setState(() {
        username = response['username'] ?? 'User'; // Fallback to 'User' if null
        _model.isLoading = false;
      });
    } catch (error) {
      debugPrint('Error fetching username: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching username: $error')),
      );
    }
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return (isLoading == true) ? 
    onLoading(context)
    : GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        // appBar: AppBar(
        //   title: const Text('Pawr Home'),
        //   backgroundColor: Colors.transparent,
        //   elevation: 0,
        //   actions: [
        //     IconButton(
        //       color: Colors.red,
        //       icon: const Icon(Icons.logout),
        //       onPressed: () async {
        //         await _model.logout(context);
        //       },
        //     ),
        //   ],
        // ),
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,

body: SafeArea(
  top: true,
  child: SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // No padding for header — full width
        _buildHeaderSection(),
        const SizedBox(height: 20.0),
        _buildHealthOverviewSection(),
        const SizedBox(height: 20.0),

        // Padding for the rest of the content
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 60.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              _buildPetDetailsSection(),
              const SizedBox(height: 20.0),
              _buildTodaysActivitiesSection(),
              const SizedBox(height: 20.0),
              _buildUpcomingSection(),
              const SizedBox(height: 20.0),
              _buildQuickActionsSection(),
            ],
          ),
        ),
      ],
    ),
  ),
),

        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            print('FloatingActionButton pressed ...');
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const NewReminderWidget()));

          },
          backgroundColor: FlutterFlowTheme.of(context).primary,
          elevation: 3.0,
          label: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Icon(
                Icons.add,
                color: Colors.white,
                size: 24.0,
              ),
              Text(
                'New Reminder',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Manrope',
                      color: Colors.white,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ].divide(SizedBox(width: 8.0)),
          ),
        ),
        
      ),
);


  }


  Widget onLoading(BuildContext context) {
  return Scaffold(
    key: scaffoldKey,
    backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
    body: SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // You can swap this out with a Lottie animation for more flair
            Container(
              child: const CircularProgressIndicator(),
            ),
          ],
        ),
      ),
    ),
  );
}

  Widget _buildHeaderSection() {
    return Container(
      width:
          MediaQuery.of(context).size.width, // Ensure it spans the full width
      height: 220.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            FlutterFlowTheme.of(context).primary,
            const Color(0xFF3A7BD5),
          ],
          stops: const [0.0, 1.0],
          begin: const AlignmentDirectional(1.0, 1.0),
          end: const AlignmentDirectional(-1.0, -1.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(20.0, 16.0, 20.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/pawr_inverted-removebg-preview.png',
                    width: 200.0,
                    height: 100.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FlutterFlowIconButton(
                      borderRadius: 20.0,
                      buttonSize: 40.0,
                      fillColor: const Color(0x33FFFFFF),
                      icon: const Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 20.0,
                      ),
                      onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserProfileWidget(userId: Supabase.instance.client.auth.currentUser?.id ?? '-1')));  
                      },
                    ),
                  ].divide(const SizedBox(width: 12.0)),
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${_model.greetingMessage}, $username!', // Use the dynamic username
                        style:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: 'Manrope',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 4.0, 0.0, 0.0),
                        child: Text(
                          'Your pet is looking healthy today.',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Manrope',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                        width: 80.0,
                        height: 80.0,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              'assets/images/no_bg_Xavier_2x2.png',
                            ),
                          ),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 3.0,
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(1.0, 1.0),
                        child: Container(
                          width: 24.0,
                          height: 24.0,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              width: 2.0,
                            ),
                          ),
                          child: const Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 14.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPetDetailsSection() {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (pets.isEmpty) {
      return Center(
        child: Text(
          'No pet details available.',
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Manrope',
                color: Colors.grey,
              ),
        ),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: pets.length,
      itemBuilder: (context, index) {
        final pet = pets[index];
        final String name = pet['name'] ?? 'Unknown';
        final String breed = pet['breed'] ?? 'Unknown';
        final int age = pet['age'] ?? 0;
        final double weight = pet['weight'] ?? 0.0;

        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              boxShadow: const [
                BoxShadow(
                  blurRadius: 10.0,
                  color: Color(0x1A000000),
                  offset: Offset(0.0, 2.0),
                ),
              ],
              borderRadius: BorderRadius.circular(24.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: 80.0,
                    height: 80.0,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                            'assets/images/Urie.jpg'), // Replace with dynamic image if available
                      ),
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.w600,
                                ),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        '$breed • $age years old',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Manrope',
                              color: FlutterFlowTheme.of(context).secondaryText,
                            ),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        'Weight: ${weight.toStringAsFixed(1)} kg',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Manrope',
                              color: FlutterFlowTheme.of(context).secondary,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTodaysActivitiesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Today\'s Activities',
              style: FlutterFlowTheme.of(context).titleMedium.override(
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w600,
                  ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const NotifsWidget(), // Navigate to the Notifs page
                  ),
                );
              },
              child: Text(
                'View All',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Manrope',
                      color: FlutterFlowTheme.of(context).primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16.0),
        isLoading
            ? const Center(child: CircularProgressIndicator())
            : reminders.isEmpty
                ? Center(
                    child: Text(
                      'No activities scheduled for today.',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Manrope',
                            color: Colors.grey,
                          ),
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: reminders.length,
                    itemBuilder: (context, index) {
                      final reminder = reminders[index];
                      final String petName = reminder['pname'] ?? 'No Pet';
                      final String type = reminder['type'] ?? 'General';
                      final String description =
                          reminder['details'] ?? 'No details provided.';
                      final bool isCompleted = reminder['status'] == 1;

                      // Calculate time remaining
                      final DateTime reminderTime =
                          DateTime.parse(reminder['time']);
                      final String timeRemaining =
                          getTimeRemaining(reminderTime);

                      // Get icon and status color
                      final IconData icon = getIconForType(type);
                      final Color statusColor =
                          getStatusColor(timeRemaining, isCompleted, context);

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: Dismissible(
                          key: Key(reminder['id'].toString()),
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
                          onDismissed: (direction) async {
                            // Handle deletion logic here
                            try {
                              await Supabase.instance.client
                                  .from('reminders')
                                  .delete()
                                  .eq('id', reminder['id']);
                              setState(() {
                                reminders.removeAt(index);
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content:
                                      Text('Reminder deleted successfully.'),
                                ),
                              );
                            } catch (error) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Failed to delete reminder.'),
                                ),
                              );
                            }
                          },
                          child: Opacity(
                            opacity: isCompleted ? 0.6 : 1.0,
                            child: Container(
                              decoration: BoxDecoration(
                                color: isCompleted
                                    ? FlutterFlowTheme.of(context).alternate
                                    : FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 4.0,
                                    color: Color(0x1A000000),
                                    offset: Offset(0.0, 2.0),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(16.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 1.0,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 50.0,
                                          height: 50.0,
                                          decoration: BoxDecoration(
                                            color: isCompleted
                                                ? FlutterFlowTheme.of(context)
                                                    .secondaryBackground
                                                : statusColor.withOpacity(0.2),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(
                                            icon,
                                            color: isCompleted
                                                ? FlutterFlowTheme.of(context)
                                                    .secondaryText
                                                : statusColor,
                                            size: 24.0,
                                          ),
                                        ),
                                        const SizedBox(width: 12.0),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            // Pet Name
                                            Text(
                                              petName,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Manrope',
                                                    fontWeight: FontWeight.w600,
                                                    decoration: isCompleted
                                                        ? TextDecoration
                                                            .lineThrough
                                                        : TextDecoration.none,
                                                  ),
                                            ),
                                            const SizedBox(height: 4.0),
                                            // Time Left and Type
                                            Text(
                                              '$timeRemaining [${type.toUpperCase()}]',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Manrope',
                                                    color: isCompleted
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText
                                                        : statusColor,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                            const SizedBox(height: 4.0),
                                            // Description
                                            Text(
                                              description,
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
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Checkbox(
                                      value: isCompleted,
                                      activeColor:
                                          FlutterFlowTheme.of(context).primary,
                                      onChanged: (bool? value) async {
                                        if (value == null) return;

                                        final int newStatus = value ? 1 : 0;

                                        setState(() {
                                          reminders[index]['status'] =
                                              newStatus;
                                        });

                                        try {
                                          await Supabase.instance.client
                                              .from('reminders')
                                              .update({'status': newStatus}).eq(
                                                  'id', reminder['id']);
                                        } catch (error) {
                                          setState(() {
                                            reminders[index]['status'] =
                                                isCompleted ? 0 : 1;
                                          });
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                  'Failed to update reminder status.'),
                                            ),
                                          );
                                        }
                                      },
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
      ],
    );
  }

  // Helper methods for time remaining, icon, and status color
  String getTimeRemaining(DateTime reminderTime) {
    final now = DateTime.now();
    final difference = reminderTime.difference(now);

    if (difference.isNegative) {
      if (difference.inMinutes.abs() > 24 * 60) {
        return 'OVERDUE';
      } else {
        return 'DUE TODAY';
      }
    } else if (difference.inDays > 0) {
      return '${difference.inDays} DAYS LEFT';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} HOURS LEFT';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} MINS LEFT';
    } else {
      return 'DUE SOON';
    }
  }

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

  Color getStatusColor(
      String timeRemaining, bool isCompleted, BuildContext context) {
    if (isCompleted) {
      return FlutterFlowTheme.of(context).secondaryText;
    } else if (timeRemaining.contains('OVERDUE') ||
        timeRemaining.contains('DUE TODAY')) {
      return Colors.red;
    } else if (timeRemaining.contains('DAYS')) {
      return FlutterFlowTheme.of(context).primary;
    } else if (timeRemaining.contains('HOURS')) {
      return Colors.orange;
    } else {
      return Colors.orange.shade700;
    }
  }

  Widget _buildHealthOverviewSection() {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: const [
            BoxShadow(
              blurRadius: 10.0,
              color: Color(0x1A000000),
              offset: Offset(0.0, 2.0),
            ),
          ],
          borderRadius: BorderRadius.circular(24.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Health Overview',
                style: FlutterFlowTheme.of(context).titleMedium.override(
                      fontFamily: 'Manrope',
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Pet Sit Card
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        // Navigate to the Pet Sit page
                        Navigator.pushNamed(context, '/petHomeList');
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Pet Sit card tapped'),
                          ),
                        );
                      },
                      child: Container(
                        width: 100.0,
                        height: 150.0,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF8F8F8),
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 4.0,
                              color: Color(0x0A000000),
                              offset: Offset(0.0, 2.0),
                            )
                          ],
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 50.0,
                                height: 50.0,
                                decoration: const BoxDecoration(
                                  color: Color(0x15F44336),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.pets,
                                  color: Colors.red,
                                  size: 24.0,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 0.0),
                                child: Text(
                                  'Pet Sit',
                                  style: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Manrope',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Food Card
                  Expanded(
                    child: Container(
                      width: 100.0,
                      height: 150.0,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF8F8F8),
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 4.0,
                            color: Color(0x0A000000),
                            offset: Offset(0.0, 2.0),
                          )
                        ],
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 50.0,
                              height: 50.0,
                              decoration: const BoxDecoration(
                                color: Color(0x154CAF50),
                                shape: BoxShape.circle,
                              ),
                              child: const Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: FaIcon(
                                  FontAwesomeIcons.bone,
                                  color: Colors.green,
                                  size: 24.0,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 8.0, 0.0, 0.0),
                              child: Text(
                                'Food',
                                style: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Manrope',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 4.0, 0.0, 0.0),
                              child: Text(
                                '30mins left for Urie',
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: 'Manrope',
                                      fontSize: 10.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUpcomingSection() {
    return Container();
  }

  Widget _buildQuickActionsSection() {
    return Container();
  }
}
