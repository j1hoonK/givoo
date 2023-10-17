import 'package:flutter/material.dart';
import 'package:givoo/component/view/com_dnt_type_list.dart';
import 'package:givoo/provider/DonationProvider.dart';
import 'package:givoo/provider/PayCategoryProvider.dart';
import 'package:provider/provider.dart';

class Pay extends StatefulWidget {
  Pay({Key? key, required this.orgId}) : super(key: key);

  final orgId;

  @override
  State<Pay> createState() => _PayState();
}

class _PayState extends State<Pay> {
  final formKey = GlobalKey<FormState>();
  List<bool> checkboxStates = [];
  bool checkedOnFree = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    int typeCount = Provider.of<DonationProvider>(context).typeInfo.length;
    print('typeCount == $typeCount');
    checkboxStates = List.generate(typeCount, (index) => false);
    checkedOnFree = false;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Consumer<DonationProvider>(
      builder: (context, value, child) => GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Column(
          children: [
            SizedBox(height: height * 0.03),
            Form(
              key: formKey,
              child: value.typeInfo.isEmpty
                  ? FreeDonation(
                      checkedOnFree: checkedOnFree,
                      onChangedOnFree: (valueF) {
                        setState(() {
                          checkedOnFree = valueF ?? false;
                        });
                        print('checkedOnFree == $checkedOnFree');
                      })
                  : Column(
                      children: [
                        ListView.builder(
                          itemCount: value.typeInfo.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return DntTypeList(
                              isChecked: checkboxStates[index],
                              onChanged: (value) {
                                setState(() {
                                  checkboxStates[index] = value ?? false;
                                });
                              },
                              dntType: value.typeInfo[index].type,
                              pay: value.typeInfo[index].defaultPay,
                            );
                          },
                        ),
                        FreeDonation(
                            checkedOnFree: checkedOnFree,
                            onChangedOnFree: (valueF) {
                              setState(() {
                                checkedOnFree = valueF ?? false;
                              });
                              print('checkedOnFree == $checkedOnFree');
                            }),
                      ],
                    ),
            ),
            SizedBox(height: height * 0.03),
            SizedBox(
              width: width * 1,
              height: height * 0.07,
              child: ElevatedButton(
                onPressed:
                    checkboxStates.contains(true) || checkedOnFree == true
                        ? () {
                            if (formKey.currentState!.validate()) {}
                          }
                        : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      checkboxStates.contains(true) || checkedOnFree == true
                          ? Colors.pinkAccent
                          : Colors.grey,
                ),
                child: Text('후원하기'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
