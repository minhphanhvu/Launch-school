const myBoolean = true;
const myString = 'hello';
const myArray = [];
const myOtherString = '';

if (myBoolean) {
  console.log('Hello'); // Hello
}

if (!myString) {
  console.log('World'); // Conditional expression is evaluated to be falsy
}

if (!!myArray) {
  console.log('World'); // World
}

if (myOtherString || myArray) {
  console.log('!'); // !
}

// let name = 'Bob';
// const saveName = name;
// name = 'Alice';
// console.log(name, saveName); // Alice Bob - variable name is reassigned.

const name = 'Bob';
const saveName = name;
name.toUpperCase(); // Return new String value -> name still points to 'Bob'
console.log(name, saveName);

const readlineSync = require("readline-sync");

console.log("Enter the first number:");
let firstNumber = Number(readlineSync.prompt());
console.log("Enter the second number:");
let secondNumber = Number(readlineSync.prompt());

console.log(`${firstNumber} + ${secondNumber} = ${firstNumber + secondNumber}`);
console.log(`${firstNumber} - ${secondNumber} = ${firstNumber - secondNumber}`);
console.log(`${firstNumber} * ${secondNumber} = ${firstNumber * secondNumber}`);
console.log(`${firstNumber} / ${secondNumber} = ${Math.floor(firstNumber / secondNumber)}`);
console.log(`${firstNumber} % ${secondNumber} = ${firstNumber % secondNumber}`);
console.log(
  `${firstNumber} ** ${secondNumber} = ${Math.pow(firstNumber, secondNumber)}`
);

// Read a phrase and output how many characters

let phrase = readlineSync.prompt('Please enter a phrase: ');
console.log(`There are ${phrase.length} characters in "${phrase}"`)

// Convert a Number to String
console.log('Convert a Number to a Number');

const DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];

function integerToString(number) {
  let result = '';

  do {
    let remainder = number % 10;
    number = Math.floor(number / 10);

    result = DIGITS[remainder] + result;
  } while (number > 0);

  return result;
}
