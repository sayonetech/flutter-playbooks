// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.dart';

// **************************************************************************
// Generator: JaguarHttpGenerator
// **************************************************************************

class Api extends JaguarApiDefinition with ApiDefinition {
  Api({Client client, String baseUrl, Map headers, SerializerRepo serializers})
      : super(client, baseUrl, headers, serializers);

  Future<JaguarResponse<List<Store>>> getStores({String loc}) async {
    final url =
        '$baseUrl/api/v4/stores/?${paramsToQueryUri({"loc": "$loc",})}';
    var request = new JaguarRequest(
        method: 'GET',
        url: url,
        headers: headers,
        body: serializers.serialize(loc));
    request = await interceptRequest(request);
    final rawResponse = await request.send(client);
    var response;
    if (responseSuccessful(rawResponse)) {
      response = new JaguarResponse(
          serializers.deserialize(rawResponse.body, type: Store), rawResponse);
    } else
      response = new JaguarResponse.error(rawResponse);
    response = await interceptResponse(response);
    return response;
  }
}