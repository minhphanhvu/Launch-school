document.addEventListener("DOMContentLoaded", () => {
  const cars = [
    { make: 'Honda', image: 'images/honda-accord-2005.jpg', model: 'Accord', year: 2005, price: 7000 },
    { make: 'Honda', image: 'images/honda-accord-2008.jpg', model: 'Accord', year: 2008, price: 11000 },
    { make: 'Toyota', image: 'images/toyota-camry-2009.jpg', model: 'Camry', year: 2009, price: 12500 },
    { make: 'Toyota', image: 'images/toyota-corrolla-2016.jpg', model: 'Corolla', year: 2016, price: 15000 },
    { make: 'Suzuki', image: 'images/suzuki-swift-2014.jpg', model: 'Swift', year: 2014, price: 9000 },
    { make: 'Audi', image: 'images/audi-a4-2013.jpg', model: 'A4', year: 2013, price: 25000 },
    { make: 'Audi', image: 'images/audi-a4-2013.jpg', model: 'A4', year: 2013, price: 26000 },
  ];
  
  const templates = {};
  [...document.querySelectorAll("script[type='text/x-handlebars']")].forEach(script => {
    templates[script["id"]] = Handlebars.compile(script["innerHTML"]);
  });

  [...document.querySelectorAll("script[data-type='partial']")].forEach(script => {
    Handlebars.registerPartial(script["id"], script["innerHTML"]);
  });

  class App {
    constructor() {
      this.initFilter();
      this.initCars();
    }
    initFilter() {
      let filters = document.getElementById("filters");
      filters
        .insertAdjacentHTML("beforeend", templates.filters_template({ 
          makes: this.extractFilter('make'),
          models: this.extractFilter('model'),
          prices: this.extractFilter('price'),
          years: this.extractFilter('year')
        }));
    }
    initCars() {
      let display = document.getElementById("cars");
      display.insertAdjacentHTML("beforeend", templates.cars_template({ cars: cars }));
    }
    extractFilter(filter) {
      return cars.map(car => car[filter])
    }
  }

  const app = new App();
})