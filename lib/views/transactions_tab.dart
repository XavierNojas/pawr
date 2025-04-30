import 'package:flutter/material.dart';
import 'package:paw_r_app/view_models/navigation_view_model.dart';
import 'package:provider/provider.dart';

import '../views/transactions_log/transactions_log_widget.dart';
import '../views/transactions_log_other/transactions_log_other_widget.dart';

class TransactionsNavigator extends StatefulWidget {
  const TransactionsNavigator({super.key});

  @override
  _TransactionsNavigatorState createState() => _TransactionsNavigatorState();
}

class _TransactionsNavigatorState extends State<TransactionsNavigator>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    final navProvider = Provider.of<NavigationProvider>(context, listen: false);

    _tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: navProvider.topTabIndex,
    );

    _tabController.addListener(() {
      if (_tabController.indexIsChanging == false) {
        navProvider.updateTopTabIndex(_tabController.index);
      }
    });
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
      body: TabBarView(
        controller: _tabController,
        children: const [
          TransactionsLogWidget(status: 'pending'),
          TransactionsLogWidget(status: 'accepted'),
        ],
      ),
    );
  }
}
