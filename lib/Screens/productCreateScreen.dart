
import 'package:flutter/material.dart';
import 'package:simple_crud_app_with_rest_api/style/style.dart';

import '../rest_Api/restclient.dart';

class ProductCreateScreen extends StatefulWidget {
  const ProductCreateScreen({super.key});

  @override
  State<ProductCreateScreen> createState() => _ProductCreateScreenState();
}

class _ProductCreateScreenState extends State<ProductCreateScreen> {
  Map<String, String> Formvalues = {
    "Img": "",
    "ProductCode": "",
    "ProductName": "",
    "Qty": "",
    "TotalPrice": "",
    "UnitPrice": ""
  };
InputOnChange (Mapkey, Textvalue) {
  setState(() {
    Formvalues.update(Mapkey, (value) => Textvalue);
  });
}
FormOnSubmit() async{
  if(Formvalues['Img']!.length==0) {
      errorToast("Image Link Required!");
  }
  else if(Formvalues['ProductCode']!.length==0) {
    errorToast("Product Code Required!");
  }
  else if(Formvalues['ProductName']!.length==0) {
    errorToast("Product Name Required!");
  }
  else if(Formvalues['Qty']!.length==0) {
    errorToast("Product Quantity Required!");
  }
  else if(Formvalues['TotalPrice']!.length==0) {
    errorToast("Total Price Required!");
  }
  else if(Formvalues['UnitPrice']!.length==0) {
    errorToast("Unit Price Required!");
  }
  else {
    // Data Rest Api ... post
   await ProductCreateRequest(Formvalues);
  }
}
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
                    onChanged: (Textvalue) {
                      InputOnChange("ProductName", Textvalue);
                    },
                    decoration: AppinputDeceration('Product Name'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    onChanged: (Textvalue) {
                      InputOnChange("ProductCode", Textvalue);
                    },
                    decoration: AppinputDeceration('Product Code'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    onChanged: (Textvalue) {
                      InputOnChange("Img", Textvalue);
                    },
                    decoration: AppinputDeceration('Product Image'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    onChanged: (Textvalue) {
                      InputOnChange("UnitPrice", Textvalue);
                    },
                    decoration: AppinputDeceration('Unit Price'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    onChanged: (Textvalue) {
                      InputOnChange("TotalPrice", Textvalue);
                    },
                    decoration: AppinputDeceration('Total Price'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AppDropdownstyle(
                    DropdownButton(
                        value: Formvalues["Qty"],
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
                        onChanged: (Textvalue) {
                          InputOnChange("Qty", Textvalue);
                        }),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      // width: double.infinity,
                      child: ElevatedButton(
                    style: Appbuttonstyle(),
                    onPressed: () {
                      FormOnSubmit();
                    },
                    child: SuccessButtonChild("Submit"),
                  )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
