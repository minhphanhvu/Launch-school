function makePartialFunc(func, b) {
  return function(a) {
    return func(a, b,)
  }
}

function multiply(a, b) {
  return a * b;
}

let multiplyBy5 = makePartialFunc(multiply, 5);

console.log(multiplyBy5(100)); // 500

// makePartialFunc: generator to receive main arguments
// on line 2, we have applicator to receive the rest of the arguments
// multiply is the primary function

let subjects = {
  English: ['Bob', 'Tyrone', 'Lizzy'],
  Math: ['Fatima', 'Gary', 'Susan'],
  Biology: ['Jack', 'Sarah', 'Tanya'],
};

function rollCall(subject, students) {
  console.log(subject + ':');
  students.forEach(function(student) {
    console.log(student);
  });
}

function makeMathRollCall(subject) {
  return function(students) {
    return rollCall(subject, students)
  }
}

let mathRollCall = makeMathRollCall('Math');
mathRollCall(subjects['Math']);
// => Math:
// => Fatima
// => Gary
// => Susan
