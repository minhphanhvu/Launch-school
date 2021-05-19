document.addEventListener("DOMContentLoaded", () => {
  let photos;
  let templates = {};

  [...document.querySelectorAll("script[type='text/x-handlebars']")].forEach(script => {
    templates[script["id"]] = Handlebars.compile(script["innerHTML"]);
  });

  [...document.querySelectorAll("script[data-type='partial']")].forEach(script => {
    Handlebars.registerPartial(script["id"], script["innerHTML"]);
  });

  // Making request for photos
  let xhr = new XMLHttpRequest();
  xhr.responseType = "json";
  xhr.open("GET", "/photos");

  xhr.addEventListener("load", () => {
    photos = xhr.response;
    renderPhotos(photos);
    renderPhotoInformation(photos[0].id);
    getCommentsFor(photos[0].id);
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
    header.insertAdjacentHTML("beforeend", templates.photo_information(photo));
  }

  function getCommentsFor(idx) {
    let newXhr = new XMLHttpRequest();
    newXhr.responseType = "json";;
    newXhr.open("GET", `/comments?photo_id=${idx}`);

    newXhr.addEventListener("load", () => {
      comments = newXhr.response;
      let ul = document.querySelector("#comments > ul");
      ul.insertAdjacentHTML("beforeend", templates.photo_comments({ comments: comments }));
    })

    newXhr.send();
  }
})