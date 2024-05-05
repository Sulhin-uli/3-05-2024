void main() {
  List<List<List<int>>> meetings = [
    [
      [9, 12],
      [14, 16]
    ],
    [
      [10, 12],
      [15, 17]
    ],
    [
      [11, 13],
      [16, 18]
    ]
  ];

  findCommonSlot(meetings);
}

findCommonSlot(List<List<List<int>>> meetings) {
  // print("commonSlot: $commonSlot");

  List<List<int>> allSlots = [];
  for (List<List<int>> diplomatMeetings in meetings) {
    allSlots.addAll(diplomatMeetings);
  }

  // print("allSlots: $allSlots");

  List<List<int>> commonSlot = [];

  for (var element in allSlots) {
    for (var i = element[0]; i <= element[1]; i++) {
      // if last make break
      if (i == element[1]) {
        break;
      }
      commonSlot.add([i, i + 1]);
    }
  }
  // print("commonSlot: $commonSlot");

  List<List<int>> resultTime = [];

  for (var i = 0; i < commonSlot.length; i++) {
    for (var j = i + 1; j < commonSlot.length; j++) {
      if (commonSlot[i][0] == commonSlot[j][0] &&
          commonSlot[i][1] == commonSlot[j][1]) {
        resultTime.add(commonSlot[i]);
      }
    }
  }

  // print("resultTime: $resultTime");

  List<List<int>> finalResultTime = [];

  for (var i = 0; i < resultTime.length; i++) {
    for (var j = i + 1; j < resultTime.length; j++) {
      if (resultTime[i][0] == resultTime[j][0] &&
          resultTime[i][1] == resultTime[j][1]) {
        finalResultTime.add(resultTime[i]);
      }
    }
  }

  Map<List<int>, int> elementCount = {};

  // Count occurrences of each element
  for (var element in finalResultTime) {
    if (elementCount.containsKey(element)) {
      elementCount[element] = elementCount[element]! + 1;
    } else {
      elementCount[element] = 1;
    }
  }

  // Find duplicate elements
  List<List<int>> duplicates = [];
  elementCount.forEach((element, count) {
    // print('Element: $element, Count: $count');

    if (count > (meetings.length - 1)) {
      duplicates.add(element);
    }
  });

  print('Final Result: $duplicates');

  // return resultTime;
}
