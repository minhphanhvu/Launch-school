const cars = [
  { make: 'Honda', image: 'images/honda-accord-2005.jpg', model: 'Accord', year: 2005, price: 7000 },
  { make: 'Honda', image: 'images/honda-accord-2008.jpg', model: 'Accord', year: 2008, price: 11000 },
  { make: 'Toyota', image: 'images/toyota-camry-2009.jpg', model: 'Camry', year: 2009, price: 12500 },
  { make: 'Toyota', image: 'images/toyota-corrolla-2016.jpg', model: 'Corolla', year: 2016, price: 15000 },
  { make: 'Suzuki', image: 'images/suzuki-swift-2014.jpg', model: 'Swift', year: 2014, price: 9000 },
  { make: 'Audi', image: 'images/audi-a4-2013.jpg', model: 'A4', year: 2013, price: 25000 },
  { make: 'Audi', image: 'images/audi-a4-2013.jpg', model: 'A4', year: 2013, price: 26000 },
];

function rightCar(car, filters) {
  for (let prop in filters) {
    if (car[prop] !== filters[prop]) {
      return false
    }
  }

  return true
}

function filterCars(values, cars) {
  const props = ['make', 'model', 'price', 'year'];
  let filters = {};
  values.forEach((val, idx) => {
    if (val) {
      filters[props[idx]] = val;
    }
  })

  if (Object.keys(filters).length === 0) {
    return cars;
  }

  let filteredCars = cars.filter(car => rightCar(car, filters))

  return filteredCars
}

/* values = [make, model, price, year]
values = ['', 'Accord', '', 2005] => [cars[0]]

values = ['', '', '', ''] => [...cars]

values = ['Toyota', '', '', ''] => [cars[0], cars[1]]

values = ['Audi', 'A4', 25000, ''] => [cars[5]]
*/

console.log(filterCars(['', 'Accord', '', 2005], cars));
// console.log(filterCars(['', '', '', ''], cars));
console.log(filterCars(['Toyota', '', '', ''], cars));
console.log(filterCars(['Audi', 'A4', 25000, ''], cars));