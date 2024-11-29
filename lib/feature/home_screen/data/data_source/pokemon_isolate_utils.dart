import 'dart:convert';
import 'dart:isolate';

// Function to parse data using an isolate
Future<Map<String, dynamic>> parsePokemonDataInIsolate(
    Map<String, dynamic> rawData) async {
  final receivePort = ReceivePort();

  // Spawn the isolate with the correct entry point function
  await Isolate.spawn(_parseData, receivePort.sendPort);

  // Get the SendPort of the isolate from the first message
  final sendPort = await receivePort.first as SendPort;

  // Create a new ReceivePort to get the parsed data
  final response = ReceivePort();
  sendPort.send([response.sendPort, rawData]);

  // Wait for the parsed data and return it
  return await response.first as Map<String, dynamic>;
}

// Isolate's entry function with the correct signature
void _parseData(SendPort sendPort) {
  // Create a new ReceivePort to handle messages
  final port = ReceivePort();

  // Send the port back to the main thread
  sendPort.send(port.sendPort);

  // Listen for messages from the main thread
  port.listen((message) {
    final responsePort = message[0] as SendPort;
    final rawData = message[1] as Map<String, dynamic>;

    try {
      // Perform the heavy computation or data parsing
      final parsedData = jsonDecode(jsonEncode(rawData));

      // Send the parsed data back to the main thread
      responsePort.send(parsedData);
    } catch (e) {
      // Handle errors and send an empty response in case of failure
      responsePort.send({});
    }
  });
}
