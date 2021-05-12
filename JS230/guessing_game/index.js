document.addEventListener('DOMContentLoaded', () => {
  let randomValue = Math.floor(Math.random() * 100) + 1;
  let input = document.querySelector('#guess');
  let paragraph = document.querySelector('p');
  document.querySelector('form').addEventListener('submit', (event) => {
    event.preventDefault();
    let guess = parseInt(input.value, 10);
    let message;
    if (guess > randomValue) {
      message = `My number is lower than ${String(guess)}`;
    } else if (guess < randomValue) {
      message = `My number is higher than ${String(guess)}`;
    } else {
      message = `You guessed it!`;
    }
    paragraph.textContent = message;
  });
  let link = document.querySelector('a');
  link.addEventListener('click', event => {
    randomValue = Math.floor(Math.random() * 100) + 1;
    paragraph.textContent = 'Guess a number from 1 to 100';
    input.value = '';
  });
});