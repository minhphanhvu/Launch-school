let header = document.querySelector("body > header");
let h1 = document.querySelector("main > h1");
header.insertBefore(h1, header.firstChild);
document.body.insertBefore(header, document.body.firstChild);

let [chinStickFigure, babyMopFigure] = document.querySelectorAll("figure");
let babyMopImage = chinStickFigure.querySelector("img");
let chinStickImage = babyMopFigure.querySelector("img");
chinStickFigure.replaceChild(chinStickImage, babyMopImage)
babyMopFigure.insertBefore(babyMopImage, document.querySelectorAll("figcaption")[1])

// let [figcaptionStick, figcaptionBaby] = document.querySelectorAll("figcaption");
// chinStickFigure.insertBefore(chinStickImage, figcaptionStick);
// babyMopFigure.insertBefore(babyMopImage, figcaptionBaby);

let article = document.querySelector("article");
article.insertBefore(chinStickFigure, null);
article.insertBefore(babyMopFigure, null);
