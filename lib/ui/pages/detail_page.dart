import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:projek_bengkel/core/models/mekanik_model.dart';
import 'package:projek_bengkel/core/providers/mekanik_provider.dart';
import 'package:projek_bengkel/ui/pages/home_page.dart';
import 'package:projek_bengkel/ui/pages/stall_page.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    Key? key,
    this.id,
    this.progress,
  }) : super(key: key);

  final int? progress;
  final int? id;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final box = GetStorage();

  int _radioValue = 0;
  TextEditingController platController = TextEditingController();

  @override
  void initState() {
    _radioValue = widget.progress!;
  }

  void Function()? _handleRadioValueChange(int? value, String platNomor) {
    setState(() {
      _radioValue = value!;
      platController.text = platNomor;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mekanikData = Provider.of<MekanikProvider>(context);
    final item = mekanikData.findById(widget.id!);
    if (item.plat == platController.text || platController.text.isEmpty) {
      platController.text = item.plat!;
    }
    mekanikData.setplatNomor = platController.text;
    platController.text = item.plat!;

    for (var i = 1; i <= 28; i++) {
      if (item.id == i) {
        try {
          final items =
              box.read("mekanik-" + i.toString()) as Map<String, dynamic>;
          platController.text = items["plat"];
        } catch (e) {
          print(e);
        }
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),
            const Center(
              child: Text(
                "DETAIL",
                style: TextStyle(fontSize: 22),
              ),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        for (var i = 1; i <= 28; i++) {
                          if (item.id == i) {
                            try {
                              final items = box.read("mekanik-" + i.toString())
                                  as Map<String, dynamic>;

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => StallPage(
                                    idStall: int.parse(items["stallId"] == null
                                        ? item.stall!.id.toString()
                                        : items["stallId"]),
                                    id: item.id!,
                                  ),
                                ),
                              );
                            } catch (e) {
                              print(e);
                            }
                          }
                        }
                      },
                      child: Row(
                        children: [
                          Text("STALL"),
                          SizedBox(width: 5),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on_sharp,
                                color: Colors.blue,
                              ),
                              Text(
                                item.stall!.code!,
                                style: TextStyle(color: Colors.blue),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Text("PLAT NOMOR  "),
                        SizedBox(
                          width: 100,
                          height: 20,
                          child: TextField(
                            controller: platController,
                            decoration: InputDecoration(
                              hintText: "Masukkan Plat",
                              hintStyle: const TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          width: 150,
                          height: 50,
                          child: ElevatedButton(
                            style:
                                ElevatedButton.styleFrom(primary: Colors.red),
                            onPressed: () {},
                            child: Row(
                              children: [
                                Radio(
                                  value: 1,
                                  groupValue: _radioValue,
                                  onChanged: (e) {
                                    _handleRadioValueChange(
                                        1, platController.text);
                                  },
                                ),
                                Expanded(
                                  child: Text(
                                    "PROGRESS",
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          width: 150,
                          height: 50,
                          child: ElevatedButton(
                            style:
                                ElevatedButton.styleFrom(primary: Colors.green),
                            onPressed: () {},
                            child: Row(
                              children: [
                                Radio(
                                  value: 2,
                                  groupValue: _radioValue,
                                  onChanged: (e) {
                                    _handleRadioValueChange(
                                        2, platController.text);
                                  },
                                ),
                                Expanded(
                                    child: Text(
                                  "FINAL INSPECTION",
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                )),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  width: 150,
                  height: 50,
                  child: ElevatedButton(
                    // style: ElevatedButton.styleFrom(primary: Colors.red),
                    onPressed: () {
                      for (var i = 1; i <= 28; i++) {
                        if (item.id == i) {
                          setState(() {
                            box.write('mekanik-' + i.toString(), {
                              "plat": platController.text,
                              "stallCode": item.stall!.code!,
                              "isProgress": _radioValue == 1 ? "true" : "false",
                            });
                          });
                        }
                      }

                      Navigator.of(context).pop();
                    },
                    child: Text("SAVE"),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  width: 150,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      "KEMBALI",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
