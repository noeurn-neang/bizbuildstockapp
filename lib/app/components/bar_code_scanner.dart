import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class BarCoderScannerWithController extends StatefulWidget {
  final Function(BarcodeCapture) onDetect;

  const BarCoderScannerWithController({super.key, required this.onDetect});

  @override
  State<BarCoderScannerWithController> createState() => _StateBarcodeScanner();
}

class _StateBarcodeScanner extends State<BarCoderScannerWithController> {
  bool _isFlashOn = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          //  color: COLOR_WHITE,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.fromLTRB(20, 62, 20, 0),
                  child: Column(
                    children: [
                      Expanded(
                        child: Center(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 230,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.red,
                                width: 0,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              child: MobileScanner(
                                controller: MobileScannerController(
                                  torchEnabled: _isFlashOn,
                                  facing: CameraFacing.back,
                                  detectionSpeed: DetectionSpeed.normal,
                                  detectionTimeoutMs: 500,
                                  returnImage: true,
                                  autoStart: true,
                                ),
                                onDetect: widget.onDetect,
                                placeholderBuilder: (p0, p1) {
                                  return Text('data');
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton.filled(
                        onPressed: null, icon: Icon(Icons.flash_off)),
                    IconButton.filled(onPressed: null, icon: Icon(Icons.photo)),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
