const sectionElement = document.querySelector('section');

function makeBold(element) {
  element.style.fontWeight = 'bold';
  let event = new CustomEvent("bolded");
  
  element.dispatchEvent(event);
}

makeBold(element);

sectionElement.addEventListener('bolded', (event) => {
  alert(event.target.tagName);
  event.target.classList.add('highlight');
});