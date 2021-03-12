"user strict";
// isPalindrome Part 1

function isPalindrome(string) {
  return string === string.split('').reverse().join('');
}

console.log('isPalindrome Part 1');
console.log(isPalindrome('madam'));               // true
console.log(isPalindrome('Madam'));               // false (case matters)
console.log(isPalindrome("madam i'm adam"));      // false (all characters matter)
console.log(isPalindrome('356653'));              // true

// isPalindrome part 2

function isRealPalindrome(string) {
  string = removeNonLetterNumbers(string.toLowerCase());
  return isPalindrome(string);
}

function removeNonLetterNumbers(string) {
  let result = '';

  for (let i = 0; i < string.length; i += 1) {
    if (isLetter(string[i]) || isNumber(string[i])) {
      result += string[i];
    }
  }

  return result;
}

function isLetter(char) {
  return char >= 'a' && char <= 'z';
}

function isNumber(char) {
  return char >= '0' && char <= '9';
}

console.log('isPalindrome Part 2');
console.log(isRealPalindrome('madam'));               // true
console.log(isRealPalindrome('Madam'));               // true (case does not matter)
console.log(isRealPalindrome("Madam, I'm Adam"));     // true (only alphanumerics matter)
console.log(isRealPalindrome('356653'));              // true
console.log(isRealPalindrome('356a653'));             // true
console.log(isRealPalindrome('123ab321'));            // false

// Palindrome Number

function isPalindromicNumber(num) {
  return isPalindrome(String(num));
}

console.log('isPalindromicNumber');
console.log(isPalindromicNumber(34543));        // true
console.log(isPalindromicNumber(123210));       // false
console.log(isPalindromicNumber(22));           // true
console.log(isPalindromicNumber(5));            // true

// Running Total

function runningTotal(arr) {
  let newArray = [];
  let total = 0;

  for (let i = 0; i < arr.length; i++) {
    total += arr[i];
    newArray.push(total);
  }

  return newArray;
}

console.log('runningTotal');
console.log(runningTotal([2, 5, 13]));             // [2, 7, 20]
console.log(runningTotal([14, 11, 7, 15, 20]));    // [14, 25, 32, 47, 67]
console.log(runningTotal([3]));                    // [3]
console.log(runningTotal([]));                     // []

// Letter Swap

function swap(str) {
  if (str.length === 1 || str.length === 0) {
    return str;
  }

  return str.split(' ').map(word => word[word.length - 1] + word.slice(1, word.length - 1) + word[0]).join(' ');
}

console.log('Letter Swap');
console.log(swap('Oh what a wonderful day it is'));  // "hO thaw a londerfuw yad ti si"
console.log(swap('Abcde'));                          // "ebcdA"
console.log(swap('a'));                              // "a"