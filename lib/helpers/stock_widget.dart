import 'package:flutter/material.dart';
import 'package:news/helpers/responsive.dart';
import 'package:news/helpers/stock_request.dart';
import 'package:news/models/stock.dart';

class StockWidget extends StatefulWidget {
  @override
  _StockWidgetState createState() => _StockWidgetState();
}

class _StockWidgetState extends State<StockWidget> {
  List<Stock> c;

  void fetchStock() async {
    var x = await Market().getStock();
    setState(() {
      c = x;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchStock();
  }

  @override
  Widget build(BuildContext context) {
    return c == null
        ? SizedBox()
        : Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  margin:
                      EdgeInsets.only(left: Responsive.w(8), right: Responsive.w(4), top: Responsive.w(5), bottom: Responsive.w(5)),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12.withOpacity(0.15),
                          spreadRadius: 1,
                          blurRadius: 6,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.black12,
                        width: 1,
                      )),
                  padding: EdgeInsets.only(left: Responsive.w(16), top: Responsive.w(10),bottom: Responsive.w(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(c[0].stock,
                          style:
                              TextStyle(color: Colors.black54, fontSize: Responsive.w(16))),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: <Widget>[
                          Text(c[0].price.round().toString() + " ",
                              style: TextStyle(
                                  color: Colors.black87, fontSize: Responsive.w(32))),
                          c[0].change >= 0
                              ? Icon(
                                  Icons.trending_up,
                                  color: Colors.green,
                                  size: Responsive.w(40),
                                )
                              : Icon(
                                  Icons.trending_down,
                                  color: Colors.red,
                                  size: Responsive.w(40),
                                )
                        ],
                      ),
                      c[0].change >= 0
                          ? Row(
                              children: <Widget>[
                                Text("+" + c[0].change.toStringAsFixed(1) + "    ",
                                    style: TextStyle(
                                        color: Colors.green, fontSize: Responsive.w(18))),
                                Text("+" + c[0].perChange.toString() + "%",
                                    style: TextStyle(
                                        color: Colors.green, fontSize: Responsive.w(18))),
                              ],
                            )
                          : Row(
                              children: <Widget>[
                                Text(c[0].change.toStringAsFixed(1) + "    ",
                                    style: TextStyle(
                                        color: Colors.red, fontSize: Responsive.w(18))),
                                Text(c[0].perChange.toString() + "%",
                                    style: TextStyle(
                                        color: Colors.red, fontSize: Responsive.w(18))),
                              ],
                            )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  margin:
                      EdgeInsets.only(left: Responsive.w(4), right: Responsive.w(8), top: Responsive.w(5), bottom: Responsive.w(5)),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12.withOpacity(0.15),
                          spreadRadius: 1,
                          blurRadius: 6,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.black12,
                        width: 1,
                      )),
                  padding: EdgeInsets.only(left: Responsive.w(16), top: Responsive.w(10),bottom: Responsive.w(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(c[1].stock,
                          style:
                              TextStyle(color: Colors.black54, fontSize: Responsive.w(16))),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(c[1].price.round().toString() + " ",
                              style: TextStyle(
                                  color: Colors.black87, fontSize: Responsive.w(32))),
                          c[1].change >= 0
                              ? Icon(
                                  Icons.trending_up,
                                  color: Colors.green,
                                  size: Responsive.w(40),
                                )
                              : Icon(
                                  Icons.trending_down,
                                  color: Colors.red,
                                  size: Responsive.w(40),
                                )
                        ],
                      ),
                      c[1].change >= 0
                          ? Row(
                              children: <Widget>[
                                Text("+" + c[1].change.toStringAsFixed(1) + "    ",
                                    style: TextStyle(
                                        color: Colors.green, fontSize: Responsive.w(18))),
                                Text("+" + c[1].perChange.toString() + "%",
                                    style: TextStyle(
                                        color: Colors.green, fontSize: Responsive.w(18))),
                              ],
                            )
                          : Row(
                              children: <Widget>[
                                Text(c[1].change.round().toStringAsFixed(1) + "    ",
                                    style: TextStyle(
                                        color: Colors.red, fontSize: Responsive.w(18))),
                                Text(c[1].perChange.toString() + "%",
                                    style: TextStyle(
                                        color: Colors.red, fontSize: Responsive.w(18))),
                              ],
                            )
                    ],
                  ),
                ),
              ),
            ],
          );
  }
}
