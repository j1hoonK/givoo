import 'package:flutter/material.dart';

class DntTypeList extends StatefulWidget {
  const DntTypeList({super.key, required this.dntType, required this.pay});

  final String dntType;
  final String pay;

  @override
  State<DntTypeList> createState() => _DntTypeListState();
}

class _DntTypeListState extends State<DntTypeList> {
  bool isCheckd = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey.shade300,
        ),
      ),
      child: Stack(children: [
        Row(
          children: [
            Checkbox(
                value: isCheckd,
                onChanged: (bool? value) {
                  setState(() {
                    isCheckd = value ?? false;
                  });
                  print(value);
                }),
            SizedBox(
              width: width * 0.03,
            ),
            Text(
              widget.dntType,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
        Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: Center(
              child: Text(
                '${widget.pay} 원',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            )),
      ]),
    );
  }
}
