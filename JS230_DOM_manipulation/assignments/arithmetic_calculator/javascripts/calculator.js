document.addEventListener("submit", (event) => {
  event.preventDefault()
  let select = document.getElementById("operator")
  const operator = select.value
  const firstNumber = Number(document.getElementById("first-number").value)
  const secondNumber = Number(document.getElementById("second-number").value)

  let result
  switch(operator) {
    case "+":
      result = firstNumber + secondNumber
      break
    case "-":
      result = firstNumber - secondNumber
      break
    case "*":
      result = firstNumber * secondNumber
      break
    case "/":
      result = firstNumber / secondNumber
      break
    default:
      result = 0
  }

  result = String(result)
  let h1 = document.querySelector("h1")
  let oldResult = h1.childNodes[0]
  let newResult = document.createTextNode(result)
  h1.replaceChild(newResult, oldResult)
})