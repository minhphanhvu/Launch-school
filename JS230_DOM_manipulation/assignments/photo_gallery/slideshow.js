$(function() {
  let $slideshow = $("#slideshow");
  let $nav = $slideshow.find("ul");

  $nav.on("click", "a", function(e) {
    e.preventDefault();
    let $li = $(e.currentTarget).closest("li")
    let $img = $(e.currentTarget).find("img");
    let src = $img.attr("src")
    console.log(src)

    $slideshow.find("figure").stop().filter(":visible").fadeOut(300);
    $slideshow.find("figure img").attr("src", src);
    $slideshow.find("figure").delay(300).fadeIn(300);
    $nav.find(".active").removeClass("active");
    $li.addClass("active");
  });
});