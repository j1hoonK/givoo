import 'package:flutter/material.dart';
import 'package:givoo/provider/DonationProvider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../component/view/appbar.dart';
import '../../../component/view/com_dnthistory_view.dart';
import '../../../config/palette.dart';

class DonationHistory extends StatefulWidget {
  const DonationHistory({super.key});

  @override
  State<DonationHistory> createState() => _DonationHistoryState();
}

class _DonationHistoryState extends State<DonationHistory> {
  @override
  void initState() {
    super.initState();
    Provider.of<DonationProvider>(context, listen: false).loadDonation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppbar(
          //title: '기부 이력 확인',
          ),
      body: Consumer<DonationProvider>(builder: (context, provider, child) {
        if (provider.donation.isNotEmpty) {
          return Column(
            children: [
              /*Padding(
                padding: const EdgeInsets.all(30.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.black,
                      )),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '기부 이력 확인',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),*/
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return DntHistory(dnt: provider.donation[index]);
                  },
                  itemCount: provider.donation.length,
                ),
              ),
            ],
          );
        } else {
          return Center(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 60),
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/person.png'),
                    ),
                  ),
                ),
                Text(
                  "기부 이력이 없습니다.",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 15),
                TextButton(
                    onPressed: () {
                      context.go('/main');
                    },
                    child: Text(
                      '기부하러 가기',
                      style: TextStyle(color: Palette.mainColor),
                    ))
              ],
            ),
          );
        }
      }),
    );
  }
}
