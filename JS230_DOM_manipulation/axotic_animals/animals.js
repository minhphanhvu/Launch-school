document.addEventListener("DOMContentLoaded", () => {
  let timeOut;
  [...document.querySelectorAll("img")].forEach((img) => {
    img.addEventListener("mouseover", (e) => {
      timeOut = setTimeout(() => e.target.nextElementSibling.classList.add("show"), 2000);
    });
  });

  [...document.querySelectorAll("img")].forEach((img) => {
    img.addEventListener("mouseleave", () => {
      clearTimeout(timeOut);
      img.nextElementSibling.classList.remove("show");
    })
  });
})