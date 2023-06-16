import 'package:flutter/material.dart';
import 'package:senior/app/IconBroken.dart';
import 'package:senior/domain/model/model.dart';
import 'package:senior/presentation/common/state_renderer/state_renderer__impl.dart';
import 'package:senior/presentation/medications_code/medication_code_viewModel/medication_code_viewModel.dart';
import 'package:senior/presentation/resources/color_manager.dart';

import '../../../app/di.dart';

class MedicationCodeView extends StatefulWidget {
  const MedicationCodeView({super.key});

  @override
  _MedicationCodeViewState createState() => _MedicationCodeViewState();
}
class _MedicationCodeViewState extends State<MedicationCodeView> {
  final MedicationsCodeViewModel _viewModel = instance<MedicationsCodeViewModel>();
  _blind() {
    _viewModel.start();
  }

  @override
  void initState() {
    _blind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff283DAA),
        title: const Text(
          "Medication Code",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            IconBroken.Arrow___Left_2,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
                  (){_viewModel.start();}.call();
            },
            icon: const Icon(
              Icons.refresh,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: StreamBuilder<FlowState>(
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
    );
  }

  Widget _getContentWidget() {
    return StreamBuilder<MedicationsCodeIndex>(
      stream: _viewModel.outputMedicationsCode,
      builder: (context, snapshot) {
        return _getItem(snapshot.data);
      },
    );
  }


  Widget _getItem(MedicationsCodeIndex? medicationsCodeIndex) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Medication Code:',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 16),
            Text(
              medicationsCodeIndex != null ? medicationsCodeIndex.data : "null" ,
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(ColorManager.darkPrimary), // Set the desired color here
              ),
              onPressed: (){
                setState(() {
                  _viewModel.get();
                });
              },
              child: const Text('Generate Code'),
            ),
          ],
        ),
      );
  }

  reload(){
    (){_viewModel.start();}.call();
  }
}
