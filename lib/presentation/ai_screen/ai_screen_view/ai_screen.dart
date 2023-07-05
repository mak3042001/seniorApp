import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:senior/app/IconBroken.dart';
import 'package:senior/app/di.dart';
import 'package:senior/domain/model/model.dart';
import 'package:senior/presentation/ai_screen/ai_screen_view_model/ai_screen_viewModel.dart';

import '../../common/state_renderer/state_renderer__impl.dart';
import '../../resources/color_manager.dart';

class AiScreen extends StatefulWidget {
  const AiScreen({super.key});

  @override
  _AiScreenState createState() => _AiScreenState();
}

class _AiScreenState extends State<AiScreen> {
  FlutterTts flutterTts = FlutterTts();
  final AiViewModel _viewModel = instance<AiViewModel>();
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
  void initState() {
    super.initState();
    initTts();
  }

  Future<void> initTts() async {
    await flutterTts.setLanguage('en-US');
    await flutterTts.setSpeechRate(0.8);
    await flutterTts.setVolume(1.0);
    await flutterTts.setPitch(1.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff283DAA),
        title: const Text('Text reader'),
      ),
      body: Center(
        child: SingleChildScrollView(
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
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Medicine Name: $_medicineName',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: ColorManager.black
                  ),
                ),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      ColorManager.primary), // Set the desired color here
                ),
                onPressed: () => _pickImage(ImageSource.camera),
                child: const Text('Take Photo'),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      ColorManager.primary), // Set the desired color here
                ),
                onPressed: () => _pickImage(ImageSource.gallery),
                child: const Text('Choose from Gallery'),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      ColorManager.primary), // Set the desired color here
                ),
                onPressed: () =>_medicineName == null ? null : _viewModel.showDetails(_medicineName!),
                child: const Text('Show Details'),
              ),
              const SizedBox(
                height: 20.0,
              ),
              StreamBuilder<FlowState>(
                stream: _viewModel.outputState,
                builder: (context, snapshot) {
                  return Container(
                    child:
                    snapshot.data?.getScreenWidget(context, _getContentWidget(), () {
                      _viewModel.start();
                    }) ??
                        Container(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _getContentWidget() {
    return StreamBuilder<Medication>(
      stream: _viewModel.outputAi,
      builder: (context, snapshot) {
        return _getItem(snapshot.data);
      },
    );
  }

  Widget _getItem(Medication? medication) {
    if (medication != null) {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                "Name : ${medication.data!.medication}",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: ColorManager.darkPrimary
              ),
            ),
            const SizedBox(height: 10.0,),
            Text(
                "Dose : ${medication.data!.medicationDose}",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: ColorManager.darkPrimary
              ),
            ),
            const SizedBox(height: 10.0,),
            Text(
                "Description : ${medication.data!.description}",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: ColorManager.darkPrimary
              ),
            ),
            const SizedBox(height: 10.0,),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    ColorManager.primary), // Set the desired color here
              ),
              onPressed: () {
                _speak("Name : ${medication.data!.medication} , Dose : ${medication.data!.medicationDose} , Description : ${medication.data!.description}");
              },
              child: const Row(
                children: [
                  Text('Show Details'),
                  Icon(Icons.mic),
                ],
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    ColorManager.primary), // Set the desired color here
              ),
              onPressed: () {
                flutterTts.stop();
              },
              child: const Row(
                children: [
                  Text('Stop'),
                  Icon(Icons.mic_off),
                ],
              ),
            ),
          ],
        ),
      );
    } else {
      return Container();
    }
  }

  Future<void> _speak(String text) async {
    await flutterTts.speak(text);
  }

  @override
  void dispose() {
    super.dispose();
    flutterTts.stop();
    _viewModel.dispose();
  }
}
