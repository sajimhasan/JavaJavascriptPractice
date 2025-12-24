import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class SellerInfoController extends GetxController {
  // WhatsApp
  void openWhatsApp() async {
    final Uri url = Uri.parse('https://api.whatsapp.com/send?phone=8801305127880');
    await launchUrl(url, mode: LaunchMode.externalApplication);
  }

  // Instagram
  void openInstagram() async {
    final Uri url = Uri.parse('https://www.instagram.com/aelvynxgroup/');
    await launchUrl(url, mode: LaunchMode.externalApplication);
  }

  // Call
  void callUs() async {
    final Uri url = Uri.parse('tel:+8801305127880');
    await launchUrl(url);
  }


  // get all Sellers Info


  
}