import 'dart:convert';

import 'package:http/http.dart' as http;

class ServiceCommunicationSource {
  final String apiUrl;
  final String trackingLink;

  ServiceCommunicationSource()
      : apiUrl = const String.fromEnvironment('API_SMS',
            defaultValue:
                'https://send-message-dev.oxiteno.com/sendingportox-sms'),
        trackingLink = const String.fromEnvironment('TRACKING_LINK');

  Future<bool> sendSMS(
    String smsTo,
    String mensagem,
    String trackingLabel,
  ) async {
    try {
      final finalMessage = '$mensagem $trackingLabel: $trackingLink';
      final bodyRequest = <String, String>{
        'smsTo': smsTo,
        'mensagem': finalMessage,
      };

      final resposta = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'user_key': '0da614185aae7c14ba2dd1ff793096c4',
        },
        body: jsonEncode(bodyRequest),
      );

      if (resposta.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
