import 'dart:convert';

import 'package:http/http.dart' as http;

class ServiceCommunicationSource {
  final String apiUrl;

  ServiceCommunicationSource()
      : apiUrl = const String.fromEnvironment('API_SMS',
            defaultValue:
                'https://send-message-dev.oxiteno.com/sendingportox-sms');

  Future<bool> sendSMS(String smsTo, String mensagem) async {
    try {
      final bodyRequest = <String, String>{
        'smsTo': smsTo,
        'mensagem': mensagem,
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
