// SUm of Digits

function sum(num) {
  let result = 0;

  while (num !== 0){
    result += num % 10;
    num = Math.floor(num/10);
  }
  
  return result;
}

console.log('Sum of digits');
console.log(sum(23));           // 5
console.log(sum(496));          // 19
console.log(sum(123456789));    // 45

// Alhabetical Numbers

function wordSort(num1, num2) {
  const NUMBER_WORDS = ['zero', 'one', 'two', 'three', 'four', 'five',
                        'six', 'seven', 'eight', 'nine', 'ten', 'eleven',
                        'twelve', 'thirteen', 'fourteen', 'fifteen',
                        'sixteen', 'seventeen', 'eighteen', 'nineteen'];
  if (NUMBER_WORDS[num1] > NUMBER_WORDS[num2]) {
    return 1;
  } else if (NUMBER_WORDS[num1] < NUMBER_WORDS[num2]) {
    return -1;
  } else {
    return 0;
  }
}

function alphabeticNumberSort(arr) {
  return arr.sort(wordSort);
}

console.log('alphabeticNumbers');
console.log(alphabeticNumberSort(
  [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]));
// [8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17, 6, 16, 10, 13, 3, 12, 2, 0]

// Multiply All Pairs

function multiplyAllPairs(array1, array2) {
  const result = [];

  array1.forEach(number1 => {
    array2.forEach(number2 => {
      result.push(number1 * number2);
    });
  });

  return result.sort((a, b) => a - b);
}

console.log('Multiply All Pairs');
console.log(multiplyAllPairs([2, 4], [4, 3, 1, 2]));    // [2, 4, 4, 6, 8, 8, 12, 16]

// Sum of Sums

function sumOfSums(arr) {
  let result = 0;
  const totalSum = arr.reduce((accum, value) => {
    result += accum;
    return accum + value;
  }, 0);
  result += totalSum;

  return result;
}

console.log('Sum of Sums');
console.log(sumOfSums([3, 5, 2]));        // (3) + (3 + 5) + (3 + 5 + 2) --> 21
console.log(sumOfSums([1, 5, 7, 3]));     // (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) --> 36
console.log(sumOfSums([4]));              // 4
console.log(sumOfSums([1, 2, 3, 4, 5]));  // 35

// Leading Substrings

function leadingSubstrings(str) {
  const newArr = [];
  let newSub = '';
  str.split('').forEach((char) => {
    newSub += char;
    newArr.push(newSub);
  });

  return newArr;
}

console.log('Leading Substrings');
console.log(leadingSubstrings('abc'));      // ["a", "ab", "abc"]
console.log(leadingSubstrings('a'));        // ["a"]
console.log(leadingSubstrings('xyzzy'));    // ["x", "xy", "xyz", "xyzz", "xyzzy"]

// All Substrings

function substrings(str) {
  let newArr = [];
  
  for (let i = 0; i < str.length; i++) {
    newArr = newArr.concat(leadingSubstrings(str.slice(i)));
  }

  return newArr;
}

console.log('All Substrings');
console.log(substrings('abcde'));

// returns
// [ "a", "ab", "abc", "abcd", "abcde",
//   "b", "bc", "bcd", "bcde",
//   "c", "cd", "cde",
//   "d", "de",
//   "e" ]

// Palindrome Substrings

function isPalindrome(word) {
  return word === word.split('').reverse().join('') && word.length >= 2;
}

function palindromes(str) {
  return substrings(str).filter(isPalindrome);
}

console.log('Palindrome Substrings');
console.log(palindromes('abcd'));       // []
console.log(palindromes('madam'));      // [ "madam", "ada" ]

console.log(palindromes('hello-madam-did-madam-goodbye'));
// returns
// [ "ll", "-madam-", "-madam-did-madam-", "madam", "madam-did-madam", "ada",
//   "adam-did-mada", "dam-did-mad", "am-did-ma", "m-did-m", "-did-", "did",
//   "-madam-", "madam", "ada", "oo" ]

console.log(palindromes('knitting cassettes'));
// returns
// [ "nittin", "itti", "tt", "ss", "settes", "ette", "tt" ]

// Grocery List

function transformArray(array) {
  let result = [];

  for (let i = 0; i < array[1]; i++) {
    result.push(array[0]);
  }

  return result;
}

function buyFruit(arr) {
  return arr.map(transformArray).reduce((groceryList, fruit) => groceryList.concat(fruit));
}

console.log('Grocery List');
console.log(buyFruit([['apple', 3], ['orange', 1], ['banana', 2]]));
// returns ["apple", "apple", "apple", "orange", "banana", "banana"]

