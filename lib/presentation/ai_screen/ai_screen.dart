import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';

import '../resources/color_manager.dart';

class AiScreen extends StatefulWidget {
  const AiScreen({super.key});

  @override
  _AiScreenState createState() => _AiScreenState();
}

class _AiScreenState extends State<AiScreen> {
  File? _pickedImage;
  String? _medicineName;

  Future<void> _pickImage(ImageSource source) async {
    final pickedImage = await ImagePicker().getImage(source: source);
    setState(() {
      _pickedImage = File(pickedImage!.path);
      _medicineName = null; // Reset the medicine name
    });
    _extractTextFromImage();
  }

  Future<void> _extractTextFromImage() async {
    final image = InputImage.fromFilePath(_pickedImage!.path);
    final textDetector = GoogleMlKit.vision.textRecognizer();
    final RecognizedText recognisedText = await textDetector.processImage(image);

    String medicineName = '';
    for (TextBlock block in recognisedText.blocks) {
      for (TextLine line in block.lines) {
        medicineName += line.text;
      }
    }

    setState(() {
      _medicineName = medicineName;
    });

    textDetector.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff283DAA),
        title: const Text('Text reader'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_pickedImage != null)
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: FileImage(_pickedImage!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            if (_medicineName != null)
              Text(
                'Medicine Name: $_medicineName',
                style: TextStyle(fontSize: 18),
              ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    ColorManager.primary), // Set the desired color here
              ),
              onPressed: () => _pickImage(ImageSource.camera),
              child: Text('Take Photo'),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    ColorManager.primary), // Set the desired color here
              ),
              onPressed: () => _pickImage(ImageSource.gallery),
              child: Text('Choose from Gallery'),
            ),
          ],
        ),
      ),
    );
  }
}
