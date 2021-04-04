function octalToDecimal(numberString) {
  const charArray = numberString.split('');
  let expo = numberString.length - 1;
  let result = 0;

  charArray.forEach(char => {
    result += Number(char)*Math.pow(8, expo);
    expo -= 1;
  })

  return result;
}

console.log(octalToDecimal('1'));           // 1
console.log(octalToDecimal('10'));          // 8
console.log(octalToDecimal('130'));         // 88
console.log(octalToDecimal('17'));          // 15
console.log(octalToDecimal('2047'));        // 1063
console.log(octalToDecimal('011'));         // 9