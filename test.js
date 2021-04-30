let Dog = function() {};

Dog.prototype.say = function() {
  console.log(this.name + ' says Woof!');
}

Dog.prototype.run = function() {
  console.log(this.name + ' runs away.');
}

let fido = new Dog();
fido.name = 'Fido';
fido.say();             // => Fido says Woof!
fido.run();             // => Fido runs away.

let spot = new Dog();
spot.name = 'Spot';
spot.say();             // => Spot says Woof!
spot.run();             // => Spot runs away.
console.log(Dog.prototype.isPrototypeOf(spot));
console.log(Dog.prototype.__proto__);