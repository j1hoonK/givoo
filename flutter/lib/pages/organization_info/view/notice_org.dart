import 'package:flutter/material.dart';

class OrgNotice extends StatefulWidget {
  const OrgNotice(
      {Key? key,
        required this.title,
        required this.date,
        required this.content})
      : super(key: key);
  final String title;
  final String date;
  final String content;

  @override
  _OrgNoticeState createState() => _OrgNoticeState();
}

class _OrgNoticeState extends State<OrgNotice> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      elevation: 1, // 그림자 효과
      expandedHeaderPadding: EdgeInsets.all(0),
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          this.isExpanded = !isExpanded;
        });
      },
      children: [
        ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    widget.date,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            );
          },
          body: Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Text(
              widget.content, // 공지 내용 표시
              style: TextStyle(color: Colors.black),
            ),
          ),
          isExpanded: isExpanded,
        ),
      ],
    );
  }
}
