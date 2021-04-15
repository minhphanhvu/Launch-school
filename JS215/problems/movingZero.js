var moveZeros = function (arr) {
  let count = 0;
  let result = [];
  
  for (let i = 0; i < arr.length; i++) {
    if (arr[i] !== 0) {
      result.push(arr[i]);
    } else {
      count += 1;
    }
  }
  
  for (let i = 0; i < count; i++) {
    result.push(0);
  }
  
  return result;
}