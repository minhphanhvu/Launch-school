// SUm of Digits

function sum(num) {
  let result = 0;

  while (num !== 0){
    result += num % 10;
    num = Math.floor(num/10);
  }
  
  return result;
}

console.log('Sum of digits');
console.log(sum(23));           // 5
console.log(sum(496));          // 19
console.log(sum(123456789));    // 45

// Alhabetical Numbers

function wordSort(num1, num2) {
  const NUMBER_WORDS = ['zero', 'one', 'two', 'three', 'four', 'five',
                        'six', 'seven', 'eight', 'nine', 'ten', 'eleven',
                        'twelve', 'thirteen', 'fourteen', 'fifteen',
                        'sixteen', 'seventeen', 'eighteen', 'nineteen'];
  if (NUMBER_WORDS[num1] > NUMBER_WORDS[num2]) {
    return 1;
  } else if (NUMBER_WORDS[num1] < NUMBER_WORDS[num2]) {
    return -1;
  } else {
    return 0;
  }
}

function alphabeticNumberSort(arr) {
  return arr.sort(wordSort);
}

console.log('alphabeticNumbers');
console.log(alphabeticNumberSort(
  [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]));
// [8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17, 6, 16, 10, 13, 3, 12, 2, 0]