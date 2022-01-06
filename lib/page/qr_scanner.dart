import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'dart:io' show Platform;

class QRScanner extends StatefulWidget {
  const QRScanner({Key? key}) : super(key: key);

  @override
  State<QRScanner> createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {
  final qrkey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  Barcode? barcode;
  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Future<void> reassemble() async {
    super.reassemble();
    if (Platform.isAndroid) {
     await controller!.pauseCamera();
    } else if (Platform.isIOS) {
     await  controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
          body: Stack(
            alignment: Alignment.center,
            children: [QRView(key: qrkey,
              onQRViewCreated: onQRViewCreated,
              overlay: QrScannerOverlayShape(
                borderWidth: 10,
                borderColor: Theme.of(context).accentColor,
                borderRadius: 10,
                borderLength: 20,
                cutOutSize: MediaQuery.of(context).size.width*0.8,
              ),

            ),
            Positioned(
              bottom: 10,
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white24
                ),
                child: Text(
                  barcode!=null? '${barcode!.code}': "scan a code !"
                      ,maxLines: 3,
                ),
              ),
            )
,
              Positioned(top: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,


                children: [

                  IconButton(onPressed: () async {await controller?.toggleFlash();}, icon: Icon(Icons.flash_off)),
                  IconButton(onPressed: () async { await controller?.flipCamera();}, icon: Icon(Icons.switch_camera))

                ],),)
            ],
          )),
    );
  }

  void onQRViewCreated(QRViewController controller) {
    setState(() => this.controller = controller);
    controller.scannedDataStream.listen((barcode) =>setState(() => this.barcode = barcode));
  }
}
