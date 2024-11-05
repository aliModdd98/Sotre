import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:task_6_ecommerce/core/class/status_request.dart';
import 'package:task_6_ecommerce/core/functions/check_internet.dart';

String _basicAuth = 'Basic ${base64Encode(utf8.encode('ahmad:ahmad12345'))}';

Map<String, String> myheaders = {'authorization': _basicAuth};

class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
    try {
      if (await checkInternet()) {
        var response =
            await http.post(Uri.parse(linkurl), headers: myheaders, body: data);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = jsonDecode(response.body);
          print(responsebody);
          return Right(responsebody);
        } else {
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (_) {
      return const Left(StatusRequest.serverException);
    }
  }
}
