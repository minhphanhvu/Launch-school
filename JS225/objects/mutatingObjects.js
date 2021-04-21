let message = 'Hello from the global scope!';

function func(message) {
  message = 'Hello from the function scope!';
  console.log(message);
}

func(message); // 'Hello from the function scope!'
console.log(message); // 'Hello from the global scope!'

let myObj = { message: 'Greetings from the global scope!' };

function func(obj) {
  obj.message = 'Greetings from the function scope!';
  console.log(obj.message);
}

func(myObj); //'Greetings from the function scope!'

console.log(myObj.message); // 'Greetings from the function scope!'