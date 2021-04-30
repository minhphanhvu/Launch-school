// What is this
const person = {
  firstName: 'Rick ',
  lastName: 'Sanchez',
  fullName: this.firstName + this.lastName,
};

console.log(person.fullName); // this referes to global object -> NaN

// The Franchise
const franchise = {
  name: 'How to Train Your Dragon',
  allMovies() {
    return [1, 2, 3].map(number => `${this.name} ${number}`);
  },

};

console.log(franchise.allMovies())

// The Franchise 2
// const franchise = {
//   name: 'How to Train Your Dragon',
//   allMovies() {
//     return [1, 2, 3].map(function(number) {
//       return `${this.name} ${number}`;
//     }).bind(this);
//   },
// };

// Our very own bind()
// function myBind(func, context) {
//   return function(...args) {
//     return func.apply(context, args)
//   }
// }

// myBind improved
function myBind(func, context, ...primaryArgs) {
  return function(...secondArgs) {
    const fullArgs = primaryArgs.concat(secondArgs)
    return func.apply(context, fullArgs)
  }
}

function addNumbers(a, b) {
  return a + b;
}

const addFive = myBind(addNumbers, null, 5);

console.log(addFive(10)); // 15

// 