function Triangle(side1, side2, side3) {
  this.side1 = side1;
  this.side2 = side2;
  this.side3 = side3;
  this.type = 'triangle';
}

shape = {
  getType() {
    return this.type;
  }
}

Triangle.prototype = shape
Triangle.prototype.getPerimeter = function() {
  return this.side1 + this.side2 + this.side3;
}

Triangle.prototype.constructor = Triangle;

let t = new Triangle(3, 4, 5);
console.log(t.constructor);                 // Triangle(a, b, c)
console.log(shape.isPrototypeOf(t));        // true
console.log(t.getPerimeter());              // 12
console.log(t.getType());                   // "triangle"

function User(first, last){
  if (!(this instanceof User)) {
    return new User(first, last);
  }

  this.name = first + ' ' + last;
}

// let name = 'Jane Doe';
// let user1 = new User('John', 'Doe');
// let user2 = User('John', 'Doe');

// console.log(name);         // => Jane Doe
// console.log(user2 instanceof Object)
// console.log(user1.name);   // => John Doe
// console.log(user2.name);   // => John Doe
// console.log(typeof user1)
// console.log(typeof user2)

//
function createObject(obj) {
  function F() {}
  F.prototype = obj;
  return new F();
}

// let foo = {
//   a: 1
// };

// let bar = createObject(foo);
// foo.isPrototypeOf(bar);         // true

//

Object.prototype.begetObject = function () {
  function F() {};
  F.prototype = this;
  return new F();
}

let foo = {
  a: 1
};

let bar = foo.begetObject();
foo.isPrototypeOf(bar);         // true

//
function neww(constructor, args) {
  let obj = Object.create(constructor.prototype);
  let result = constructor.apply(obj, args)

  return typeof result === 'object' ? result : obj;
}

function Person(firstName, lastName) {
  this.firstName = firstName;
  this.lastName = lastName;
}

Person.prototype.greeting = function() {
  console.log('Hello, ' + this.firstName + ' ' + this.lastName);
};

let john = neww(Person, ['John', 'Doe']);
john.greeting();          // => Hello, John Doe
console.log(john.constructor);         // Person(firstName, lastName) {...}