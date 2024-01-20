import 'package:flutter/material.dart';
import 'package:flutter_auth/Classes/card_model_for_all.dart';

class GenericListBuilder extends StatelessWidget {
  final List<CardModelForAll> itemList;
  final Widget Function(BuildContext context, int index, CardModelForAll item) itemBuilder;

  GenericListBuilder({required this.itemList, required this.itemBuilder});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: itemList.length,
        itemBuilder: (context, index) {
          return itemBuilder(context, index, itemList[index]);
        },
      ),
    );
  }
}