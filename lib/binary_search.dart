import 'package:flutter/material.dart';

myBinarySearch(List<int> arr, int userValue, int min, int max) {
  if (max >= min) {
    // Если элемент находится в центре
    int mid = ((max + min) / 2).floor();
    if (userValue == arr[mid]) {
      debugPrint('Значение находится на позиции: $mid');
    }
// Если элемент больше центрального
    // Тогда ищем его с правой стороны
    else if (userValue > arr[mid]) {
      myBinarySearch(arr, userValue, mid + 1, max);
    }
// Если элемент меньше центрального
    // Тогда ищем его с левой стороны
    else {
      myBinarySearch(arr, userValue, min, mid - 1);
    }
  }
  return null;
}
