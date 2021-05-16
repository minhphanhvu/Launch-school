document.addEventListener("DOMContentLoaded", () => {
  let form = document.querySelector("form")
  form.addEventListener("submit", (event) => {
    event.preventDefault()
    const getValueOf = (selector) => form.querySelector(selector).value;
    let ul = document.querySelector("ul")
    let name = getValueOf("#name")
    let quantity = getValueOf("#quantity") || "1"
    
    let listNode = document.createElement("li")
    listNode.textContent = quantity + " " + name
    ul.appendChild(listNode)
    let field = document.querySelector("fieldset")
    Array.prototype.forEach.call(field.childNodes, (node) => {
      if (node.tagName === "INPUT") {
        node.value = ""
      }
    })
  })
})