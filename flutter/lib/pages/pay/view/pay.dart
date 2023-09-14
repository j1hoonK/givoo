import 'package:flutter/material.dart';
import 'package:givoo/component/view/appbar.dart';
import 'package:givoo/provider/PayCategoryProvider.dart';
import 'package:provider/provider.dart';

class Pay extends StatelessWidget {
  Pay({super.key});
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: BaseAppbar(
        title: "후원하기",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                height: 200,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  "후원 금액 입력",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Form(
                key: formKey,
                child: Consumer<PayCategoryProvider>(
                  builder: (context, provider, child) {
                    return Column(
                      children: [
                        Stack(
                          children: [
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "후원할 금액을 입력해주세요";
                                }
                                return null;
                              },
                              onChanged: (test) {
                                provider.selectedString(test);
                              },
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.right,
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(right: 15),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                    ),
                                  )),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 13),
                              alignment: Alignment.topRight,
                              child: Text(
                                "원",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 60,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "후원 수단 선택",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 250,
                          child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: provider.payCategory.length,
                              itemBuilder: (context, idx) {
                                return RadioListTile(
                                    title: Text("${provider.payCategory[idx]}"),
                                    value: idx,
                                    groupValue: provider.num,
                                    onChanged: (value) {
                                      provider.selectedPay(value);
                                    });
                              }),
                        ),
                        SizedBox(
                          width: width * 1,
                          child: ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {}
                            },
                            child: Text('후원하기'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                              provider.abc != "" && provider.num != null
                                  ? Colors.pinkAccent
                                  : Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
