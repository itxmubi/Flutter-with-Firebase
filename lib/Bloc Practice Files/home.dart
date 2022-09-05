import 'dart:developer';

Stream<int> boatStream() async* {
  for (int i = 0; i < 10; i++) {
    log("Sent boat No $i");

    await Future.delayed(const Duration(seconds: 2));
    yield i;
  }
}

void main(List<String> args) {
  Stream<int> stream = boatStream();
  stream.listen((event) {
    log("Recieved Boat No $event");  
  });
}
