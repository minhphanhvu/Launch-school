function makeCar(rate, brakingRate) {
  return {
    speed: 0,
    brakingRate,
    rate,

    accelerate() {
      this.speed += this.rate;
    },
    brake() {
      let newSpeed = this.speed - brakingRate;
      this.speed = newSpeed < 0 ? 0 : newSpeed;
    }
  };
}

let hatchBackCar = makeCar(9);
