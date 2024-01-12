import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_crud_app_with_rest_api/style/style.dart';

class ProductCreateScreen extends StatefulWidget {
  const ProductCreateScreen({super.key});

  @override
  State<ProductCreateScreen> createState() => _ProductCreateScreenState();
}

class _ProductCreateScreenState extends State<ProductCreateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CRUD App"),
        backgroundColor: Colors.white30,
      ),
      body: Stack(
        children: [
          ScreenBackground(context),
          Container(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  TextFormField(
                    onChanged: (value) {},
                    decoration: AppinputDeceration('Product Name'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    onChanged: (value) {},
                    decoration: AppinputDeceration('Product Code'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    onChanged: (value) {},
                    decoration: AppinputDeceration('Product Image'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    onChanged: (value) {},
                    decoration: AppinputDeceration('Unit Price'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    onChanged: (value) {},
                    decoration: AppinputDeceration('Total Price'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AppDropdownstyle(
                    DropdownButton(
                        value: "1 pcs",
                        items: [
                          DropdownMenuItem(
                            child: Text("Select Qt"),
                            value: "",
                          ),
                          DropdownMenuItem(
                            child: Text("1 pcs"),
                            value: "1 pcs",
                          ),
                          DropdownMenuItem(
                            child: Text("2 pcs"),
                            value: "2 pcs",
                          ),
                          DropdownMenuItem(
                            child: Text("3 pcs"),
                            value: "3 pcs",
                          ),
                          DropdownMenuItem(
                            child: Text("4 pcs"),
                            value: "4 pcs",
                          ),
                        ],
                        isExpanded: true,
                        underline: Container(),
                        onChanged: (value) {}),
                  ),
                  SizedBox(height: 10,),
                  Container(
                      width: double.infinity,
                      child: ElevatedButton(
                          style: Appbuttonstyle(),
                          onPressed: (){}, child: Text("Submit"))),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
