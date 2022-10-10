import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  final Widget child;
  const CardItem({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SizedBox(
      width: screenSize.width * 0.9,
      height: 100,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2.0),
        ),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: child,
        ),
      ),
    );
  }
}
