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

// 