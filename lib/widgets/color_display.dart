import 'package:flutter/material.dart';

class ColorDisplay extends StatelessWidget {
  const ColorDisplay({
    super.key,
    required this.selectedColor,
    required this.isCircular,
  });

  final Color selectedColor;
  final bool isCircular;

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    debugPrint(deviceSize.toString());
    final containerSize = deviceSize.shortestSide * 0.4;
    debugPrint(containerSize.toString());

    return Container(
      width: containerSize,
      height: containerSize,
      decoration: BoxDecoration(
        color: selectedColor,
        borderRadius: BorderRadius.circular(
          isCircular
              ? containerSize / 2
              : 10, //isCircular == true ise px/2 oranından(containerSize/2) çember oluşturulur.Değilse köşeleri hafif yuvarlanır
        ),

        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: selectedColor.withOpacity(0.5),
            blurRadius: 10, //gölge bulanıklığı
            spreadRadius: 2, //gölge büyüklüğü
          ),
        ],
      ),
    );
  }
}
