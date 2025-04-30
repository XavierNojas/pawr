import '/flutter_flow/flutter_flow_util.dart';
import 'pet_list_widget.dart' show PetListWidget;
import 'package:flutter/material.dart';

class PetListModel extends FlutterFlowModel<PetListWidget> {
  /// Dynamic hover state using index
  int hoveredIndex = -1; // -1 means no item is hovered

  bool mouseRegionHovered = false;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
