function totalArea(arr) {
  let areas = arr.map(rect => rect[0] * rect[1]);
  return areas.reduce((result, area) => result + area, 0);
}

let rectangles = [[3, 4], [6, 6], [1, 8], [9, 9], [2, 2]];

console.log(totalArea(rectangles));    // 141

function totalSquareArea(rects) {
  let areas = rects.filter(rect => rect[0] === rect[1]); 
  return totalArea(areas)
}

console.log(totalSquareArea(rectangles));    // 121