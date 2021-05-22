class FieldSet {
  constructor() {
    this.fields = {};
    this.fillFields();
    this.addFieldEvents(); 
  }
  fillFields() {
    [...document.querySelectorAll("input")].forEach(input => {
      this.fields[input["id"]] = input;
    })
  }
  addFieldEvents() {
    for (var field in this.fields) {
      this.fields[field].addEventListener("focusout", (e) => {
        this.checkValidations.call(this, e.target, e.target.value);
      })
    }
  }
  checkValidations(input) {
    let isRequiredAndPattern = input.hasAttribute("required") && input.hasAttribute("pattern");
    let patternOnly = input.hasAttribute("pattern") && !input.hasAttribute("required");
    if (patternOnly) {
      this.checkNumber.call(this, input);
    } else if (!isRequiredAndPattern) {
      this.checkRequired.call(this, input, "required");
    } else if (isRequiredAndPattern) {
      this.checkRequiredAndPattern.call(this, input);
    }
  }
  checkRequired(input, type) {
    if (input.validity.valueMissing) {
      let message = this.setMessage.call(this, input, type);
      this.addMessage.call(this, input, message);
    } else {
      this.removeMessage.call(this, input);
    }
  }
  checkRequiredAndPattern(input) {
    let validity = input.validity;
    if (validity.valueMissing) {
      this.checkRequired.call(this, input, "required");
    } else if (validity.patternMismatch) {
      this.removeMessage.call(this, input);
      this.checkPatterns.call(this, input);
    } else {
      this.removeMessage.call(this, input);
    }
  }
  checkPatterns(input) {
    let message;
    if (input.getAttribute("name") === "password") {
      message = this.setMessage(input, "passwordInvalid");
      this.addMessage.call(this, input, message);
    } else if (input.getAttribute("name") === "email") {
      message = this.setMessage(input, "");
      this.addMessage.call(this, input, message);
    }
  }
  checkNumber(input) {
    let validity = input.validity;
    let message;
    if (validity.patternMismatch) {
      message = this.setMessage.call(this, input, "")
      this.addMessage.call(this, input, message)
    } else {
      this.removeMessage.call(this, input)
    }
  }
  setMessage(input, type) {
    let message = "";
    let inputName = input.getAttribute("name");
    inputName = inputName.split("_").map(name => name[0].toUpperCase() + name.slice(1)).join(" ");
    if (type === "required") {
      message += `${inputName} is a required field.`;
    } else if (type === "passwordInvalid") {
      message = "Password must be at least 10 characters long.";
    } else {
      message = `Please Enter a valid ${inputName}`;
    }
    return message;
  }
  addMessage(input, message) {
    input.nextElementSibling.textContent = message; 
    input.classList.add("error");
  }
  removeMessage(input) {
    input.classList.remove("error");
    input.nextElementSibling.textContent = '';
  }
}

let fieldSet = new FieldSet()
