import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:new_practice/utils/popup_menu/show_modal_bottom.dart';
import 'package:sizer/sizer.dart';

void showButtonSheet(BuildContext context) {
  final GlobalKey<FormBuilderState> keyy = GlobalKey<FormBuilderState>();
  final requestController = TextEditingController();
  final paymentController = TextEditingController();
  final nameController = TextEditingController();
  showAsBottomSheet(
    context: context,
    // height: 800,
    widget: Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            FormBuilder(
              key: keyy,
              onChanged: () {},
              child: Column(
                children: [
                  FormBuilderTextField(
                    controller: nameController,
                    name: 'name',
                    decoration: InputDecoration(
                        labelText: 'Name', icon: Icon(Icons.person)),
                  ),
                  SizedBox(
                    height: 3.0.h,
                  ),
                  FormBuilderTextField(
                    controller: requestController,
                    name: 'request',
                    decoration: InputDecoration(
                        labelText: 'Request',
                        icon: Icon(Icons.medical_services_outlined)),
                  ),
                  SizedBox(
                    height: 3.0.h,
                  ),
                  FormBuilderTextField(
                    controller: paymentController,
                    name: 'payment',
                    decoration: InputDecoration(
                        labelText: 'Payment', icon: Icon(Icons.money)),
                  ),
                ],
              ),
            ),
            // Image(image: Image.file('')),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Material(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    splashColor: Colors.blue[900],
                    // highlightColor: Colors.amber,

                    onTap: () async {
                      // if (userHomeBloc.file.value == null) {
                      //   return;
                      // }
                      // String id = Uuid().v4();
                      // final loc = new LocationModel(
                      //     id: id,
                      //     lat: userHomeBloc.mainLatLng.latitude,
                      //     long: userHomeBloc.mainLatLng.longitude,
                      //     imageName: id,
                      //     locName: nameController.text,
                      //     locDate: new DateTime.now(),
                      //     type: 1,
                      //     info: requestController.text);
                      // await userHomeBloc.sendData(
                      //     loc: loc,
                      //     folderName: 'uberLocations',
                      //     file: userHomeBloc.file.value,
                      //     imageName: id);
                    },
                    child: Container(
                      // color: Theme.of(context).primaryColor,
                      height: 50,
                      child: Center(
                        child: Text(
                          "Send Data",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                  elevation: 10,
                  color: Colors.purple),
            ),
          ]),
    ),
  );
}
