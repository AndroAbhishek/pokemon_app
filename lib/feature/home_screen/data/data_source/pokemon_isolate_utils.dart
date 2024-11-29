import 'dart:convert';
import 'dart:isolate';

Future<Map<String, dynamic>> parsePokemonDataInIsolate(
    Map<String, dynamic> rawData) async {
  final receivePort = ReceivePort();
  await Isolate.spawn(_parseData, receivePort.sendPort);
  final sendPort = await receivePort.first as SendPort;
  final response = ReceivePort();
  sendPort.send([response.sendPort, rawData]);
  return await response.first as Map<String, dynamic>;
}

void _parseData(SendPort sendPort) {
  final port = ReceivePort();
  sendPort.send(port.sendPort);
  port.listen((message) {
    final responsePort = message[0] as SendPort;
    final rawData = message[1] as Map<String, dynamic>;

    try {
      final parsedData = jsonDecode(jsonEncode(rawData));
      responsePort.send(parsedData);
    } catch (e) {
      responsePort.send({});
    }
  });
}
