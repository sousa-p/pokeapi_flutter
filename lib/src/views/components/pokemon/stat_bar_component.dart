import 'package:flutter/material.dart';

class StatBarComponent extends StatelessWidget {
  final String attribute;
  final double points;

  const StatBarComponent({super.key, required this.attribute, required this.points});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Wrap(
        alignment: WrapAlignment.start,
        children: [
          SizedBox(height: 16, width: 125, child: Text(attribute)),
          SizedBox(
            width: 325,
            child: Wrap(
              alignment: WrapAlignment.start,
              children: [
                SizedBox(width: 25, child: Text(points.toStringAsFixed(0))),
                Container(
                  width: points / 100 * 300,
                  height: 16,
                  decoration: const BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
