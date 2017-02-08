function insertion(arry) {
  var len = arry.length;
  for (i=0; i < len; i++) {
    var tmp = arry[i]; //Copy of the current element. 
    /*Check through the sorted part and compare with the number in tmp. If large, shift the number*/
    for (j=i-1; j >= 0 && (arry[j] > tmp); j--) {
        //Shift the number
        arry[j+1] = arry[j];
    }
    //Insert the copied number at the correct position
    //in sorted part. 
    arry[j+1] = tmp;
  }
  return arry
}
console.log(insertion([1,3,4,5,3,5,7,8,34,5,6,78,8]))

// Merge sorts
function mergeSort(arry) {
	if (arry.length < 2) { return arry; }
	var pivot = Math.floor(arry.length / 2)
	var left = arry.slice(0, pivot)
	var right = arry.slice(pivot, arry.length)
	return merge(mergeSort(left), mergeSort(right))
}
function merge(left, right) {
	var result = []
	while (left.length && right.length) {
		if (left[0] <= right[0]) {
			result.push(left.shift())
		} else {
			result.push(right.shift())
		}
	}
	while (left.length) { result.push(left.shift()) }
	while (right.length) { result.push(right.shift()) }
	return result;
}
console.log(mergeSort([1,3,4,5,3,5,7,8,34,5,6,78,8]))
/*
	Saturday, 11-05-2016
	Array sorting algorithms: Selection Sort
*/
function selectionSort(arry) {
	var length = arry.length
	for (i = 0; i < length - 1; i--) {
		minIndex = i
	} for (j = i+1; j < length; j++) {
		if (arry[j] < arry[minIndex]) {
			minIndex = j
		}
		temp = arry[minIndex]
		arry[minIndex] = arry[i]
		arry[i] = temp
	}
	return arry
}
console.log(selectionSort([1,3,4,5,3,5,7,8,34,5,6,78,8]))

