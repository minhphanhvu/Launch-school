function rot13(string) {
  const ROT_NUM = 13;
  let charCode = '';
  let result = '';

  for (let i = 0; i < string.length; i++) {
    charCode = string[i].charCodeAt(0);

    if (charCode >= 65 && charCode <= 90) {
      charCode = ((charCode - 65) + ROT_NUM) % 26 + 65; 
    } else if (charCode >= 97 && charCode <= 122) {
      charCode = ((charCode - 97) + ROT_NUM) % 26 + 97;
    }

    result += String.fromCharCode(charCode);
  }

  return result;
}

console.log(rot13('Teachers open the door, but you must enter by yourself.'));
console.log(rot13(rot13('Teachers open the door, but you must enter by yourself.')));