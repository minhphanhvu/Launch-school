// Odd number

// for (let i = 1; i < 100; i +=2 ) {
//   console.log(i);
// }

// Even number

// for (let i = 2; i < 100; i +=2 ) {
//   console.log(i);
// }

// How big is the room

// const readlineSync = require('readline-sync');

// console.log('Enter the length of the room in meters:');
// const length = Number(readlineSync.prompt());

// console.log('Enter the width of the room in meters:')
// const width = Number(readlineSync.prompt());

// let area = length * width;

// console.log(`The area of the room is ${area} square meters`);

// Short Long Short

function concatenate(shortStr, longStr) {
  return shortStr + longStr + shortStr;
}

function shortLongShort(str1, str2) {
  let result = '';

  if (str1.length < str2.length) {
    return concatenate(str1, str2);
  } else {
    return concatenate(str2, str1);
  }
}

console.log(shortLongShort('abc', 'defgh'));    // "abcdefghabc"
console.log(shortLongShort('abcde', 'fgh'));    // "fghabcdefgh"
console.log(shortLongShort('', 'xyz'));         // "xyz"

// Leap years part 1

console.log('----')
function isLeapYear(year) {
  if (year % 400 === 0) {
    return true;
  } else if (year % 100 === 0) {
    return false;
  } else {
    return year % 4 === 0;
  }
}

console.log(isLeapYear(2016));      // true
console.log(isLeapYear(2015));      // false
console.log(isLeapYear(2100));      // false
console.log(isLeapYear(2400));      // true
console.log(isLeapYear(240000));    // true
console.log(isLeapYear(240001));    // false
console.log(isLeapYear(2000));      // true
console.log(isLeapYear(1900));      // false
console.log(isLeapYear(1752));      // true
console.log(isLeapYear(1700));      // false
console.log(isLeapYear(1));         // false
console.log(isLeapYear(100));       // false
console.log(isLeapYear(400));       // true

// Multisum

console.log('----');
function isMultiple(number, divisor) {
  return number % divisor === 0;
}

function multisum(maxValue) {
  let sum = 0;

  for (let number = 1; number <= maxValue; number += 1) {
    if (isMultiple(number, 3) || isMultiple(number, 5)) {
      sum += number;
    }
  }

  return sum;
}

// ASCI II

function asciiValue(str) {
  let sum = 0;

  for (let i = 0; i < str.length; i++) {
    sum += str[i].charCodeAt(0);
  }

  return sum;
}

console.log(asciiValue('Four score'));         // 984
console.log(asciiValue('Launch School'));      // 1251
console.log(asciiValue('a'));                  // 97
console.log(asciiValue(''));                   // 0
