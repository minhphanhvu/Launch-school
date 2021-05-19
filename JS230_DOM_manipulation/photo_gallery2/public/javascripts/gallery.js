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

  // Likes and favorites
  let header = document.querySelector("section > header");
  header.addEventListener("click", (e) => {
    e.preventDefault();
    let button = e.target;
    let buttonType = button.dataset.property;
    if (buttonType) {
      let dataId = button.dataset.id;
      let href = button.getAttribute("href");
      let data = `photo_id=${dataId}`
      let text = button.textContent;

      let xhr = new XMLHttpRequest();
      xhr.responseType = "json";
      xhr.open("POST", href);
      xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
      xhr.addEventListener("load", () => {
        json = xhr.response;
        button.textContent = text.replace(/\d+/, json.total);
      })
      xhr.send(data);
    }
  })

  // Posting comments
  let form = document.querySelector("form")
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    let data = new FormData(form);
    let currentSlide = slideshow.currentSlide
    data.set("photo_id", currentSlide.dataset.id);
    data = new URLSearchParams([...data])
    let url = form.getAttribute("action");
    let method = form.getAttribute("method");
    
    let xhr = new XMLHttpRequest();
    xhr.open(method, url);
    xhr.responseType = "json";
    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhr.addEventListener("load", () => {
      json = xhr.response;
      form.reset();
      let comments = document.querySelector("#comments ul");
      comments.insertAdjacentHTML("beforeend", templates.photo_comment(json))
    })
    xhr.send(data);
  })

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