import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'snack_tile_model.dart';
export 'snack_tile_model.dart';

class SnackTileWidget extends StatefulWidget {
  const SnackTileWidget({
    super.key,
    this.image,
  });

  final String? image;

  @override
  State<SnackTileWidget> createState() => _SnackTileWidgetState();
}

class _SnackTileWidgetState extends State<SnackTileWidget> {
  late SnackTileModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SnackTileModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        width: 100.0,
        height: 100.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          shape: BoxShape.circle,
        ),
        child: Align(
          alignment: const AlignmentDirectional(0.0, 0.0),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.network(
              widget.image!,
              width: 100.0,
              height: 100.0,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
