// Welcoem Stranger

function greetings(arr, obj) {
  console.log(`Hello, ${arr.join(' ')}! Nice to have a ${obj['title']} ${obj['occupation']} around.`)
}

console.log('greetings');
greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' });

// Repeated Characters

function repeatedCharacters(str) {
  let counts = {};

  for (let i = 0; i < str.length; i++) {
    if (counts[str[i]] === undefined) {
      counts[str[i].toLowerCase()] = 1;
    } else {
      counts[str[i].toLowerCase()] += 1;
    }
  }

  for (let key in counts) {
    if (counts[key] === 1) {
      delete counts[key];
    }
  }

  return counts;
}

console.log('Repeated Characters');
console.log(repeatedCharacters('Programming'));    // { r: 2, g: 2, m: 2 }
console.log(repeatedCharacters('Combination'));    // { o: 2, i: 2, n: 2 }
console.log(repeatedCharacters('Pet'));            // {}
console.log(repeatedCharacters('Paper'));          // { p: 2 }
console.log(repeatedCharacters('Baseless'));       // { s: 3, e: 2 }

