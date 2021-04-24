// Wrap functionde declaration around parenthesis to make it into expression
(function() {
  console.log("Sometimes, syntax isn't intuitive!")
})();

//
var sum = 0;
var numbers;

sum += 10;
sum += 31;

numbers = [1, 7, -3, 3];

sum += (function(arr) {
  return arr.reduce(function(sum, number) {
    sum += number;
    return sum;
  }, 0)
})(numbers);

console.log(sum)

// countdown
function countdown(count) {(function(num) {
    for (let i = num; i>= 0; i--) {
      console.log(i)
    }
  })(count);
}

countdown(7)

