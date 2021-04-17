function merge(arr1, arr2) {
  const result = []

  let index1 = 0
  let index2 = 0
  const sizeArr1 = arr1.length
  const sizeArr2 = arr2.length

  while (index1 < sizeArr1 && index2 < sizeArr2) {
    if (arr1[index1] < arr2[index2]) {
      result.push(arr1[index1])
      index1 += 1
    } else {
      result.push(arr2[index2])
      index2 += 1
    }
  }

  if (index1 >= sizeArr1) {
    for (; index2 < sizeArr2; index2++) {
      result.push(arr2[index2])
    }
  } else {
    for (; index1 < sizeArr1; index1++) {
      result.push(arr1[index1])
    }
  }

  return result
}

console.log(merge([1, 5, 9], [2, 6, 8]));      // [1, 2, 5, 6, 8, 9]
console.log(merge([1, 1, 3], [2, 2]));         // [1, 1, 2, 2, 3]
// [1, 1, 2, 2, 3]
console.log(merge([], [1, 4, 5]));             // [1, 4, 5]
console.log(merge([1, 4, 5], []));             // [1, 4, 5]

// Shorter version
/*
function merge(array1, array2) {
  const copy1 = array1.slice();
  const copy2 = array2.slice();
  const result = [];

  while (copy1.length > 0 && copy2.length > 0) {
    result.push(copy1[0] <= copy2[0] ? copy1.shift() : copy2.shift());
  }

  return result.concat(copy1.length === 0 ? copy2 : copy1);
}

*/
