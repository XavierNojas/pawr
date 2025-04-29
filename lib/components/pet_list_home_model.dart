import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'pet_list_home_widget.dart' show PetListHomeWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../view_models/pet_view_model.dart';


class PetListHomeModel extends FlutterFlowModel<PetListHomeWidget> {
  /// Dynamic hover state using index
  int hoveredIndex = -1; // -1 means no item is hovered

  bool mouseRegionHovered = false;

  @override
  void initState(BuildContext context) {
    
  }

  @override
  void dispose() {}
}

