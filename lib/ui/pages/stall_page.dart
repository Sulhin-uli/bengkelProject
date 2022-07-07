import 'package:flutter/material.dart';
import 'package:projek_bengkel/core/providers/mekanik_provider.dart';
import 'package:provider/provider.dart';

class StallPage extends StatefulWidget {
  const StallPage({
    Key? key,
    this.id,
    this.idStall,
  }) : super(key: key);
  final int? id;
  final int? idStall;

  @override
  State<StallPage> createState() => _StallPageState();
}

class _StallPageState extends State<StallPage> {
  int _radioValue = 0;

  @override
  void initState() {
    _radioValue = widget.idStall!;
  }

  void Function()? _handleRadioValueChange(int? value) {
    setState(() {
      _radioValue = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mekanikData = Provider.of<MekanikProvider>(context);
    // final TextEditingController m1C;
    final item = mekanikData.findById(widget.id!);
    final allStall = mekanikData.allStall;
    return Scaffold(
      appBar: AppBar(
        title: Text("Stall"),
        backgroundColor: Colors.grey,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: allStall.length,
          itemBuilder: (context, index) {
            final data = allStall[index];
            return InkWell(
              onTap: () {
                mekanikData.updateDataStall(item.id!, data.id!, data.code!);
                Navigator.of(context).pop();
              },
              child: Container(
                margin: EdgeInsets.all(16),
                child: Row(
                  children: [
                    Radio(
                      value: data.id!,
                      groupValue: _radioValue,
                      onChanged: (e) {
                        _handleRadioValueChange(data.id!);
                        mekanikData.updateDataStall(
                            item.id!, data.id!, data.code!);
                        Navigator.of(context).pop();
                      },
                    ),
                    Icon(
                      Icons.location_on_sharp,
                      color: Colors.blue,
                    ),
                    Text(
                      data.code!,
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
