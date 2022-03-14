import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  const Badge({
    Key? key,
    required this.child,
    required this.value,
  }) : super(key: key);

  final Widget child;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        Positioned(
          right: 1,
          top: 6,
          child: Container(
            padding: const EdgeInsets.all(2.0),
            decoration: BoxDecoration(
              color: value == '0'
                  ? Theme.of(context).primaryColor
                  : Colors.redAccent,
              borderRadius: BorderRadius.circular(20.0),
            ),
            constraints: const BoxConstraints(
              minWidth: 14,
              minHeight: 14,
            ),
            child: Text(
              value,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: value == '0'
                    ? Theme.of(context).primaryColor
                    : Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}
