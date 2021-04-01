function myReduce(array, func, initial) {
  initial ||= array[0];

  array.forEach(value => {
    initial = func(initial, value);
  });

  return initial;
}

let smallest = (result, value) => (result <= value ? result : value);
let sum = (result, value) => result + value;

console.log(myReduce([5, 12, 15, 1, 6], smallest));           // 1
console.log(myReduce([5, 12, 15, 1, 6], sum, 10));            // 49