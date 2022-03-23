import 'package:flutter/material.dart';

import '../onboard/model/onboard_model.dart';

class TabControler extends StatefulWidget {
  final int index;
  const TabControler({Key? key, required this.index}) : super(key: key);

  @override
  State<TabControler> createState() => _TabControlerState();
}

class _TabControlerState extends State<TabControler>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void didUpdateWidget(covariant TabControler oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.index != widget.index) {
      _tabController.animateTo(widget.index);
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: OnBoardModels.onBoardModelList.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return TabPageSelector(
      controller: _tabController,
      color: Colors.white,
      selectedColor: Colors.red,
    );
  }
}
