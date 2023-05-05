import 'package:http/http.dart' as http;
import 'package:http/http.dart';

abstract class HttpService {
  Future<Response> getData({required Uri uri});
}

class HttpServiceImpl implements HttpService {
  @override
  Future<Response> getData({required Uri uri}) async {
    try {
      return await http.Client().get(uri).then((value) => value);
    } catch (error) {
      throw Exception(error);
    }
  }
}
