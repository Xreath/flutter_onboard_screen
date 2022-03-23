import 'package:flutter/material.dart';
import 'package:provider_vanilla/feature/onboard/model/onboard_model.dart';

class OnBoardCard extends StatelessWidget {
  final OnBoardModel model;
  const OnBoardCard({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          model.title,
          style: Theme.of(context).textTheme.headline5,
        ),
        Text(model.description),
        Expanded(
          child: Image.asset(
            model.imageWithPath,
          ),
        ),
      ],
    );
  }
}
