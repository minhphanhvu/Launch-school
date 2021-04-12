/*
Input:
  - an argument integer n
  - Output: array of lights that are on

Understand:
  - n number of switches
  - all initially off
  - First pass: toggle on all of them
  - On second pass: toggle at 2 -> 4 -> 6 ...
  - On third pass: toggle at 3 -> 6 -> 9...
  - On fourth pass: toggle at 4 -> 8 -> 12 ....
  - How many times to start again? -> n times

Data structure: array
Algorithm: example: an array of 5 switches
[false, false, false ,false, false]

index = 0, stepJump = 1 -> index < 5
[true, true, true, true, true]

index = 1, stepJump = 2
[true, false, true, false, true]

index = 2, stepJump = 3
[true, false, false, false, true]

index = 3, stepJump = 4
[true, false, false, true, true]

index = 4, stepJump = 5
[true, false, false, true, false]

initialize index = 0;
initialize step = 1;
loop from 0 -> 5:
  start from index and loop again with step -> toggle
  out of the inner loop -> index += 1, step += 1
when done -> loop one more through to select the index that is true
*/

function lightsOn(switches) {
  const lights = initializeLights(switches);

  let step = 1;

  for (let i = 0; i < switches; i++) {
    for (let index = i; index < switches; index += step) {
      lights[index] = !lights[index]
    }
    step += 1;
  }

  const result = [];
  for (let i = 0; i < switches; i++) {
    if (lights[i]) {
      result.push(++i);
    }
  }

  return result;
}

function initializeLights(n) {
  const lights = [];

  for (let i = 0; i < n; i++) {
    lights[i] = false;
  }

  return lights;
}

console.log(lightsOn(3));        // [1]
console.log(lightsOn(4));        //[1, 4] 
// Round 1: all lights are on
// Round 2: lights 2 and 4 are now off
// Round 3: lights 2, 3, and 4 are now off
// Round 4: lights 2 and 3 are now off
console.log(lightsOn(5));        // [1, 4]
// Detailed result of each round for `5` lights
// Round 1: all lights are on
// Round 2: lights 2 and 4 are now off;     1, 3, and 5 are on
// Round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
// Round 4: lights 2 and 3 are now off;     1, 4, and 5 are on
// Round 5: lights 2, 3, and 5 are now off; 1 and 4 are on
console.log(lightsOn(6));        // [1, 4]
// Round 1: all lights are on
// ROund 2: lights 2, 4, and 6 are now off; 1, 3, and 5 are on
// Round 3: lights 2, 3, and 4 off; 1, 5, and 6 are on
// Rounc 4: lights 2 and 3 are off; 1, 4, 5, and 6 are on
// ROund 5: lights 2, 3, and 5 are off; 1, 4, and 6 are on
// Round 6: lights 2, 3, 5, and 6 are off; 1, 4 are on

console.log(lightsOn(100));      // [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]