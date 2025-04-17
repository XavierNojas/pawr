import 'package:paw_r_app/views/pet_profile/pet_profile_widget.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pet_list_model.dart';
export 'pet_list_model.dart';

import '../view_models/pet_view_model.dart';
import '../models/pet.dart';

class PetListWidget extends StatefulWidget {
  const PetListWidget({super.key});

  @override
  State<PetListWidget> createState() => _PetListWidgetState();
}

class _PetListWidgetState extends State<PetListWidget> {
  late PetListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PetListModel());
    final petVM = Provider.of<PetViewModel>(context, listen: false);
    petVM.fetchPets();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  Future<void> deleteMyPet(BuildContext context, int? pet_id) async {
    final vmPet = Provider.of<PetViewModel>(context, listen: false);
    await vmPet.deletePet(pet_id!);
  }

  Widget itemTemplate(
      String petName, String petBreed, int index, int? pet_id, Pet item) {
    bool isHovered = _model.hoveredIndex == index;

    return MouseRegion(
      opaque: false,
      cursor: SystemMouseCursors.click,
      onEnter: (_) => safeSetState(() => _model.hoveredIndex = index),
      onExit: (_) => safeSetState(() => _model.hoveredIndex = -1),
      child: Material(
        // Needed for InkWell
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PetProfileWidget(pet: item)));
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 150),
            curve: Curves.easeInOut,
            width: double.infinity,
            decoration: BoxDecoration(
              color: isHovered
                  ? FlutterFlowTheme.of(context).primaryBackground
                  : FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.only(end: 8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40.0),
                      child: Image.asset(
                        'assets/images/Urie.jpg',
                        width: 32.0,
                        height: 32.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          petName,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Manrope',
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          petBreed,
                          style:
                              FlutterFlowTheme.of(context).bodySmall.override(
                                    fontFamily: 'Manrope',
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  if (isHovered)
                    IconButton(
                      icon: Icon(Icons.delete_outline, color: Colors.redAccent),
                      onPressed: () {
                        deleteMyPet(context, pet_id);
                      },
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PetViewModel>(
      // Consumer listens to changes in PetViewModel
      builder: (context, petVM, child) {
        if (petVM.isLoading) {
          return Center(child:CircularProgressIndicator()); // Show loading indicator while fetching
        }
        return Padding(
          padding: EdgeInsets.all(16.0),
          child: Container(
            width: 400,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              boxShadow: [
                BoxShadow(
                  blurRadius: 4.0,
                  color: Color(0x33000000),
                  offset: Offset(
                    0.0,
                    2.0,
                  ),
                )
              ],
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 8.0),
                    child: Text(
                      'My Pets',
                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                            fontFamily: 'Manrope',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  Divider(
                    thickness: 1.0,
                    color: FlutterFlowTheme.of(context).alternate,
                  ),
                  petVM.pets.isEmpty
                      ? Center(child: Text('No pets found.'))
                      : ListView(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          children: petVM.pets.asMap().entries.map((entry) {
                            int index = entry.key;
                            var item = entry.value;
                            return itemTemplate(
                                item.name, item.breed, index, item.id, item);
                          }).toList(),
                        ),
                  Divider(
                    thickness: 1.0,
                    color: FlutterFlowTheme.of(context).alternate,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
