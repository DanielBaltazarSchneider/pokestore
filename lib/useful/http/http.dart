import 'package:http/http.dart' as http;

class Http {
  // HttpClient client = new HttpClient();
  bool timeOut = false;

  Future<HttpStatus> getHttp(String url) async {
    try {
      var response = await http.get(Uri.parse(url));
      return HttpStatus(
        timeOut: timeOut,
        status: true,
        statusCode: response.statusCode,
        body: response.body,
        headers: response.headers,
      );
    } catch (e) {
      print("********* ERROR ********* \n $e");
      return HttpStatus(
        timeOut: false,
        status: false,
        statusCode: 0,
        body: "",
        headers: "",
      );
    }
  }

// Future<HttpStatus> get(String url) async {
//   try {
//     //client.badCertificateCallback = ((X509Certificate cert, String host, int port) => true);
//
//     HttpClientRequest request = await client.getUrl(Uri.parse(url));
//     // request.headers.removeAll(HttpHeaders.acceptEncodingHeader);
//     //request.headers.set('content-type', 'application/json');
//     HttpClientResponse response = await request.close();
//     response.timeout(Duration(microseconds: 10), onTimeout: (time) {
//       return null;
//     });
//     String reply = await response.transform(utf8.decoder).join();
//     client.close();
//     if (timeOut) {
//       return HttpStatus(
//         timeOut: timeOut,
//         status: false,
//         statusCode: response.statusCode,
//         body: reply,
//         headers: response.headers,
//       );
//     } else {
//       return HttpStatus(
//         timeOut: timeOut,
//         status: true,
//         statusCode: response.statusCode,
//         body: reply,
//         headers: response.headers,
//       );
//     }
//   } catch (e) {
//     print("********* ERROR ********* \n $e");
//     return HttpStatus(
//       timeOut: false,
//       status: false,
//       statusCode: 0,
//       body: "",
//       headers: "",
//     );
//   }
// }
}

class HttpStatus {
  final bool status;
  final bool timeOut;
  final int statusCode;
  final String body;
  final dynamic headers;

  HttpStatus({
    required this.timeOut,
    required this.status,
    required this.statusCode,
    required this.body,
    required this.headers,
  });
}
