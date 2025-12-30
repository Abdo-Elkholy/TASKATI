import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Date extends StatefulWidget {
  final int? index;
  final int? selectedIndex;
  final String dateToShow;

  Date({super.key, this.index, this.selectedIndex, required this.dateToShow});

  late final DateTime mainDate = DateFormat("MM/dd/yyyy").parse(dateToShow);

  @override
  State<Date> createState() => _DateState();
}

class _DateState extends State<Date> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      decoration: BoxDecoration(
        color: widget.selectedIndex == widget.index
            ? Color(0xff4E5AE8)
            : Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsetsGeometry.only(right: 5, left: 5),
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            widget.mainDate.month.toString(),
            style: TextStyle(
              color: widget.selectedIndex == widget.index
                  ? Colors.white
                  : Colors.black,
            ),
          ),
          Text(
            widget.mainDate.year.toString(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: widget.selectedIndex == widget.index
                  ? Colors.white
                  : Colors.black,
              fontSize: 20,
            ),
          ),
          Text(
            widget.mainDate.day.toString(),
            style: TextStyle(
              color: widget.selectedIndex == widget.index
                  ? Colors.white
                  : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
