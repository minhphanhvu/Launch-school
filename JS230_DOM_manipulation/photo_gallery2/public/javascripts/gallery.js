document.addEventListener("DOMContentLoaded", () => {
  let photos;
  let templates = {};

  [...document.querySelectorAll("script[type='text/x-handlebars']")].forEach(script => {
    templates[script["id"]] = Handlebars.compile(script["innerHTML"]);
  });

  [...document.querySelectorAll("script[data-type='partial']")].forEach(script => {
    Handlebars.registerPartial(script["id"], script["innerHTML"]);
  });

  // Transition slides
  const slideshow = {
    init: function() {
      this.slideshow = document.querySelector("#slideshow");
      let slides = this.slideshow.querySelectorAll("figure");
      this.firstSlide = slides[0];
      this.lastSlide = slides[slides.length - 1];
      this.currentSlide = this.firstSlide;
      this.bind();
    },
    bind: function() {
      let prevButton = this.slideshow.querySelector("a.prev");
      let nextButton = this.slideshow.querySelector("a.next");
      prevButton.addEventListener("click", (e) => { this.prevSlide(e) });
      nextButton.addEventListener("click", (e) => { this.nextSlide(e) });
    },
    nextSlide: function(e) {
      e.preventDefault();
      this.fadeOut(this.currentSlide);
      let next = this.currentSlide.nextElementSibling;
      if (!next) {
        next = this.firstSlide;
      }
      this.currentSlide = next;
      this.renderPhotoContent(Number(this.currentSlide.dataset.id));
      this.fadeIn(this.currentSlide);
    },
    prevSlide: function(e) {
      e.preventDefault();
      this.fadeOut(this.currentSlide);
      let prev = this.currentSlide.previousElementSibling;
      if (!prev) {
        prev = this.lastSlide;
      }
      this.currentSlide = prev;
      this.renderPhotoContent(Number(this.currentSlide.dataset.id));
      this.fadeIn(this.currentSlide);
    },
    fadeOut: function(slide) {
      slide.classList.add("hide");
      slide.classList.remove("show");
    },
    fadeIn: function(slide) {
      slide.classList.remove("hide");
      slide.classList.add("show");
    },
    renderPhotoContent: function(idx) {
      renderPhotoInformation(idx);
      getCommentsFor(idx);
    }
  }

  // Making request for photos
  let xhr = new XMLHttpRequest();
  xhr.responseType = "json";
  xhr.open("GET", "/photos");

  xhr.addEventListener("load", () => {
    photos = xhr.response;
    renderPhotos(photos);
    renderPhotoInformation(photos[0].id);
    getCommentsFor(photos[0].id);
    slideshow.init();
  });

  xhr.send();

  // Helpers
  function renderPhotos(photos) {
    let slides = document.querySelector("#slides");
    slides.insertAdjacentHTML("beforeend", templates.photos({ photos: photos }));
  }

  function renderPhotoInformation(idx) {
    let photo = photos.filter(p => p.id === idx)[0];
    let header = document.querySelector("section > header");
    header.textContent = "";
    header.insertAdjacentHTML("beforeend", templates.photo_information(photo));
  }

  function getCommentsFor(idx) {
    let newXhr = new XMLHttpRequest();
    newXhr.responseType = "json";;
    newXhr.open("GET", `/comments?photo_id=${idx}`);

    newXhr.addEventListener("load", () => {
      comments = newXhr.response;
      let ul = document.querySelector("#comments > ul");
      ul.textContent = "";
      ul.insertAdjacentHTML("beforeend", templates.photo_comments({ comments: comments }));
    })

    newXhr.send();
  }
})