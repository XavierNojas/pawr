import 'package:paw_r_app/models/pet.dart';
import 'package:paw_r_app/view_models/request_view_model.dart';
import 'package:paw_r_app/views/pet_profile/pet_profile_widget.dart';
import 'package:paw_r_app/views/pet_profile_edit/pet_edit_widget.dart';

import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'pet_card_model.dart';
export 'pet_card_model.dart';

import 'package:paw_r_app/view_models/pet_view_model.dart';

class PetCardWidget extends StatefulWidget {
  const PetCardWidget({
    super.key,
    this.title,
    this.subTitle,
    this.image,
    this.cardId,
    required this.petObject,
    required this.isFromFriend,
  });

  final String? title;
  final String? subTitle;
  final String? image;
  final int? cardId;
  final Pet petObject;
  final bool isFromFriend;



  @override
  State<PetCardWidget> createState() => _PetCardWidgetState();
}

class _PetCardWidgetState extends State<PetCardWidget>
    with TickerProviderStateMixin {
  late PetCardModel _model;

  final animationsMap = <String, AnimationInfo>{};

  bool isLoading = true;

  String ownerName = '888';
  

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PetCardModel());


    if (widget.isFromFriend) {

      fetchOwnerDetails(widget.petObject.user_id);

    } else {

      isLoading = false;

    }

    animationsMap.addAll({
      'containerOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 100.0.ms,
            begin: const Offset(1.0, 1.0),
            end: const Offset(0.95, 0.95),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return (isLoading == true) ? const Center(child: CircularProgressIndicator()) 
    : InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        if (animationsMap['containerOnActionTriggerAnimation'] != null) {
          animationsMap['containerOnActionTriggerAnimation']!
              .controller
              .forward(from: 0.0)
              .whenComplete(animationsMap['containerOnActionTriggerAnimation']!
                  .controller
                  .reverse);
        }
        if (_model.selected!) {
          _model.selected = false;
          _model.isSelected = false;
          safeSetState(() {});
        } else {
          _model.selected = true;
          _model.isSelected = true;
          safeSetState(() {});
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(24.0),
          border: Border.all(
            color: valueOrDefault<Color>(
              _model.selected!
                  ? FlutterFlowTheme.of(context).primary
                  : FlutterFlowTheme.of(context).secondaryBackground,
              FlutterFlowTheme.of(context).secondaryBackground,
            ),
            width: 3.0,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Container(
                  width: 60.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).warning,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: Image.asset(
                        'assets/images/Urie.jpg',
                      ).image,
                    ),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            widget!.title!,
                            softWrap: true, 
                            overflow: TextOverflow.ellipsis, 
                            maxLines: 1,
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  fontFamily: 'Manrope',
                                  color: valueOrDefault<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                    FlutterFlowTheme.of(context).primaryText,
                                  ),
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  lineHeight: 1.2,
                                ),
                          ),
                        ),
                        Container(
                          width: 35.0,
                          height: 35.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            shape: BoxShape.circle,
                          ),
                          child: Visibility(
                            visible: _model.selected ?? true,
                            child: Align(
                              alignment: const AlignmentDirectional(1.0, -1.0),
                              child: Icon(
                                Icons.check_circle,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 24.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                       children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${widget.subTitle}',
                              softWrap: true, 
                              overflow: TextOverflow.ellipsis, 
                              maxLines: 1, 
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                      fontFamily: 'Manrope',
                                      color: FlutterFlowTheme.of(context).ebony,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal),
                            ),
                            
                          ]),

                    ]),

                  Row(
                      mainAxisSize: MainAxisSize.max,
                       children: [

                        if (widget.isFromFriend)

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'owner: $ownerName',
                              softWrap: true, 
                              overflow: TextOverflow.ellipsis,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                      fontFamily: 'Manrope',
                                      color: FlutterFlowTheme.of(context).ebony,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal),
                            ),
                            
                          ]),
                    ]),



                  ],
                ),
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.arrow_forward_ios_rounded, // or any icon you like
                color: FlutterFlowTheme.of(context).primary,
              ),
              onPressed: () {
                // Trigger your event here
                print('IconButton pressed!');
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            PetProfileWidget(pet: widget.petObject, isFromFriend: widget.isFromFriend)));
              },
            ),
          ],
        ),
      ),
    ).animateOnActionTrigger(
      animationsMap['containerOnActionTriggerAnimation']!,
    );
  }

  Future<void> fetchOwnerDetails(String user_id) async {

    final friendsVM = Provider.of<RequestViewModel>(context, listen: false);
    final owner = await friendsVM.fetchOwnerDetails(user_id);

    setState(() {
      ownerName = owner!.username;
      isLoading = false;
    });

    return;
  }

}
