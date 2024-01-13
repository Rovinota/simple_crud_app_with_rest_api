import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../rest_Api/restclient.dart';
import '../style/style.dart';

class ProductGridviewScreen extends StatefulWidget {
  const ProductGridviewScreen({super.key});

  @override
  State<ProductGridviewScreen> createState() => _ProductGridviewScreenState();
}

class _ProductGridviewScreenState extends State<ProductGridviewScreen> {
  List ProductList = [];
  bool isLoading = true;

  void initState() {
    CallData();
    super.initState();
  }

  CallData() async {
    isLoading = true;
    var data = await ProductGridviewListRequest();
    setState(() {
      ProductList = data;
      isLoading = false;
    });
  }

  DeleteItem(id) async {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Delete!"),
              content: Text("Do you want to Delete?"),
              actions: [
                OutlinedButton(onPressed: () async {
                   Navigator.pop(context);
                   setState(() {
                     isLoading = true;
                   });
                   await ProductDeletRequest(id);
                   await CallData();
                }, child: Text("Yes")),
                OutlinedButton(onPressed: (){
                  Navigator.pop(context);
                }, child: Text("No")),
              ],
            );
          });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products List"),
      ),
      body: Stack(
        children: [
          Container(
              child: isLoading
                  ? (Center(
                      child: CircularProgressIndicator(),
                    ))
                  : RefreshIndicator(
                      child: (GridView.builder(
                          itemCount: ProductList.length,
                          gridDelegate: ProductGridviewStyle(),
                          itemBuilder: (context, index) {
                            return Card(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Expanded(
                                      child: Image.network(
                                    ProductList[index]['Img'],
                                    fit: BoxFit.fill,
                                  )),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(5, 5, 5, 8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(ProductList[index]['ProductName']),
                                        SizedBox(
                                          height: 7,
                                        ),
                                        Text('Price ' +
                                            ProductList[index]['UnitPrice'] +
                                            " BDT"),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            OutlinedButton(
                                                onPressed: () {},
                                                child: Icon(
                                                  CupertinoIcons
                                                      .ellipsis_vertical_circle,
                                                  size: 18,
                                                  color: ColourGreen,
                                                )),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            OutlinedButton(
                                                onPressed: () {
                                                  DeleteItem(ProductList[index]['_id']);
                                                },
                                                child: Icon(
                                                  CupertinoIcons.delete,
                                                  size: 18,
                                                  color: ColourRed,
                                                )),
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          })),
                      onRefresh: () async {
                        await CallData();
                      }))
        ],
      ),
    );
  }
}
