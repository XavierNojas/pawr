import 'package:flutter/material.dart';
import 'package:paw_r_app/view_models/navigation_view_model.dart';
import 'package:provider/provider.dart';

import '../views/transactions_log/transactions_log_widget.dart';
import '../views/transactions_log_other/transactions_log_other_widget.dart';

class TransactionsOtherNavigator extends StatefulWidget {
  const TransactionsOtherNavigator({super.key});

  @override
  _TransactionsOtherNavigatorState createState() =>
      _TransactionsOtherNavigatorState();
}

class _TransactionsOtherNavigatorState extends State<TransactionsOtherNavigator>
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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // 👈 Go back when pressed
          },
        ),
        // title: Text('Other Requests'), // optional: title in center
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Pending'),
            Tab(text: 'Accepted'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          TransactionsLogOtherWidget(status: 'pending'),
          TransactionsLogOtherWidget(status: 'accepted'),
        ],
      ),
    );
  }
}
