import 'package:pokestore/models/httpModel/Response.dart';
import 'package:pokestore/useful/config/endpoints.dart';
import 'package:pokestore/useful/http/http.dart';

import 'Analise.dart';

class AnaliseRepository {
  Future<List<Analise>> getAllAnalises() async {
    var url = "${Endpoint.pokeapi}/1";
    HttpStatus httpStatus = await Http().getHttp(url);
    if (httpStatus.status) {
      Response response = responseFromJson(httpStatus.body);
      if (response.object.status == "success") {
        return analiseFromJson(response.object.content);
      } else {
        return [];
      }
    } else {
      return [];
    }
  }
}
