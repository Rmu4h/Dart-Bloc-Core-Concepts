import 'package:untitled/main.dart' as untitled;





void main(List<String> arguments) {
  print('Hello world: ${untitled.calculate()}!');

  Stream<int> stream = untitled.boatStream();
  int topBoatValue = 5;


  // var subscribe;
  // subscribe = stream.listen((event) {
  //   if(topBoatValue < 5){
  //     print("RECEIVED boat " + event.toString());
  //     topBoatValue += 1;
  //     print(topBoatValue);
  //   } else {
  //     subscribe.cancel();
  //   }
  // });

  specificBoat(event) {
    if(event < topBoatValue){
      return false;
    }

    return true;
  }

// це пацан який отримує данні і він не знає коли отримує посилку(дані)
  var subscribe;
  subscribe = stream.takeWhile((event) => event != topBoatValue).listen((event) {
    print("RECEIVED boat " + event.toString());
    topBoatValue += 1;
  });

  // print(subscribe);
}
