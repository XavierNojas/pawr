import 'package:paw_r_app/components/transactions_card_b_model.dart';
import 'package:paw_r_app/views/pet_transact_details/pet_transact_details_widget.dart';

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
import 'activity_card_model.dart';
export 'activity_card_model.dart';

import 'package:paw_r_app/view_models/pet_view_model.dart';

class TransactionsCardBWidget extends StatefulWidget {
  const TransactionsCardBWidget({
    super.key,
    this.title,
    this.description,
    this.cardId,
  });

  final String? title;
  final String? description;
  final int? cardId;

  get amount => null;

  @override
  State<TransactionsCardBWidget> createState() =>
      _TransactionsCardBWidgetState();
}

class _TransactionsCardBWidgetState extends State<TransactionsCardBWidget>
    with TickerProviderStateMixin {
  late TransactionsCardBModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TransactionsCardBModel());

    animationsMap.addAll({
      'containerOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 100.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(0.95, 0.95),
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
    return InkWell(
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
        width: MediaQuery.sizeOf(context).width * 1.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).azureWeb,
          borderRadius: BorderRadius.circular(24.0),
          border: Border.all(
            color: valueOrDefault<Color>(
                _model.selected!
                    ? FlutterFlowTheme.of(context).primary
                    : FlutterFlowTheme.of(context).azureWeb,
                FlutterFlowTheme.of(context).azureWeb),
            width: 3.0,
          ),
        ),
        child: // Generated code for this Column Widget...
Column(
  mainAxisSize: MainAxisSize.max,
  children: [
    Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'New York',
                style: FlutterFlowTheme.of(context).titleLarge.override(
                      color: Color(0xFF14181B),
                      fontFamily: 'Manrope',
                      fontSize: 22,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                      fontStyle:
                          FlutterFlowTheme.of(context).titleLarge.fontStyle,
                    ),
              ),
            ],
          ),
          Icon(
            Icons.flight,
            color: Color(0xFF57636C),
            size: 44,
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Los Angeles',
                style: FlutterFlowTheme.of(context).titleLarge.override(
                      color: Color(0xFF14181B),
                      fontFamily: 'Manrope',
                      fontSize: 22,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                      fontStyle:
                          FlutterFlowTheme.of(context).titleLarge.fontStyle,
                    ),
              ),
            ],
          ),
        ],
      ),
    ),
    Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                                  IconButton(
                    icon: Icon(
                      Icons.arrow_forward_ios_rounded, // or any icon you like
                      color: FlutterFlowTheme.of(context).primary,
                    ),
                    onPressed: () {
                      // Trigger your event here
                      print('IconButton pressed!');
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => PetTransactWidgetDetails(
                      //             request: widget.requestObject,
                      //             petId: widget.petId ?? -1,
                      //             pet: petDetails,
                      //             ownerDetails: ownerDetails,
                      //             careTakerDetails: careTakerDetails)));
                    },
                  ),
              ],
            ),
          ),
        ],
      ),
    ),

    
    Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 4, 0),
                  child: Text(
                    '08 Dec',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          color: Color(0xFF14181B),
                          fontFamily: 'Manrope',
                          fontSize: 14,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                          fontStyle: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontStyle,
                        ),
                  ),
                ),
                Text(
                  '9:40am',
                  style: FlutterFlowTheme.of(context).bodySmall.override(
                        color: Color(0xFF4B39EF),
                        fontFamily: 'Manrope',
                        fontSize: 12,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodySmall.fontStyle,
                      ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
            child: Text(
              'Departure',
              style: FlutterFlowTheme.of(context).labelLarge.override(
                    color: Color(0xFF57636C),
                    fontFamily: 'Manrope',
                    fontSize: 16,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.normal,
                    fontStyle:
                        FlutterFlowTheme.of(context).labelLarge.fontStyle,
                  ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 12),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 4, 0),
                  child: Text(
                    '08 Dec',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          color: Color(0xFF14181B),
                          fontFamily: 'Manrope',
                          fontSize: 14,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                          fontStyle: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontStyle,
                        ),
                  ),
                ),
                Text(
                  '11:58am',
                  style: FlutterFlowTheme.of(context).bodySmall.override(
                        color: Color(0xFF4B39EF),
                        fontFamily: 'Manrope',
                        fontSize: 12,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodySmall.fontStyle,
                      ),
                    
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  ],
)

      ),
    ).animateOnActionTrigger(
      animationsMap['containerOnActionTriggerAnimation']!,
    );
  }
}
