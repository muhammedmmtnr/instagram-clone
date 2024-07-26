import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class AddPostPage extends StatefulWidget {
  const AddPostPage({Key? key}) : super(key: key);

  @override
  State<AddPostPage> createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {
  File? _image;
  TextEditingController _descriptionController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  bool _isLoading = false;

  Future<void> _uploadImage() async {
    try {
      final user = _auth.currentUser;

      if (_image != null && user != null) {
        setState(() {
          _isLoading = true;
        });

        final imageRef =
            _storage.ref().child('posts/${user.uid}/${DateTime.now()}.jpg');
        await imageRef.putFile(_image!);

        final imageUrl = await imageRef.getDownloadURL();

        await _firestore.collection("posts").add({
          'user_id': user.uid,
          'description': _descriptionController.text,
          'image_url': imageUrl,
          'timestamp': FieldValue.serverTimestamp(),
        });
      }
      setState(() {
        _image = null;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      print("$e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton(
            onPressed: () {
              _uploadImage();
            },
            child: _isLoading ? CircularProgressIndicator() : Text("POST"),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (_image != null)
              Center(
                child: FittedBox(
                  child: Container(
                    height: 600,
                    width: 300,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: FileImage(_image!)),
                    ),
                  ),
                ),
              )
            else
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 55),
                  child: ElevatedButton(
                    onPressed: () async {
                      final image = await ImagePicker().pickImage(
                        source: ImageSource.gallery,
                      );
                      setState(() {
                        if (image != null) {
                          _image = File(image.path);
                        }
                      });
                    },
                    child: Icon(Icons.add_a_photo),
                  ),
                ),
              ),
            Container(
              width: 250,
              child: TextField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Description",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
