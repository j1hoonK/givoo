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
    double height = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.fromLTRB(width * 0.01, 0, width * 0.01, height * 0.01),
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
              width: width * 0.01,
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



class FreeDonation extends StatefulWidget {
  const FreeDonation({super.key});

  @override
  State<FreeDonation> createState() => _FreeDonationState();
}

class _FreeDonationState extends State<FreeDonation> {
  bool isCheckd = false;
  String payment = '0';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.fromLTRB(width * 0.01, 0, width * 0.01, height * 0.01),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey.shade300,
        ),
      ),
      child: Stack(
        children: [
          Row(
            children: [
              Checkbox(
                value: isCheckd,
                onChanged: (bool? value) {
                  setState(() {
                    isCheckd = value ?? false;
                  });
                },
              ),
              SizedBox(width: width * 0.03),
              Expanded(
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '필수 항목입니다.';
                    }
                    return null;
                  },
                  onSaved: (value) => setState(() {
                    payment = value!;
                  }),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.right,
                  cursorColor: Colors.black,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(right: 30),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black
                      ),
                    ),
                  ),
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
                ' 원',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

