import 'dart:io';
import 'package:dart_image_grabber/image_grabber.dart';

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  print("Selamat datang di Dart Image Grabber!");

  stdout.write("Inputkan halaman web: ");
  String? url = stdin.readLineSync();

  stdout.write("Masukkan folder tujuan: ");
  String? folder = stdin.readLineSync();

  if (url != null && folder != null) {
    final grabber = ImageGrabber(url, folder);
    await grabber.run();
  } else {
    print("Input tidak valid.");
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
