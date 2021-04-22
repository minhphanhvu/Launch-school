// problem 1
let turk = {
  firstName: "Christopher",
  lastName: "Turk",
  occupation: "Surgeon",
  getDescription() {
    return (
      this.firstName + " " + this.lastName + " is a " + this.occupation + "."
    );
  },
};

function logReturnVal(func, context) {
  let returnVal = func.call(context);
  console.log(returnVal);
}

logReturnVal(turk.getDescription, turk);
let getTurkDescription = turk.getDescription.bind(turk);
console.log(getTurkDescription());

// problem 2
let TESgames = {
  titles: ["Arena", "Daggerfall", "Morrowind", "Oblivion", "Skyrim"],
  seriesTitle: "The Elder Scrolls",
  listGames() {
    this.titles.forEach(title => console.log(this.seriesTitle + " " + title));
  },
};

TESgames.listGames();

// problem 3
let foo = {
  a: 0,
  incrementA() {
    let increment = function() {
      this.a += 1;
    }.bind(this)

    increment();
    increment();
    increment();
  }
};

foo.incrementA();
foo.incrementA();
foo.incrementA();
console.log(foo.a);
