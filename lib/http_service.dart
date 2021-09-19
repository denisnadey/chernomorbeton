import 'dart:convert';
import 'package:cbethonapp/element_model.dart';
import 'package:http/http.dart';

class HttpService {
  final String elementsURL = "https://chernomorbeton.ru/json.php";

  Future<List<ElementCard>> getElementCards() async {
    Response res = await get(Uri.parse(elementsURL));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<ElementCard> elements = body
          .map(
            (dynamic item) => ElementCard.fromJson(item),
          )
          .toList();

      return elements;
    } else {
      throw "Unable to retrieve ElementCards.";
    }
  }
}
