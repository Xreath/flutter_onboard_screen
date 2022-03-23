import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider_vanilla/feature/page_indicator/page_indicator.dart';
import 'package:provider_vanilla/product/padding/page_padding.dart';

import '../../login/second_route.dart';
import '../../tab_indicator/tab_indicator.dart';
import '../model/onboard_model.dart';

class OnBoardView extends StatefulWidget {
  const OnBoardView({Key? key}) : super(key: key);

  @override
  State<OnBoardView> createState() => _OnBoardViewState();
}

class _OnBoardViewState extends State<OnBoardView> {
  final String _skipTitle = "Skip";
  int _selectedIndex = 0;
  bool get _isLastPage =>
      _selectedIndex == OnBoardModels.onBoardModelList.length - 1;
  bool get _isFirstPage => _selectedIndex == 0;

  void pushOther() => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SecondRoute()),
      );

  void _incrementIndexAndChange([int? value]) {
    setState(() {
      if (value != null) {
        _selectedIndex = value;
      } else {
        _selectedIndex++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Padding(
        padding: const PagePadding.all(),
        child: Column(
          children: [
            Expanded(
                flex: 8,
                child: PageViewIndicator(
                  index: _selectedIndex,
                  onPageChanged: (deger) {
                    _incrementIndexAndChange(deger);
                  },
                )),
            Expanded(flex: 2, child: _bottomStack(context)),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      actions: [TextButton(onPressed: () {}, child: Text(_skipTitle))],
      leading: _isFirstPage
          ? null
          : IconButton(
              icon: Icon(
                Icons.chevron_left,
                color: Theme.of(context).colorScheme.primary,
              ),
              onPressed: () {},
            ),
    );
  }

  Stack _bottomStack(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: TabControler(index: _selectedIndex),
        ),
        Positioned(right: 0, bottom: 15, child: _nextButton(context))
      ],
    );
  }

  FloatingActionButton _nextButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: _isLastPage ? pushOther : _incrementIndexAndChange,
      focusColor: Colors.green,
      backgroundColor:
          Theme.of(context).floatingActionButtonTheme.backgroundColor,
      hoverColor: Colors.amber,
      child: Text(
        _isLastPage ? "Start" : "Next",
        style:
            Theme.of(context).textTheme.button?.copyWith(color: Colors.black),
      ),
    );
  }
}
