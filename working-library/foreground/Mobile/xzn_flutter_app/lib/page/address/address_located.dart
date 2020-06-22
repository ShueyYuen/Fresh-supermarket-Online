import 'package:amap_map_fluttify/amap_map_fluttify.dart';
import 'package:flutter/material.dart';
import 'package:xzn/models/amapNearItem.dart';
import 'package:xzn/models/selfNearItem.dart';
import 'package:xzn/widget/common/amap.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AddressLocated extends StatefulWidget {
  @override
  _AddressLocatedState createState() => _AddressLocatedState();
}

class _AddressLocatedState extends State<AddressLocated> {
  TextEditingController search_key = TextEditingController();
  int update = 0;
  LatLng position;
  List<SelfNearItem> candidate = List<SelfNearItem>();

  void positionChange(value) {
    print("回调");
    setState(() {
      this.position = value;
    });
    print("请求前");
    getNearAddress();
    print("请求后");
  }

  Future<List<Widget>> getNearAddress() async {
    List<AmapNearItem> near_list = new List<AmapNearItem>();
    String amap_api =
        "https://restapi.amap.com/v3/geocode/regeo?key=647f2f70270b2da46a9a02692ba3065c&location=" +
            position.longitude.toString() +
            "," +
            position.latitude.toString() +
            "&poitype=&radius=500&extensions=all&batch=true&roadlevel=0";
    print(amap_api);
    var res = await http.get(amap_api);
    var json = jsonDecode(res.body);
    for (var item in json["regeocodes"]) {
      try {
        AmapNearItem amapNearItem = AmapNearItem.fromJson(item);
        near_list.add(amapNearItem);
        for (var poi in amapNearItem.pois) {
          candidate.add(SelfNearItem.fromJson({
            "province": amapNearItem.addressComponent["province"],
            "city": amapNearItem.addressComponent["city"],
            "district": amapNearItem.addressComponent["district"],
            "township": amapNearItem.addressComponent["township"],
            "build": poi["name"]
          }));
          print(amapNearItem.addressComponent["city"]);
        }
      } catch (e) {
        print(e.toString());
      } finally {}
    }
    setState(() {
      update += 1;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("选择地址"),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            color: Colors.grey,
            height: 400,
            child: Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: AmapWidget(
                    positionChange: positionChange,
                  ),
                ),
                Container(
//                  height: 100,
                    padding: EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                    alignment: Alignment.bottomCenter,
                    child: Stack(
                      children: <Widget>[
                        Container(
//                          height: 50,
                          child: TextField(
                            controller: search_key,
                            textAlign: TextAlign.center,
                            textAlignVertical: TextAlignVertical.center,
                            scrollPadding: EdgeInsets.all(10.0),
                            maxLines: 1,
                            expands: false,
                            decoration: InputDecoration(
                              isDense: true,
                              fillColor: Color(0xeefafaff),
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                  gapPadding: 0,
                                  borderSide:
                                      BorderSide(color: Color(0x00FF0000)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100))),
                              hintText: '搜索附近',
                              focusedBorder: OutlineInputBorder(
                                  gapPadding: 0,
                                  borderSide:
                                      BorderSide(color: Color(0x00000000)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100))),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 5,
                          child: IconButton(
                            icon: Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              print(search_key.text);
                            },
                          ),
                        )
                      ],
                    )),
              ],
            ),
          ),
          ...this.candidate.map((pos) {
            return ListTile(
              leading: Container(
                height: 40,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Text(
                  "●",
                  style: TextStyle(fontSize: 10, color: Colors.grey[400]),
                ),
              ),
              title: Text(pos.build ?? ""),
              subtitle: Text((pos.province ?? "") + (pos.city ?? "")+(pos.district ?? "")+(pos.township ?? "")),
              onTap: () {
                Navigator.of(context).pop(pos);
              },
            );
          }),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
