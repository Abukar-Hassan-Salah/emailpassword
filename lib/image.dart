import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Uploadpicture extends StatefulWidget {
  const Uploadpicture({Key? key}) : super(key: key);

  @override
  State<Uploadpicture> createState() => _UploadpictureState();
}

class _UploadpictureState extends State<Uploadpicture> {
  File? _selectedImage;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  _pickImageFromGallery();
                },
                child: const Text("Pick Image from Gallery"),
              ),
              ElevatedButton(
                onPressed: () {
                  _pickImageFromCamera();
                },
                child: const Text("Pick Image from Camera"),
              ),
              const SizedBox(
                height: 20,
              ),
              _selectedImage != null
                  ? Image.file(_selectedImage!)
                  : const Text("Please select an image"),
              ElevatedButton(
                onPressed: () {
                  if (_selectedImage != null) {
                    _uploadImage();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("No image selected"),
                      ),
                    );
                  }
                },
                child: const Text("Upload Image"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future _pickImageFromGallery() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
      });
    }
  }

  Future _pickImageFromCamera() async {
    final pickedImage = await picker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
      });
    }
  }

  Future<void> _uploadImage() async {
    final Reference storageReference = FirebaseStorage.instance
        .ref()
        .child('images/${DateTime.now().millisecondsSinceEpoch}.jpg');
    final UploadTask uploadTask = storageReference.putFile(_selectedImage!);
    final TaskSnapshot storageTaskSnapshot = await uploadTask;
    final imageUrl = await storageTaskSnapshot.ref.getDownloadURL();

    // Send the image URL to a destination of your choice
    _sendImageUrl(imageUrl);
  }

  void _sendImageUrl(String imageUrl) {
    print('The ImagUploaded To The DataBase: $imageUrl');
  }
}
