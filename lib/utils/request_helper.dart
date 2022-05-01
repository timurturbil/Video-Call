/* import 'dart:convert';

import 'package:Tahsilist/model/login_response.dart';
import 'package:Tahsilist/screens/auth/login_screen.dart';
import 'package:Tahsilist/utils/api.dart';
import 'package:Tahsilist/utils/pref.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RequestHelper extends http.BaseClient {
  http.Client _httpClient = new http.Client();
  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    request.headers.addAll({'x-access-token': sp.getString("token")});
    return _httpClient.send(request);
  }

  @override
  Future<http.Response> post(url,
      {Map<String, String> headers, body, Encoding encoding}) async {
    return _sendUnstreamed('POST', url, headers, body, encoding);
  }

  @override
  Future<http.Response> _sendUnstreamed(
      String method, url, Map<String, String> headers,
      [body, Encoding encoding]) async {
    var request = http.Request(method, _fromUriOrString(url));

    if (headers != null) request.headers.addAll(headers);
    if (encoding != null) request.encoding = encoding;
    if (body != null) {
      if (body is String) {
        request.body = body;
      } else if (body is List) {
        request.bodyBytes = body.cast<int>();
      } else if (body is Map) {
        request.bodyFields = body.cast<String, String>();
      } else {
        throw ArgumentError('Invalid request body "$body".');
      }
    }

    var responseData = await http.Response.fromStream(await send(request));
    logRequest(responseData, body);
    if (responseData.statusCode != 401) {
      return responseData;
    } else {
      final responseRefresh = await http.post(
        Uri.parse(BASE_URL + "auth/user/token"),
        body: {"refresh_token": Prefs.getString("refresh_token")},
      );
      if (!jsonDecode(responseRefresh.body)['status']) {
        await Prefs.setString("token", "");
        Get.to(
            LoginPage()); // Burada Nav.route() kullanmamamın sebebi context verememdendir.
      }
      final userLogin =
          LoginResponse.fromJson(jsonDecode(responseRefresh.body));
      await Prefs.setString("token", userLogin.data.accessToken);
      await Prefs.setString("refresh_token", userLogin.data.refreshToken);
      return await this
          .post(url, body: body, headers: headers, encoding: encoding);
    }
  }

  void logRequest(http.Response responseData, body) {
    print('\x1B[52m' + '' + '\x1B[0m');
    print('\x1B[95m' +
        '${responseData.request} ${responseData.statusCode}' +
        '\x1B[0m');
    // print('\x1B[95m' + '${responseData.statusCode}' + '\x1B[0m');
    print('\x1B[36m' + '$body' + '\x1B[0m');
    print('\x1B[34m' + '${responseData.body}' + '\x1B[0m');
    // print('\x1B[52m' +
    //     '\-<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>-' +
    //     '\x1B[0m');
    print('\x1B[52m' + '' + '\x1B[0m');

    Sentry.configureScope((scope) =>
        scope.setTag('username', Prefs.getString("username").toString()));
    Sentry.configureScope((scope) => scope.setTag(
        'request',
        responseData.request.toString() +
            " " +
            responseData.statusCode.toString()));
    Sentry.configureScope(
        (scope) => scope.setTag('request_body', body.toString()));
    Sentry.configureScope(
        (scope) => scope.setTag('response', responseData.body.toString()));
  }

  Uri _fromUriOrString(uri) => uri is String ? Uri.parse(uri) : uri as Uri;

  Uri url(String urlPath) {
    final url = BASE_URL + urlPath;
    return Uri.parse(url);
  }
}
 */