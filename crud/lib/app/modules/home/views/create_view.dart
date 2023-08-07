import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../controllers/home_controller.dart';

class CreateView extends StatefulWidget {
  @override
  _CreateViewState createState() => _CreateViewState();
}

class _CreateViewState extends State<CreateView> {
  final HomeController _controller = Get.find<HomeController>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _cnicController = TextEditingController();
  late File _selectedImage;

  void _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
      });
    }
  }

  void _createUser() async {
    String name = _nameController.text.trim();
    String cnic = _cnicController.text.trim();

    if (name.isNotEmpty && cnic.isNotEmpty && _selectedImage != null) {
      await _controller.createUser(name, cnic, _selectedImage);
      Get.back(); // Navigate back to the home view after user creation
    } else {
      // Show an error message if any field is empty
      Get.snackbar(
        'Error',
        'Please fill all fields and select an image.',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: Duration(seconds: 3),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create User'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _cnicController,
              decoration: InputDecoration(labelText: 'CNIC'),
            ),
            SizedBox(height: 20),
            _buildImagePickerButton(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _createUser,
              child: Text('Create User'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImagePickerButton() {
    return Column(
      children: [
        _selectedImage != null
            ? Image.file(
                _selectedImage,
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              )
            : Container(),
        SizedBox(height: 10),
        ElevatedButton.icon(
          onPressed: _pickImage,
          icon: Icon(Icons.upload),
          label: Text('Select Image'),
        ),
      ],
    );
  }
}
