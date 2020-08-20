List barGraphHandler(List<Map<dynamic, dynamic>> data) {
  List scoreList = [];

  data.forEach((element) {
    scoreList.add((element['Item Score']));
  });
  List distributedList = (barGraphDistribution(scoreList));
  return distributedList;
}

List<int> barGraphDistribution(List scoreList) {
  List<int> distributedList = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

  scoreList.forEach((element) {
    var temp = (element / 10);
    temp = temp.truncateToDouble();
    distributedList[temp]++;
  });
  return distributedList;
}
