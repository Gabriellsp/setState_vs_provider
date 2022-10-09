import 'package:flutter/material.dart';
import 'package:provider_state_management/shared/style/text_style.dart';

class NoItems extends StatelessWidget {
  final String? title;
  const NoItems({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.shopping_bag_rounded,
            size: 100,
            color: Colors.blueAccent,
          ),
          SizedBox(
            width: 250,
            child: Text(title!,
                style: font18BoldBlueAccent, textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }
}
