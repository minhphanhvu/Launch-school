function makeCounter() {
  let count = 1;

  return () => {
    console.log(count++)
  };
}

const counter = makeCounter();
counter();
// more code
// the returned function has enclosed the variable count -> closure prevent garbage collector to deallocate memory for the object 1 online 2