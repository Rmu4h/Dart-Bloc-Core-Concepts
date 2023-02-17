int calculate() {
  return 6 * 7;
}


//async generator function Це пацан який відсилає данні
Stream<int> boatStream() async* {
  for(int i = 1; i < 10; i++){
    await Future.delayed(Duration(seconds: 2));
    print(' send boat number ${i}');
    yield i;
  }
}