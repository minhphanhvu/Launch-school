function callback1() {
  console.log('callback1');
}

function callback2() {
  console.log('callback2');
}

function callback3() {
  console.log('callback3');
}

function randomizer(...callbacks) {
  const sizes = callbacks.length;
  const time = 2 * sizes;

  callbacks.forEach((callback) => {
    setTimeout(() => callback(), Math.random() * time * 1000);
  }) 
  
  for (let i = 1; i <= time; i ++) {
    setTimeout(() => console.log(i), i * 1000);
  }
}

randomizer(callback1, callback2, callback3);

// Output:
// 1
// 2
// "callback2"
// 3
// "callback3"
// 4
// 5
// "callback1"
// 6