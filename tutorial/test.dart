void main() {
  List<int?> list = [1, 2, null, -3, 5, null, 6];
  List<int> newList = removeNull(list);
  print(newList);
}

List<int> squareList(List<int> list) {
  return list.map((ele) => ele * ele).toList();
}

List<int> removeNull(List<int?> list) {
  List<int> ans = [];
  List<int> temp = [];
  try {
    List<int?> temp = list.where((ele) => ele != null).map((num) {
      if (num == null) {
        throw Exception('Null value found');
      }
      return num;
    }).toList();
    return ans;
  } on Exception catch (e) {
    print('Exception: $e');
    rethrow;
  }
}
