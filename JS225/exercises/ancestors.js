// name property added to make objects easier to identify
const foo = {name: 'foo'};
const bar = Object.create(foo);
bar.name = 'bar';
const baz = Object.create(bar);
baz.name = 'baz';
const qux = Object.create(baz);
qux.name = 'qux';

console.log(foo.__proto__ === Object.prototype)
console.log(bar.__proto__ === foo)
console.log(foo.constructor === Object.prototype.constructor)
console.log(Object.prototype)
console.log(Object.prototype.__proto__ === null)
console.log(qux.__proto__.name)

Object.prototype.ancestors = function() {
  let currentPrototype = this.__proto__
  const result = []

  while (currentPrototype.name) {
    result.push(currentPrototype.name)
    currentPrototype = currentPrototype.__proto__
  }

  result.push('Object.prototype')

  return result
}


console.log(qux.ancestors());  // returns ['baz', 'bar', 'foo', 'Object.prototype']
// baz.ancestors();  // returns ['bar', 'foo', 'Object.prototype']
// bar.ancestors();  // returns ['foo', 'Object.prototype']
// foo.ancestors();  // returns ['Object.prototype']