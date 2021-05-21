function nodeSwap(id1, id2) {
  let div1 = document.querySelector("#" + CSS.escape(id1));
  let div2 = document.querySelector("#" + CSS.escape(id2));

  if (!validInput(div1, id1, div2, id2)) {
    return;
  }

  let clone1Div = div1.cloneNode(true);
  let clone2Div = div2.cloneNode(true);
  let div1Parent = div1.parentElement;
  let div2Parent = div2.parentNode;
  div1Parent.replaceChild(clone2Div, div1);
  div2Parent.replaceChild(clone1Div, div2);
}

function validInput(div1, id1, div2, id2) {
  if (!div1 || !div2) {
    return false
  }

  if (div1.closest("#" + CSS.escape(id2)) || div2.closest("#" + CSS.escape(id1))) {
    return false
  }

  return true
}

document.addEventListener("DOMContentLoaded", () => {
  nodeSwap(1, 20); //false
  nodeSwap(1, 4); //false
  nodeSwap(9, 3); //false
  // nodeSwap(1, 2); // true
  nodeSwap(3, 1); // true
  nodeSwap(7, 9); // true
})