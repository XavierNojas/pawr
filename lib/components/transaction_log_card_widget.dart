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
import 'transaction_log_card_model.dart';
export 'transaction_log_card_model.dart';

import 'package:paw_r_app/view_models/pet_view_model.dart';

import 'package:paw_r_app/views/pet_transact_details/pet_transact_details_widget.dart';

import 'package:paw_r_app/models/request.dart';

import 'package:paw_r_app/view_models/request_view_model.dart';

import 'package:paw_r_app/models/pet.dart';

import 'package:paw_r_app/models/user.dart';

class TransactionCardLogWidget extends StatefulWidget {
  const TransactionCardLogWidget({
    super.key,
    this.title,
    this.total,
    this.cardId,
    required this.requestObject, 
    this.userId,
    this.realUserId,
  });

  final String? title;
  final String? total;
  final int? cardId;
  final String? userId;
  final String? realUserId;
  final Request requestObject;

 


  get amount => null;

  @override
  State<TransactionCardLogWidget> createState() => _TransactionCardLogWidgetState();
}

class _TransactionCardLogWidgetState extends State<TransactionCardLogWidget>
    with TickerProviderStateMixin {
  late TransactionCardLogModel _model;

  final animationsMap = <String, AnimationInfo>{};

  late bool isLoading;

  late Pet petDetails = Pet(name: 'pet name', user_id: '-1', breed: 'pet breed', age: -1, weight: -1);

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
    _model = createModel(context, () => TransactionCardLogModel());




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
    setState(() {
      isLoading = true;
    });

    fetchUserDetailsAndPrint();


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
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
              (widget.realUserId != widget.userId) ? '+${widget!.title!}' : '-${widget!.title!}',
                style: FlutterFlowTheme.of(context).titleLarge.override(
                      color: Color(0xFF14181B),
                      fontFamily: 'Manrope',
                      fontSize: 18,
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
                          
                        ],
                      ),
                    ),
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
      print('details');
      print(fetchedPetDetails);
      petDetails = fetchedPetDetails!;
    });
  }

  Future<void> fetchUserDetailsAndPrint() async {
    // // Accessing the RequestViewModel
    // final requestVM = Provider.of<RequestViewModel>(context, listen: false);

    // // Awaiting the result of fetchPetDetails to get the actual pet object
    // final fetchedUserDetails = await requestVM.fetchOwnerDetails(ownerId ?? '-1');

    setState(() {

      isLoading = false;
    });
  }
}
