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
import 'transaction_card_model.dart';
export 'transaction_card_model.dart';

import 'package:paw_r_app/view_models/pet_view_model.dart';

import 'package:paw_r_app/views/pet_transact_details/pet_transact_details_widget.dart';

import 'package:paw_r_app/models/request.dart';

import 'package:paw_r_app/view_models/request_view_model.dart';

import 'package:paw_r_app/models/pet.dart';

import 'package:paw_r_app/models/user.dart';

class TransactionCardWidget extends StatefulWidget {
  const TransactionCardWidget({
    super.key,
    this.title,
    this.startDate,
    this.finishDate,
    this.total,
    this.cardId,
    this.rateType,
    this.duration,
    this.petId,
    this.userId,
    required this.requestObject,
  });

  final String? title;
  final String? startDate;
  final String? finishDate;
  final String? total;
  final int? cardId;
  final String? rateType;
  final String? duration;
  final int? petId;
  final String? userId;
  final Request requestObject;

  get amount => null;

  @override
  State<TransactionCardWidget> createState() => _TransactionCardWidgetState();
}

class _TransactionCardWidgetState extends State<TransactionCardWidget>
    with TickerProviderStateMixin {
  late TransactionCardModel _model;

  final animationsMap = <String, AnimationInfo>{};

  late bool isLoading;

  late Pet petDetails;

  late UserDetails ownerDetails;

  late UserDetails careTakerDetails;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TransactionCardModel());

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

    isLoading = true;
    fetchPetDetailsAndPrint(widget.petId);
    print('user Id:  ${widget.userId}');
    fetchUserDetailsAndPrint(widget.userId, true);

    if (widget.requestObject.status == 'accepted') {
      fetchUserDetailsAndPrint(widget.requestObject.caretaker_id, false);
    }

    isLoading = false;
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return (isLoading == true)
        ? Center(child: CircularProgressIndicator())
        : InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: const Color.fromARGB(0, 228, 23, 23),
            highlightColor: Colors.transparent,
            onTap: () async {
              if (animationsMap['containerOnActionTriggerAnimation'] != null) {
                animationsMap['containerOnActionTriggerAnimation']!
                    .controller
                    .forward(from: 0.0)
                    .whenComplete(
                        animationsMap['containerOnActionTriggerAnimation']!
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
              height: 220,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(24.0),
                border: Border.all(
                  color: valueOrDefault<Color>(
                    _model.completed!
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
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
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
                                  maxLines: 2,
                                  style: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .override(
                                        fontFamily: 'Manrope',
                                        color: valueOrDefault<Color>(
                                          _model.completed!
                                              ? FlutterFlowTheme.of(context)
                                                  .primary
                                              : FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
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
                                    alignment: AlignmentDirectional(1.0, -1.0),
                                    child: Icon(
                                      Icons.check_circle,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 24.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'From: ${widget.startDate!}',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Manrope',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              Text(
                                'To: ${widget.finishDate!}',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Manrope',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                '${widget.duration}',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Manrope',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                              Text(
                                (widget.rateType == 'hourly')
                                    ? '₱ 120 per hour'
                                    : 'one time',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Manrope',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              SizedBox(height: 8.0),
                              Container(
                                height: 28.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 8.0, 0.0),
                                    child: Text(
                                      (widget!.total!).toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Manrope',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            fontSize: 13.0,
                                            letterSpacing: 0.0,
                                          ),
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
                              builder: (context) => PetTransactWidgetDetails(
                                  request: widget.requestObject,
                                  petId: widget.petId ?? -1,
                                  pet: petDetails,
                                  ownerDetails: ownerDetails,
                                  careTakerDetails: careTakerDetails)));
                    },
                  ),
                ],
              ),
            ),
          ).animateOnActionTrigger(
            animationsMap['containerOnActionTriggerAnimation']!,
          );
  }

  Future<void> fetchPetDetailsAndPrint(int? petId) async {
    // Accessing the RequestViewModel
    final requestVM = Provider.of<RequestViewModel>(context, listen: false);

    // Awaiting the result of fetchPetDetails to get the actual pet object
    final fetchedPetDetails = await requestVM.fetchPetDetails(petId ?? -1);

    setState(() {
      petDetails = fetchedPetDetails!;
    });
  }

  Future<void> fetchUserDetailsAndPrint(String? ownerId, bool? isOwner) async {
    // Accessing the RequestViewModel
    final requestVM = Provider.of<RequestViewModel>(context, listen: false);

    // Awaiting the result of fetchPetDetails to get the actual pet object
    final fetchedUserDetails =
        await requestVM.fetchOwnerDetails(ownerId ?? '-1');

    setState(() {
      if (isOwner ?? true) {
        ownerDetails = fetchedUserDetails!;
      } else {
        careTakerDetails = fetchedUserDetails!;
      }

      if (widget.requestObject.status == 'pending') {
        careTakerDetails = fetchedUserDetails!;
      }
    });
  }
}
