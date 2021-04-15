function isNumber(char) {
  return String(Number(char)) === char
}

function getEndingStr(strng) {
  let endingStrNumber = ''
  let i = strng.length - 1;

  for (; i >= 0; i--) {
    if (isNumber(strng[i])) {
      endingStrNumber += strng[i];
    } else {
      break
    }
  }

  endingStrNumber = endingStrNumber.split('').reverse().join('')
  i++

  return { endingStrNumber, i }
}

function transformEndingStr(endingStrNumber) {
  if (!endingStrNumber) {
    return '1'
  } else {
    let numberSize = endingStrNumber.length

    endingStrNumber = String(Number(endingStrNumber) + 1)
    if (endingStrNumber.length < numberSize) {
      let numberOfZeros = numberSize - endingStrNumber.length
      endingStrNumber = endingStrNumber.split('')

      for (let i = 0; i < numberOfZeros; i++) {
        endingStrNumber.splice(0, 0, '0')
      }
      endingStrNumber = endingStrNumber.join('')
    }
  }

  return endingStrNumber
}

function incrementString(strng) {
  strng = strng.split(/\s/).join('')

  let { endingStrNumber, i } =  getEndingStr(strng)

  endingStrNumber = transformEndingStr(endingStrNumber)

  return strng.slice(0, i) + endingStrNumber
}

console.log(incrementString('foo')) // foo1
console.log(incrementString('foobar23')) //foobar24
console.log(incrementString('foo0042')) //foo0043
console.log(incrementString('foo9')) // foo10
console.log(incrementString('foo099')) // foo100
console.log(incrementString('fo0o099')) // fo0o100
console.log(incrementString('foobar0099')) // foobar0100
console.log(incrementString('foobar099  ')) // foobar100

// 23 -> 24
// 0042 -> 0043
// '9' -> '10'
// '099' -> '100'
// '0099' -> '0100'
/* Algoirithm:
    - Count the length of string
    - Turn to number and + 1
    - If the length of the new number is smaller than the actual length --> add more trailing 0
      - Else: Keep it as it is 
*/