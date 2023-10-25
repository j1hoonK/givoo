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
  List<int> checkboxPay=[];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    int typeCount = Provider.of<DonationProvider>(context).typeInfo.length;
    print('typeCount == $typeCount');
    checkboxStates = List.generate(typeCount, (index) => false);
    checkboxPay=List.generate(typeCount+1, (index) => 0);
    checkedOnFree = false;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Consumer<DonationProvider>(
        builder: (context, provider, child) => GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Column(
            children: [
              SizedBox(height: height * 0.03),
              Form(
                key: formKey,
                child: provider.typeInfo.isEmpty
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
                            itemCount: provider.typeInfo.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return DntTypeList(
                                isChecked: checkboxStates[index],
                                onChanged: (value) {
                                  setState(() {
                                    checkboxStates[index] = value ?? false;
                                    checkboxPay[index]=value==true?int.parse(provider.typeInfo[index].defaultPay) : 0;
                                  });
                                },
                                dntType: provider.typeInfo[index].type,
                                pay: provider.typeInfo[index].defaultPay,
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
                              if (formKey.currentState!.validate()) {
                                checkboxPay.last=int.parse(FreeDonation.payment);
                                print("checkboxStates: ${checkboxStates}" );
                                print("checkboxStates: ${checkboxPay}" );
                                print("checkboxStates: ${checkboxPay}" );
                              }
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
      ),
    );
  }
}
