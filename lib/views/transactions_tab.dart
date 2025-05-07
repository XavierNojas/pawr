import 'package:flutter/material.dart';
import 'package:paw_r_app/view_models/navigation_view_model.dart';
import 'package:paw_r_app/views/transactions_log_accepted/transactions_log_accepted_widget.dart';
import 'package:provider/provider.dart';

import '../views/transactions_log/transactions_log_widget.dart';
import '../views/transactions_log_other/transactions_log_other_widget.dart';

class TransactionsNavigator extends StatefulWidget {
  @override
  _TransactionsNavigatorState createState() => _TransactionsNavigatorState();
}

class _TransactionsNavigatorState extends State<TransactionsNavigator>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 0;

  final List<Widget> _tabViews = const [
    TransactionsLogWidget(status: 'pending', isFromProfile: false),
    TransactionsLogAcceptedWidget(status: 'accepted', isFromProfile: false),
  ];

  @override
  void initState() {
    super.initState();
    final navProvider = Provider.of<NavigationProvider>(context, listen: false);

    _tabController = TabController(
      length: _tabViews.length,
      vsync: this,
      initialIndex: navProvider.topTabIndex,
    );

    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        setState(() {
          _currentIndex = _tabController.index;
        });
        navProvider.updateTopTabIndex(_tabController.index);
      }
    });

    _currentIndex = _tabController.index;
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: TabBar(
        controller: _tabController,
        tabs: const [
          Tab(text: 'Pending'),
          Tab(text: 'Accepted'),
        ],
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _tabViews,
      ),
    );
  }
}
