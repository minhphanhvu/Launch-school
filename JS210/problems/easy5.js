// Double Char Part 1

function repeater(str) {
  let newStr = '';

  for (let i = 0; i < str.length; i++) {
    newStr = newStr + str[i] + str[i];
  }

  return newStr;
}

console.log('Double Char Part 1');
console.log(repeater('Hello'));        // "HHeelllloo"
console.log(repeater('Good job!'));    // "GGoooodd  jjoobb!!"
console.log(repeater(''));             // ""

// Double Char Part 2

function doubleConsonants(str) {
  const VOWELS = ['a', 'e', 'u', 'i', 'o'];
  let newStr = '';

  for (let i = 0; i < str.length; i++) {
    if (!VOWELS.includes(str[i]) && isChar(str[i])) {
      newStr = newStr + str[i] + str[i];
    } else {
      newStr += str[i];
    }
  }

  return newStr;
}

function isChar(chr) {
  return (chr >= 'a' && chr <= 'z') || (chr >= 'A' && chr <= 'z');
}

console.log('Double Char Part 2');
console.log(doubleConsonants('String'));          // "SSttrrinngg"
console.log(doubleConsonants('Hello-World!'));    // "HHellllo-WWorrlldd!"
console.log(doubleConsonants('July 4th'));        // "JJullyy 4tthh"
console.log(doubleConsonants(''));                // ""

// Reverse Number

function reverseNumber(num) {
  return Number(String(num).split('').reverse().join(''));
}

console.log('Reverse Number');
console.log(reverseNumber(12345));    // 54321
console.log(reverseNumber(12213));    // 31221
console.log(reverseNumber(456));      // 654
console.log(reverseNumber(12000));    // 21 -- Note that zeros get dropped!
console.log(reverseNumber(1));        // 1

// Get the Middle Character

function centerOf(string) {
  if (string.length % 2 === 1) {
    let centerIndex = (string.length - 1) / 2;
    return string[centerIndex];
  } else {
    let leftIndex = string.length / 2 - 1;
    return string.substring(leftIndex, leftIndex + 2);
  }
}

console.log('Get the Middle Character');
console.log(centerOf('I Love JavaScript')); // "a"
console.log(centerOf('Launch School'));     // " "
console.log(centerOf('Launch'));            // "un"
console.log(centerOf('Launchschool'));      // "hs"
console.log(centerOf('x'));                 // "x"

// Always Return Negative

function negative(num) {
  return -Math.abs(num);
}

console.log('Always Return Negative');
console.log(negative(5));     // -5
console.log(negative(-3));    // -3
console.log(negative(0));     // -0