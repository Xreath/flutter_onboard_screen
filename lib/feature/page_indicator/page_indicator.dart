import 'package:flutter/material.dart';

import '../../product/widget/onboard_card.dart';
import '../onboard/model/onboard_model.dart';

class PageViewIndicator extends StatefulWidget {
  final int index;
  final void Function(int) onPageChanged;
  const PageViewIndicator(
      {Key? key, required this.index, required this.onPageChanged})
      : super(key: key);

  @override
  State<PageViewIndicator> createState() => _PageViewIndicatorState();
}

class _PageViewIndicatorState extends State<PageViewIndicator> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0, keepPage: true);
  }

  @override
  void didUpdateWidget(covariant PageViewIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.index != widget.index) {
      _pageController.animateToPage(widget.index,
          curve: Curves.easeIn, duration: const Duration(milliseconds: 300));
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: _pageController,
        onPageChanged: widget.onPageChanged,
        itemCount: OnBoardModels.onBoardModelList.length,
        itemBuilder: (context, index) {
          return OnBoardCard(
            model: OnBoardModels.onBoardModelList[index],
          );
        });
  }
}
