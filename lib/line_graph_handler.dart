int lineGraphAverageHandler(List<Map<dynamic, dynamic>> data) {
  double averageScore = 0;
  double totalSales = 0;
  double elements = 0;
  data.forEach((element) {
    var temp = (element['Sales']);
    totalSales += temp;
    elements++;
  });

  averageScore = totalSales / elements;
  return averageScore.round();
}

List lineGraphInit(List<Map<dynamic, dynamic>> data) {
  List salesList = [];

  data.forEach((element) {
    salesList.add(element['Sales']);
  });
  return salesList;
}
