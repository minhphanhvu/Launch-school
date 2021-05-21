function sliceTree(start, end) {
  let inner = document.querySelector("#" + CSS.escape(end));
  let outer = document.querySelector("#" + CSS.escape(start));
  if (!inner || !outer) {
    return undefined
  }
  let parent = inner.closest("#" + CSS.escape(start));
  if (!parent) {
    return undefined
  }
  let result = []
  while (inner !== outer) {
    result.push(inner.tagName);
    inner = inner.parentElement;
  }
  result.push(outer.tagName);

  return result.reverse();
}

document.addEventListener("DOMContentLoaded", () => {
  console.log(sliceTree(1, 4)); // ["ARTICLE", "HEADER", "SPAN", "A"]
  console.log(sliceTree(1, 76)); // undefined
  console.log(sliceTree(2, 5)); // undefined
  console.log(sliceTree(5, 4)); // undefined
  console.log(sliceTree(1, 23)); // ["ARTICLE", "FOOTER"]
  console.log(sliceTree(1, 22)); // ["ARTICLE", "MAIN", "SECTION", "P", "SPAN", "STRONG", "A"]
  console.log(sliceTree(11, 19)); // ["SECTION", "P", "SPAN", "STRONG", "A"]
})  