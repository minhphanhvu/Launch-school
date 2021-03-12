// Crunch

function crunch(str) {
  let resultStr = str[0];

  for (let i = 1; i < str.length - 1; i++) {
    if (resultStr.slice(-1) === str[i]) {
      continue;
    } else {
      resultStr += str[i];
    }
  }

  return resultStr;
}

console.log(crunch('ddaaiillyy ddoouubbllee'));    // "daily double"
console.log(crunch('4444abcabccba'));              // "4abcabcba"
console.log(crunch('ggggggggggggggg'));            // "g"
console.log(crunch('a'));                          // "a"
console.log(crunch(''));                           // ""

// Stringy Strings

console.log('Stringy Strings----')
function stringy(size) {
  let result = '';

  for (let i = 0; i < size; i += 1) {
    if (i % 2 === 0) {
      result += '1';
    } else {
      result += '0';
    }
  }

  return result;
}

console.log(stringy(6));    // "101010"
console.log(stringy(9));    // "101010101"
console.log(stringy(4));    // "1010"
console.log(stringy(7));    // "1010101"

// Fibonacci Number Location by Length

function findFibonacciIndexByLength(length) {
  let first = 1n;
  let second = 1n;
  let fibonacci;
  let count = 2n;

  do {
    fibonacci = first + second;
    first = second;
    second = fibonacci;
    count += 1n;
  } while (String(fibonacci).length < parseInt(String(length), 10))

  return count;
}

console.log('Fibonacci Number Location by Length');
console.log(findFibonacciIndexByLength(2n)); //=== 7n);    // 1 1 2 3 5 8 13
console.log(findFibonacciIndexByLength(3n)); //=== 12n);   // 1 1 2 3 5 8 13 21 34 55 89 144
console.log(findFibonacciIndexByLength(10n)); //=== 45n);
console.log(findFibonacciIndexByLength(16n)); //=== 74n);
console.log(findFibonacciIndexByLength(100n)); //=== 476n);

// Right Triangles
function triangle(height) {
  let stars = 1;
  let spaces = height - 1;

  for (let i = 0; i < height; i += 1) {
    console.log(repeat(' ', spaces) + repeat('*', stars));
    stars += 1;
    spaces -= 1;
  }
}

function repeat(char, count) {
  let repeated = '';

  for (let i = 0; i < count; i += 1) {
    repeated += char;
  }

  return repeated;
}

console.log('Right Triangles');
triangle(5);
triangle(9);

// Double Doubles

console.log('Double Doubles');
function twice(num) {
  let numStr = String(num);
  let length = numStr.length;

  if (numStr.slice(0, length/2) !== numStr.slice(length/2, length)) {
    return num * 2;
  }

  return num;
}

console.log(twice(37));          // 74
console.log(twice(44));          // 44
console.log(twice(334433));      // 668866
console.log(twice(444));         // 888
console.log(twice(107));         // 214
console.log(twice(103103));      // 103103
console.log(twice(3333));        // 3333
console.log(twice(7676));        // 7676

// Clean Up the Words
function cleanUp(text) {
  let cleanText = '';

  for (let i = 0; i < text.length; i += 1) {
    if (isLowerCaseLetter(text[i]) || isUpperCaseLetter(text[i])) {
      cleanText += text[i];
    } else if (cleanText[cleanText.length - 1] !== ' ') {
      cleanText += ' ';
    }
  }

  return cleanText;
}

const isLowerCaseLetter = (char) => char >= 'a' && char <= 'z';

const isUpperCaseLetter = (char) => char >= 'A' && char <= 'Z';

console.log('Clean Up the Words---');
console.log(cleanUp("---what's my +*& line?"));    // " what s my line "

// What Century

function century(year) {
  let century = Math.ceil(year/100);
  let suffix = centurySuffix(century);

  return String(century) + suffix;
}

function centurySuffix(centuryNumber) {
  if (catchWithTh(centuryNumber % 100)) {
    return 'th';
  }

  let lastDigit = centuryNumber % 10;
  switch (lastDigit) {
    case 1: return 'st';
    case 2: return 'nd';
    case 3: return 'rd';
    default: return 'th';
  }
}

function catchWithTh(lastTwo) {
  return lastTwo === 11 || lastTwo === 12 || lastTwo === 13;
}

console.log('What Century---')
console.log(century(2000));        // "20th"
console.log(century(2001));        // "21st"
console.log(century(1965));        // "20th"
console.log(century(256));         // "3rd"
console.log(century(5));           // "1st"
console.log(century(10103));       // "102nd"
console.log(century(1052));        // "11th"
console.log(century(1127));        // "12th"
console.log(century(11201));       // "113th"

