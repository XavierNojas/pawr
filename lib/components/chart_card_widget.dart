import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chart_card_model.dart';
export 'chart_card_model.dart';

class ChartCardWidget extends StatefulWidget {
  const ChartCardWidget({super.key});

  @override
  State<ChartCardWidget> createState() => _ChartCardWidgetState();
}

class _ChartCardWidgetState extends State<ChartCardWidget> {
  late ChartCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChartCardModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return ClipRRect(
      borderRadius: BorderRadius.circular(24.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        height: 250.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primary,
          borderRadius: BorderRadius.circular(24.0),
        ),
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: 250.0,
          child: Stack(
            alignment: const AlignmentDirectional(0.0, 0.0),
            children: [
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: 150.0,
                child: FlutterFlowLineChart(
                  data: [
                    FFLineChartData(
                      xData: FFAppState().chartX,
                      yData: FFAppState().chartY,
                      settings: LineChartBarData(
                        color: FlutterFlowTheme.of(context).white,
                        barWidth: 4.0,
                        isCurved: true,
                        dotData: const FlDotData(show: false),
                      ),
                    )
                  ],
                  chartStylingInfo: ChartStylingInfo(
                    backgroundColor: FlutterFlowTheme.of(context).primary,
                    showBorder: false,
                  ),
                  axisBounds: const AxisBounds(),
                  xAxisLabelInfo: const AxisLabelInfo(),
                  yAxisLabelInfo: const AxisLabelInfo(),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, -1.0),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.show_chart_rounded,
                        color: FlutterFlowTheme.of(context).white,
                        size: 24.0,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              15.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Pet Health\n',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Manrope',
                                  color: FlutterFlowTheme.of(context).white,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(1.0, 1.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      20.0, 20.0, 20.0, 10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 10.0, 13.0),
                        child: Text(
                          'PAST 7 DAYS',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Manrope',
                                    color: FlutterFlowTheme.of(context).white,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                      Text(
                        FFAppState().avgLevel.toString(),
                        style:
                            FlutterFlowTheme.of(context).displayLarge.override(
                                  fontFamily: 'Manrope',
                                  color: FlutterFlowTheme.of(context).white,
                                  letterSpacing: 0.0,
                                ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
