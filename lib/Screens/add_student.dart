// import 'dart:io';
// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:studentapp/Functions/add_or_edit.dart';
// import 'package:studentapp/Functions/image_picker.dart';
// import 'package:studentapp/db_model/model.dart';
// import 'package:studentapp/widgets/confitmation_box.dart';
// import 'package:studentapp/widgets/custom_text_field.dart';
// import 'package:studentapp/widgets/image_circle.dart';

// // ignore: must_be_immutable
// class AddStudent extends StatelessWidget {
//   String name;
//   String? age;
//   String? place;
//   String? phone;
//   String title;
//   int? id;
//   final TextEditingController nameController;
//   final TextEditingController ageController;
//   final TextEditingController placeController;
//   final TextEditingController phoneController;
//   final String existingname;
//   AddStudent(
//       {super.key,
//       required this.title,
//       this.name = '',
//       this.age,
//       this.place,
//       this.phone,
//       this.id})
//       : nameController = TextEditingController(text: name),
//         ageController = TextEditingController(text: age ?? ''),
//         phoneController = TextEditingController(text: phone ?? ""),
//         placeController = TextEditingController(text: place ?? ""),
//         existingname = name;

//   @override
//   Widget build(BuildContext context) {
//     File? imagepath;
//     ImagePickerService imagepickerservice = ImagePickerService();

//     // final studentProvider = Provider.of<AddStudentProvider>(context);
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         title: Center(child: Text(title)),
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 ImageCircle(
//                   onImagePicked: () async {
//                     imagepath = await imagepickerservice.pickImageFromGallery();
//                     print(imagepath);
//                   },
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 CustomTextField(
//                   ageController: nameController,
//                   hint: 'Name',
//                   isnumber: false,
//                 ),
//                 const SizedBox(height: 10),
//                 CustomTextField(
//                   ageController: ageController,
//                   hint: 'Age',
//                   isnumber: true,
//                 ),
//                 const SizedBox(height: 10),
//                 CustomTextField(
//                   ageController: placeController,
//                   hint: "Place",
//                   isnumber: false,
//                 ),
//                 const SizedBox(height: 10),
//                 CustomTextField(
//                   ageController: phoneController,
//                   hint: 'Phone',
//                   isnumber: true,
//                 ),
//                 const SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: () async {
//                     String name = nameController.text.trim();
//                     String age = ageController.text.trim();
//                     String place = placeController.text.trim();
//                     String phone = phoneController.text.trim();

//                     if (name.isEmpty ||
//                         age.isEmpty ||
//                         place.isEmpty ||
//                         phone.isEmpty) {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         const SnackBar(
//                           content: Text('Please fill in all fields'),
//                         ),
//                       );
//                       return;
//                     }

//                     int newid = Random().nextInt(100000);
//                     print(imagepath.toString());
//                     studentmodel student = studentmodel(
//                         age: age,
//                         name: name,
//                         email: place,
//                         phone: phone,
//                         id: id ?? newid,
//                         image: imagepath?.path ?? '');
//                     await addOrEdit(title, context, student, id ?? newid);
//                    await showConfirmationDialog(context, '', 'secondtext', '');
//                     Navigator.pop(context);
//                   },
//                   child: const Text('Submit'),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Future<bool> showConfirmationDialog(BuildContext context, String firsttext,
//       String secondtext, String title) async {
//     bool confirmed = false;
//     await showDialog<void>(
//       context: context,
//       barrierDismissible: false,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text("StudentAdded Successfully"),
//           content: SingleChildScrollView(
//             child: ListBody(
//               children: <Widget>[
//                 Text(firsttext),
//               ],
//             ),
//           ),
//           actions: <Widget>[
//             TextButton(
//               child: Text('Confirm'),
//               onPressed: () {
//                 confirmed = false;
//                 Navigator.of(context).pop();
//               },
//             ),
//             TextButton(
//               child: Text('cancel'),
//               onPressed: () {
//                 confirmed = true;
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//     return confirmed;
//   }
// }

import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:studentapp/Functions/add_or_edit.dart';
import 'package:studentapp/Functions/image_picker.dart';
import 'package:studentapp/db_model/model.dart';
import 'package:studentapp/widgets/confirmation_box.dart';
import 'package:studentapp/widgets/custom_text_field.dart';
import 'package:studentapp/widgets/image_circle.dart';

// ignore: must_be_immutable
class AddStudent extends StatelessWidget {
  final String name;
  String? age;
  final String? place;
  final String? phone;
  final String title;
  final int? id;
  final TextEditingController nameController;
  final TextEditingController ageController;
  final TextEditingController placeController;
  final TextEditingController phoneController;
  final String existingname;

  AddStudent({
    super.key,
    required this.title,
    this.name = '',
    this.age,
    this.place,
    this.phone,
    this.id,
  })  : nameController = TextEditingController(text: name),
        ageController = TextEditingController(text: age ?? ''),
        phoneController = TextEditingController(text: phone ?? ""),
        placeController = TextEditingController(text: place ?? ""),
        existingname = name;

  @override
  Widget build(BuildContext context) {
    File? imagepath;
    ImagePickerService imagepickerservice = ImagePickerService();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(child: Text(title)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ImageCircle(
                  onImagePicked: () async {
                    imagepath = await imagepickerservice.pickImageFromGallery();
                    print(imagepath);
                  },
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  ageController: nameController,
                  hint: 'Name',
                  isnumber: false,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  ageController: ageController,
                  hint: 'Age',
                  isnumber: true,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  ageController: placeController,
                  hint: "Place",
                  isnumber: false,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  ageController: phoneController,
                  hint: 'Phone',
                  isnumber: true,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    String name = nameController.text.trim();
                    String age = ageController.text.trim();
                    String place = placeController.text.trim();
                    String phone = phoneController.text.trim();

                    if (name.isEmpty ||
                        age.isEmpty ||
                        place.isEmpty ||
                        phone.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please fill in all fields'),
                        ),
                      );
                      return;
                    }

                    int newid = Random().nextInt(100000);
                    print(imagepath.toString());
                    studentmodel student = studentmodel(
                      age: age,
                      name: name,
                      email: place,
                      phone: phone,
                      id: id ?? newid,
                      image: imagepath?.path ?? '',
                    );

                    await addOrEdit(title, context, student, id ?? newid);
                    Navigator.pop(context);
                    await showConfirmationDialog(
                      context,
                      'successfully completed \n Student Id: ${id ?? newid}',
                      '',
                      title,
                    );
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
