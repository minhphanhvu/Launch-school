// Literal

// const myObject = {
//   a: 'name',
//   'b': 'test',
//   123: 'c',
//   1: 'd',
// };

// myObject[1];
// // myObject[a]; // Must be a string // a is not declared
// myObject.a;

// Literal Method

const person = {
  firstName() {
    return 'Victor';
  },
  lastName() {
    return 'Reyes';
  },
};

console.log('Literal Method');
console.log(`${person.firstName()} ${person.lastName()}`);

// Mutation

const array1 = ['Moe', 'Larry', 'Curly', 'Shemp', 'Harpo', 'Chico', 'Groucho', 'Zeppo'];
const array2 = [];

for (let i = 0; i < array1.length; i += 1) {
  array2.push(array1[i]);
}

for (let i = 0; i < array1.length; i += 1) {
  if (array1[i].startsWith('C')) {
    array1[i] = array1[i].toUpperCase();
  }
}

console.log('Mutation');
console.log(array2);

// Dynamic

console.log('Dynamic---');
const myObject = {
  prop1: '123',
  prop2: '234',
  'prop 3': '345',
};

const prop2 = '456';
myObject['prop2'] = '456';
myObject[prop2] = '678';

console.log(myObject[prop2]);
console.log(myObject.prop2);

// Array Object part 1

console.log('Array Object Part 1---')
const myArray = ['a', 'b', 'c'];

console.log(myArray[0]);
console.log(myArray[-1]);

myArray[-1] = 'd';
myArray['e'] = 5;
myArray[3] = 'f';

console.log(myArray[-1]);
console.log(myArray['e']);
console.log(myArray);
console.log(myArray.length);

// Array Object Part 2

console.log('Array Object Part 2')
const myArray = [5, 5];
myArray[-1] = 5;
myArray[-2] = 5;

function average(array) {
  let sum = 0;

  for (let i = -2; i < array.length; i += 1) {
    sum += array[i];
  }

  return sum / array.length;
}

average(myArray);

// What's my Bonus

console.log('What''s my Bonus');
function calculateBonus() {
  return arguments[1] ? arguments[0] / 2 : 0;
}