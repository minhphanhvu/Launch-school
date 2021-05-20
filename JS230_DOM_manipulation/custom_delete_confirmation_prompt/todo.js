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
      this.confirmPrompt = document.querySelector(".confirm_prompt");
    }
    initTodos() {
      document.querySelector("#todos")
        .insertAdjacentHTML("beforeend", this.templates.todos_template({ todos: this.todos }));
    }
    addDeleteListeners() {
      [...document.querySelectorAll(".remove")].forEach(x => {
        x.addEventListener("click", (e) => {
          let todoId = e.target.closest("li").dataset.id;
          this.displayDeleteConfirmation.call(this, todoId);
        })
      })
    }
    displayDeleteConfirmation(id) {
      this.confirmPrompt
        .insertAdjacentHTML("beforeend", this.templates.confirm_template({id: id}));
      this.showConfirmPrompt.call(this);
      this.addConfirmationListeners.call(this, id);
    }
    addConfirmationListeners(id) {
      let [confirmYes, confirmNo] = [...document.querySelectorAll(".actions a")];
      confirmNo.addEventListener("click", (e) => {
        e.preventDefault();
        this.removeConfirmPrompt.call(this);
      });
      confirmYes.addEventListener("click", (e) => {
        e.preventDefault();
        this.removeTodo(id)
      })
    }
    showConfirmPrompt() {
      this.confirmPrompt.classList.remove("hide");
    }
    removeConfirmPrompt() {
      this.confirmPrompt.textContent = "";
      this.confirmPrompt.classList.add("hide");
    }
    removeTodo(id) {
      document.querySelector(`li[data-id='${id}']`).remove();
      this.reset();
    }
    reset() {
      this.removeConfirmPrompt.call(this);
    }
  }
  const app = new App(templates, todo_items);
  app.initTodos.call(app);
  app.addDeleteListeners.call(app);
})