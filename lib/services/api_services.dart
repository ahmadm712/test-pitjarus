import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pitjarus_test/data/models/list_store_model.dart';
import 'package:pitjarus_test/utils/constanst.dart';
import 'package:pitjarus_test/utils/failure.dart';

class ApiServices {
  Future<StoreListResponse> login(
      {required String username, required String password}) async {
    var loginRequest = http.MultipartRequest(postMethod, Uri.parse(baseUrl))
      ..fields['username'] = username //'pitjarus'
      ..fields['password'] = password; //'admin';

    final streamedResponse = await loginRequest.send();
    final response = await http.Response.fromStream(streamedResponse);
    final data = json.decode(response.body);
    if (data['status'] == 'success') {
      return storeListResponseFromJson(response.body);
    } else {
      throw ServerFailure(data['message']);
    }
  }
}
