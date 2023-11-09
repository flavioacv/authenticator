import 'dart:io';

import 'package:url_launcher/url_launcher.dart';

abstract class LaunchService {
  Future<bool> launchPhone({required String phoneNumber});
  Future<bool> launchWhatsapp({required String contact, required String text});
  Future<bool> launchEmail({required String email});
  Future<bool> launchWeb({required String url});
}

class LaunchServiceImpl implements LaunchService {
  @override
  Future<bool> launchPhone({required String phoneNumber}) {
    return launchUrl(
      Uri.parse(
        'tel:$phoneNumber',
      ),
    );
  }

  @override
  Future<bool> launchWhatsapp(
      {required String contact, required String text}) async {
    var androidUrl = "whatsapp://send?phone=$contact&text=$text";
    var iosUrl = "https://wa.me/$contact?text=${Uri.parse(text)}";
    try {
      if (Platform.isIOS) {
        return await launchUrl(Uri.parse(iosUrl),
            mode: LaunchMode.externalApplication);
      } else {
        return await launchUrl(Uri.parse(androidUrl),
            mode: LaunchMode.externalApplication);
      }
    } on Exception {
      print('WhatsApp is not installed.');
      return false;
    }
  }

  @override
  Future<bool> launchEmail({required String email}) {
    return launchUrl(
      Uri.parse(
        "mailto:$email",
      ),
    );
  }
  
  @override
  Future<bool> launchWeb({required String url}) {
     return launchUrl(
      Uri.parse(url)
    );
  }
}
