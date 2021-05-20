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
      this.display = document.getElementById("cars");
      this.filters = document.getElementById("filters");
      this.initFilter();
      this.initCars();
      this.filterChangeDetect();
      this.addFilterListener();
    }
    initFilter() {
      this.filters
        .insertAdjacentHTML("beforeend", templates.filters_template({ 
          makes: this.extractFilter('make', cars),
          models: this.extractFilter('model', cars),
          prices: this.extractFilter('price', cars),
          years: this.extractFilter('year', cars)
        }));
    }
    initCars() {
      this.display.insertAdjacentHTML("beforeend", templates.cars_template({ cars: cars }));
    }
    extractFilter(filter, cars) {
      return cars.map(car => car[filter]).filter((val, idx, arr) => {
        return arr.indexOf(val) === idx;
      });
    }
    filterChangeDetect() {
      [...document.querySelectorAll("select")].forEach(select => {
        select.addEventListener("change", () => {
          let filterValues = [...document.querySelectorAll("select")].map(sel => sel.value);
          [filterValues[2], filterValues[3]] = [Number(filterValues[2]), Number(filterValues[3])];
          let filteredCars = this.filterCars.call(this, filterValues, cars);
          this.filters.textContent = '';
          this.filters
            .insertAdjacentHTML("beforeend", templates.filters_template({
              makes: this.extractFilter('make', filteredCars),
              models: this.extractFilter('model', filteredCars),
              prices: this.extractFilter('price', filteredCars),
              years: this.extractFilter('year', filteredCars)
            }))
        })
      })
    }
    addFilterListener() {
      document.querySelector(".filter_btn").addEventListener("click", (e) => {
        let filterValues = [...document.querySelectorAll("select")].map(sel => sel.value);
        [filterValues[2], filterValues[3]] = [Number(filterValues[2]), Number(filterValues[3])];
        let filteredCars = this.filterCars.call(this, filterValues, cars);
        this.display.textContent = '';
        this.display.insertAdjacentHTML("beforeend", templates.cars_template({cars: filteredCars}))
      })
    }
    filterCars(values, cars) {
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
      let filteredCars = cars.filter(car => this.rightCar(car, filters))
      return filteredCars
    }
    rightCar(car, filters) {
      for (let prop in filters) {
        if (car[prop] !== filters[prop]) {
          return false
        }
      }
      return true
    }
  }

  const app = new App();
})