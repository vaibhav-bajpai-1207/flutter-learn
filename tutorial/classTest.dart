void main() {
  Test ob = Test(2, 5);
  Map<String, String> json = {
    'a': '3',
    'b': '6',
  };
  Test ob2 = Test.fromJson(json);
  print(ob.a);
  print(ob2.a);
}

class Test {
  int a = 2;
  int b = 5;
  Test(int a, int b) {
    this.a = a;
    this.b = b;
  }
  Test.fromJson(Map<String, String> json) {
    print(int.parse(json['a'] ?? '0'));
    int tempa = int.parse(json['a'] ?? '2');
    int tempb = int.parse(json['b'] ?? '5');
    // Test(tempa, tempb);
    this.a = tempa;
    this.b = tempb;
  }
}
