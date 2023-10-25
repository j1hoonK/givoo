import 'package:flutter/material.dart';

class DntTypeList extends StatefulWidget {
  const DntTypeList(
      {super.key,
      required this.dntType,
      required this.pay,
      required this.isChecked,
      required this.onChanged});

  final String dntType;
  final String pay;
  final bool isChecked;
  final ValueChanged onChanged;

  @override
  State<DntTypeList> createState() => _DntTypeListState();
}

class _DntTypeListState extends State<DntTypeList> {
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
            Checkbox(value: widget.isChecked, onChanged: widget.onChanged),
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
                '${widget.pay} 원 ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            )),
      ]),
    );
  }
}

class FreeDonation extends StatefulWidget {
  const FreeDonation(
      {super.key, required this.checkedOnFree, required this.onChangedOnFree});

  final bool checkedOnFree;
  final ValueChanged onChangedOnFree;
  static String payment = '0';
  @override
  State<FreeDonation> createState() => _FreeDonationState();
}

class _FreeDonationState extends State<FreeDonation> {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.all(5),
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
              Checkbox(value: widget.checkedOnFree, onChanged: widget.onChangedOnFree),
              SizedBox(
                width: width * 0.01,
              ),
              Text('직접 입력',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(width: width * 0.03),              
              Expanded(
                child: TextFormField(
                  validator: widget.checkedOnFree == true
                      ? (value) {
                          if (value!.isEmpty) {
                            return '필수 항목입니다.';
                          }
                          return null;
                        }
                      : null,
                  onChanged: (value) => setState(() {
                    FreeDonation.payment=value;
                  }),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.right,
                  cursorColor: Colors.black,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
              ),
              Text(
                ' 원 ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              )
            ],
          ),
          // Positioned(
          //   right: 0,
          //   top: 0,
          //   bottom: 0,
          //   child: Center(
          //     child: Text(
          //       ' 원',
          //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
