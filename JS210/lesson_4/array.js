// Array Copy 1

let myArray = [1, 2, 3, 4];
const myOtherArray = myArray;

myArray.pop(); 
console.log(myArray); // [1, 2, 3]
console.log(myOtherArray); // [1, 2, 3]

myArray = [1, 2];
console.log(myArray); // [1, 2]
console.log(myOtherArray); // [1, 2, 3]

// Array Copy part 2

let myArray2 = [1, 2, 3, 4];
const myOtherArray2 = myArray2.slice();

myArray2.pop();
console.log(myArray2);
console.log(myOtherArray2);

// Array Concat part 1

function concat(array1, secondArgument) {
  let newArray = array1

  if (Array.isArray(secondArgument)) {
    for (let i = 0; i < secondArgument.length; i++) {
      newArray.push(secondArgument[i]);
    }
  } else {
    newArray.push(secondArgument);
  }

  return newArray;
}

console.log('Array Concat part 1')
console.log(concat([1, 2, 3], [4, 5, 6]));          // [1, 2, 3, 4, 5, 6]
console.log(concat([1, 2], 3));                     // [1, 2, 3]
console.log(concat([2, 3], ['two', 'three']));      // [2, 3, "two", "three"]
console.log(concat([2, 3], 'four'));                // [2, 3, "four"]


const obj = { a: 2, b: 3 };
const newArray = concat([2, 3], obj);
console.log(newArray);                              // [2, 3, { a: 2, b: 3 }]
obj.a = 'two';
console.log(newArray);                              // [2, 3, { a: "two", b: 3 }]

const arr1 = [1, 2, 3];
const arr2 = [4, 5, obj];
const arr3 = concat(arr1, arr2);
console.log(arr3);                                  // [1, 2, 3, 4, 5, { a: "two", b: 3 }]
obj.b = 'three';
console.log(arr3);                                  // [1, 2, 3, 4, 5, { a: "two", b: "three" }]

console.log(arr3[5].b = 3);                         // or, `arr3[5]['b'] = 3;`
console.log(obj);                                   // { a: "two", b: 3 }

// Array Concat part 2

function concat2(arr, ...arrs) {
  let newArray = arr;

  for (let i = 0; i < arrs.length; i++) {
    newArray = concat(newArray, arrs[i]);
  }

  return newArray;
}

console.log('Array Concat part 2')
console.log(concat2([1, 2, 3], [4, 5, 6], [7, 8, 9]));    // [1, 2, 3, 4, 5, 6, 7, 8, 9]
console.log(concat2([1, 2], 'a', ['one', 'two']));        // [1, 2, "a", "one", "two"]
console.log(concat2([1, 2], ['three'], 4));               // [1, 2, "three", 4]

// Array Pop and Push

function pop(array) {
  const poppedElement = array[array.length - 1];
  array.splice(array.length - 1, 1);

  return poppedElement;
}

console.log('Array Pop and Push');

// pop
const array1 = [1, 2, 3];
console.log(pop(array1));            // 3
console.log(array1);                // [1, 2]
console.log(pop([]));                           // undefined
console.log(pop([1, 2, ['a', 'b', 'c']]));      // ["a", "b", "c"]


function push(array, ...args) {
  const length = args.length;
  const size = array.length;

  for (let i = 0; i < length; i += 1) {
    array[i + size] = args[i];
  }

  return array.length;
}

// push
const array2 = [1, 2, 3];
console.log(push(array2, 4, 5, 6));              // 6
console.log(array2);                // [1, 2, 3, 4, 5, 6]
console.log(push([1, 2], ['a', 'b']));          // 3
console.log(push([], 1));                       // 1
console.log(push([]));                          // 0

// Array and String Reverse

function reverse(inputForReversal) {
  if (Array.isArray(inputForReversal)) {
    return reverseArray(inputForReversal);
  } else {
    return reverseString(inputForReversal);
  }
}

function reverseArray(inputForReversal) {
  const reversed = [];
  const length = inputForReversal.length;
  let index = 0;

  for (let i = length - 1; i >= 0; i -= 1) {
    reversed[index] = inputForReversal[i];
    index += 1;
  }

  return reversed;
}

function reverseString(inputForReversal) {
  const stringArray = inputForReversal.split('');
  return reverseArray(stringArray).join('');
}

console.log('Array and String Reverse');
console.log(reverse('Hello'));           // "olleH"
console.log(reverse('a'));               // "a"
console.log(reverse([1, 2, 3, 4]));      // [4, 3, 2, 1]
console.log(reverse([]));                // []

const array = [1, 2, 3];
console.log(reverse(array));             // [3, 2, 1]
console.log(array);                      // [1, 2, 3]

// Array Shift and Unshift

function shift(arr) {
  let result;

  if (arr.length !== 0) {
    result = arr.splice(0, 1).pop();
  }

  return result;
}

function unshift(array, ...args) {
  for (let i = 0; i < args.length; i += 1) {
    array.splice(i , 0, args[i]);
  }

  return array.length;
}

console.log('Array Shift and Unshift');
console.log(shift([1, 2, 3]));                // 1
console.log(shift([]));                       // undefined
console.log(shift([[1, 2, 3], 4, 5]));        // [1, 2, 3]

console.log(unshift([1, 2, 3], 5, 6));        // 5
console.log(unshift([1, 2, 3]));              // 3
console.log(unshift([4, 5], [1, 2, 3]));      // 3

const testArray = [1, 2, 3];
console.log(shift(testArray));                // 1
console.log(testArray);                       // [2, 3]
console.log(unshift(testArray, 5));           // 3
console.log(testArray);                       // [5, 2, 3]

// Array Splice and Slice

function slice(array, begin, end) {
  
}

console.log('Array Slice');
console.log(slice([1, 2, 3], 1, 2));               // [2]
console.log(slice([1, 2, 3], 2, 0));               // []
console.log(slice([1, 2, 3], 5, 1));               // []
console.log(slice([1, 2, 3], 0, 5));               // [1, 2, 3]

const arr1 = [1, 2, 3];
console.log(slice(arr1, 1, 3));                     // [2, 3]
console.log(arr1);                                  // [1, 2, 3]