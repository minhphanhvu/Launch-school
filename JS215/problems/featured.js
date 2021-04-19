/*
Input:
  - Integer number n
Output:
  - A featured number > n
  - If not found, return "There is no possible number that fulfills those requirements."
Rules:
  - What is a featured number:
    - multiple of 7
    - must be odd
    - all of its digits occurs exactly once
    - the maximum possible featured number: 9876543201
  - The returned featured number must be > input n
Data structure:

Algorithm:
  - Get the nearest multiple <= number n -> increase one to get the next multiple
  - loop (while number > 9876543201)
    - if the number is odd and all of its digits occurs exactly once -> return that number
    - else increase to the next number
  - return "There is no possible number that fulfills those requirements."
  Helpers:
  - Check number is odd -> n % 2 === 0
  - Check all of its digists
    function isUniqueDigits(number):
      - initialize empty array digits
      - loop through String(number) characters
        - if array digits contains the char -> return false
        - else add the char to the array digits
      - at the end -> return true
  
*/

function isUniqueDigits(num) {
  let digits = []
  let charDigits = String(num).split('')

  for (let i = 0; i < charDigits.length; i++) {
    if (digits.includes(charDigits[i])) {
      return false
    } else {
      digits.push(charDigits[i])
    }
  }

  return true
}

function featured(num) {
  let multiple = Math.floor(num/7) + 1
  num = multiple * 7

  while (num <= 9876543201) {
    if (num % 2 !== 0 && isUniqueDigits(num)) {
      return num
    } else {
      num += 7
    }
  }

  return "There is no possible number that fulfills those requirements."
}


console.log(featured(12));           // 21
console.log(featured(20));           // 21
console.log(featured(21));           // 35
console.log(featured(997));          // 1029
console.log(featured(1029));         // 1043
console.log(featured(999999));       // 1023547
console.log(featured(999999987));    // 1023456987
console.log(featured(9876543186));   // 9876543201
console.log(featured(9876543200));   // 9876543201
console.log(featured(9876543201));   // "There is no possible number that fulfills those requirements."
