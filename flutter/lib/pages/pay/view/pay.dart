import 'package:flutter/material.dart';
import 'package:givoo/component/view/com_dnt_type_list.dart';
import 'package:givoo/provider/DonationProvider.dart';
import 'package:givoo/provider/PayCategoryProvider.dart';
import 'package:provider/provider.dart';

class Pay extends StatefulWidget {
  Pay({super.key, required this.orgId});

  var orgId;

  @override
  State<Pay> createState() => _PayState();
}

class _PayState extends State<Pay> {
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Consumer<DonationProvider>(
      builder: (context, value, child) => Column(
            children: [
              SizedBox(height: height * 0.03,),
              Form(
                key: formKey,
                child: value.typeInfo.isEmpty
                  ? FreeDonation()
                    : Column(
                  children: [
                    ListView.builder(
                      itemCount: value.typeInfo.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return DntTypeList(
                          dntType: value.typeInfo[index].type,
                          pay: value.typeInfo[index].defaultPay,
                        );
                      },
                    ),
                    FreeDonation(),
                  ],
                ),
              ),
              SizedBox(height: height * 0.03,),
              Consumer<PayCategoryProvider>(
                builder: (context, provider, child) {
                  return SizedBox(
                    width: width * 1,
                    height: height * 0.07,
                    child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {}
                      },
                      child: Text('후원하기'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: provider.abc != "" && provider.num != null
                            ? Colors.pinkAccent
                            : Colors.grey,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
    );
  }
}
