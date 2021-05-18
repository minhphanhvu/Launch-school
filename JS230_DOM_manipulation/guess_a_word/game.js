document.addEventListener("DOMContentLoaded", () => {
  const message = document.querySelector("#message");
  const spaces = document.querySelector("#spaces");
  const guesses = document.querySelector("#guesses");
  const apples = document.querySelector("#apples");
  apples.classList.add("guess_0")
  const replay = document.querySelector("#replay");

  var randomWord = function() {
    // var words = ['apple', 'banana', 'orange', 'pear'];
    var words = ['apples'];
  
    return function() {
      var word = words[Math.floor(Math.random() * words.length)];
      words.splice(words.indexOf(word), 1);
      return word;
    };
  }();
  
  class Game {
    constructor() {
      this.word = randomWord();
      this.inGuesses = 0;
      this.totalGuesses = 6;
      this.guessedLetters = [];
      if (!this.word) {
        this.displayMessage("Sorry, I've run out of words!");
        return this;
      }
      this.word = this.word.split("");
    }

    displayMessage(text) {
      message.textContent = text;
    }

    createBlanks() {
      let previousSpans = spaces.querySelectorAll("span");
      previousSpans.forEach(span => {
        span.parentNode.removeChild(span);
      });

      let spans = (new Array(this.word.length + 1)).join("<span></span>");
      spaces.insertAdjacentHTML('beforeend', spans);
      this.spaceSpans = document.querySelectorAll("#spaces span");
    }
  }


  let game = new Game();
  game.createBlanks();

  function createSpan(text) {
    let span = document.createElement('span')
    span.textContent = text
    return span
  }

  function extractIndexes(wordArr, key) {
    let indexes = [];
    wordArr.forEach((letter, index) => {
      key === letter ? indexes.push(index) : false
    });
    return indexes;
  }

  let losses = 0;
  document.addEventListener('keyup', (event) => {
    let key = String.fromCharCode(event.which).toLowerCase();

    guesses.insertAdjacentElement('beforeend', createSpan(key));
    if (game.word.includes(key)) {
      let indexes = extractIndexes(game.word, key);
      let spans = spaces.querySelectorAll('span');
      indexes.forEach(index => {
        spans.item(index).textContent = key;
      })
    } else {
      apples.classList.replace(`guess_${losses++}`, `guess_${losses}`);
    }

    if (losses === 6) {
      document.body.classList.add('lose');
      message.textContent = "Sorry! You're out of guesses"
      replay.textContent = 'Play another';
    }
  })
})