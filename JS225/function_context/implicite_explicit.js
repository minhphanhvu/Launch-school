// function foo() {
//   return this;
// }

// let context = foo();
// console.log(context); // [object global]
// in strict mode -> undefined -> global object this is undefined

/*

let obj = {
  foo() {
    return this;
  },
};

let context = obj.foo();

console.log(context);  // {foo: f} the object obj itself

*/

/*

var message = 'Hello from the global scope!';

function deliverMessage() {
  console.log(this.message);
}

deliverMessage(); // 'Hello from the global scope!'

let bar = {
  message: 'Hello from the function scope!',
};

bar.deliverMessage = deliverMessage;

bar.deliverMessage(); // 'Hello from the function scope!'

*/

/*

var a = 10;
let b = 10;
let c = {
  a: -10,
  b: -10,
};

function add() {
  return this.a + b;
}

c.add = add;

console.log(add()); // 20
console.log(c.add()); // 0

*/

/*
let foo = {
  a: 1,
  b: 2,
};

let bar = {
   a: 'abc',
   b: 'def',
   add() {
     return this.a + this.b;
   },
};

console.log(bar.add.call(foo))
*/



let fruitsObj = {
  list: ['Apple', 'Banana', 'Grapefruit', 'Pineapple', 'Orange'],
  title: 'A Collection of Fruit',
};

function outputList(...args) {
  console.log(this.title + ':');

  args.forEach(function(elem) {
    console.log(elem);
  });
}

outputList.apply(fruitsObj, fruitsObj.list);
