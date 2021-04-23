function makeMultipleLister(num) {
  return function() {
    let number = num

    while (number < 100) {
      console.log(number)
      number += num
    }
  }
}

let lister = makeMultipleLister(13);
lister();

let total = 0;

function add(number) {
  total += number;
  console.log(total);
}

function subtract(number) {
  total -= number;
  console.log(total);
}
