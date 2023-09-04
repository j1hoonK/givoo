import 'package:flutter/material.dart';

class DntHistory extends StatelessWidget {
  const DntHistory({super.key, required this.date, required this.type, required this.name, required this.text, });

  final String date;
  final String type;
  final String name;
  final Widget ;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: Column(
        children: [
          Row(
              children: [
                Text("결제 완료"),
                SizedBox(width: 20,),
                Text(dnt.dntDate),
              ]
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(type),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(name),
                    Text(name),
                    text

                  ],
                ),
              ],
            ),
          ),
          Divider(
            height: 20,
            color: Colors.grey[350],
          )
        ],
      ),
    );
  }
}
