function makeCountry(name, continent) {
  return {
    name,
    continent,
    visited: false,

    getDescription() {
      return this.name + ' is located in ' + this.continent + '. I ' +
      (this.visited ? 'have' : "haven't") +
      ' visited ' + this.name + '.';
    },
    visitCountry() {
      this.visited = true
    }
  };
}

let chile = makeCountry('The Republic of Chile', 'South America');
let canada = makeCountry('Canada', 'North America');
let southAfrica = makeCountry('The Republic of South Africa', 'Africa');

console.log(chile.getDescription());       // "The Republic of Chile is located in South America."
console.log(canada.getDescription());      // "Canada is located in North America."
console.log(southAfrica.getDescription()); // "The Republic of South Africa is located in Africa."