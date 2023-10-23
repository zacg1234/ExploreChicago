import 'package:flutter/material.dart';
import 'ListCard.dart';

class MyListView extends StatelessWidget {
  final List<Image> thumbNails;
  final List<String> titles;
  final List<String> addresses;

  const MyListView({super.key, required this.thumbNails, required this.titles, required this.addresses});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: thumbNails.length,
      itemBuilder: (BuildContext context, int index) {
        return ListCard(
          thumbNail: thumbNails[index],
          title: titles[index],
          address: addresses[index]);
        },
      separatorBuilder: (BuildContext context, int position)  {
        return const SizedBox( height: 10, width: 0) ;
      },
      padding: const EdgeInsets.all(10),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
    );
  }
 }