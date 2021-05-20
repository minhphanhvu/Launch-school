todo_items = [
  { id: 1, title: 'Homework' },
  { id: 2, title: 'Shopping' },
  { id: 3, title: 'Calling Mom' },
  { id: 4, title: 'Coffee with John '}
];

document.addEventListener("DOMContentLoaded", () => {
  const templates = {};
  [...document.querySelectorAll("script[type='text/x-handlebars']")].forEach(script => {
    templates[script.id] = Handlebars.compile(script["innerHTML"]);
  });

  class App {
    constructor(templates, todos) {
      this.templates = templates;
      this.todos = todos;
    }
    initTodos() {
      document.querySelector("#todos").insertAdjacentHTML("beforeend", this.templates.todos_template({ todos: this.todos }));
    }
    addDeleteListener() {
      
    }
  }
  const app = new App(templates, todo_items);
  app.initTodos.call(app);
})