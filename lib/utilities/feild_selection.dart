import 'package:flutter/material.dart';

class FilterButtonList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.all(16),
        children: [
          FilterButton(text: 'App Development'),
          FilterButton(text: 'CPP'),
          FilterButton(text: 'JAVA'),
          FilterButton(text: 'Machine Learning'),
          FilterButton(text: 'Web Development'),
        ],
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  final String text;

  const FilterButton({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ElevatedButton(
        onPressed: () {
          // Add your filter logic here
          print('Filter button pressed: $text');
        },
        child: Text(text,style: TextStyle(
          fontSize: 18
        ),),
      ),
    );
  }
}