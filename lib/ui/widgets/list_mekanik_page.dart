import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:projek_bengkel/core/models/mekanik_model.dart';
import 'package:projek_bengkel/core/providers/mekanik_provider.dart';
import 'package:projek_bengkel/ui/pages/detail_page.dart';
import 'package:provider/provider.dart';

class ListMekanik extends StatefulWidget {
  const ListMekanik({
    Key? key,
  }) : super(key: key);

  @override
  State<ListMekanik> createState() => _ListMekanikState();
}

class _ListMekanikState extends State<ListMekanik> {
  bool _isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // print(_isLoading);
    Timer(Duration(seconds: 3), () {
      // print("Yeah, this line is printed after 3 seconds");
      _isLoading = false;
      setState(() {});
      // print(_isLoading);
    });
  }

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    // final TextEditingController m1C;
    final mekanikData = Provider.of<MekanikProvider>(context);
    final allMekanik = mekanikData.allMekanik;
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: allMekanik.length,
      itemBuilder: (context, index) {
        final data = allMekanik[index];
        Map<String, dynamic> item = {
          "plat": "a",
          "stallId": "1",
          "stallCode": "a",
          "isProgress": "true",
        };

        for (var i = 1; i <= 28; i++) {
          if (data.id! == i) {
            try {
              setState(() {
                item =
                    box.read("mekanik-" + i.toString()) as Map<String, dynamic>;
              });
            } catch (e) {}
          }
        }

        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => DetailPage(
                  id: data.id!,
                  progress: item["isProgress"] == "true" ? 1 : 2,
                ),
              ),
            ).then((value) {
              setState(() {});
            });
          },
          child: (_isLoading)
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  color: (item["isProgress"] == "false")
                      ? Colors.green
                      : Colors.red,
                  // margin: const EdgeInsets.symmetric(horizontal: 10),
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
                  width: double.infinity,
                  height: 150,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Image.asset(data.image!),
                      ),
                      const SizedBox(width: 20),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data.name!),
                          const SizedBox(height: 5),
                          // Text(data.stall!.code!),
                          (item["stallCode"] == null)
                              ? Text(data.stall!.code!)
                              : Text(item["stallCode"]),
                          const SizedBox(height: 5),
                          // Text(data.plat!),
                          (item["plat"] == null)
                              ? Text(data.plat!)
                              : Text(item["plat"]),
                          const SizedBox(height: 5),
                          (item["isProgress"] == null)
                              ? Text("PROGRESS")
                              : (item["isProgress"] == "true")
                                  ? Text("PROGRESS")
                                  : Text("FINAL INSPECTION"),
                        ],
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
