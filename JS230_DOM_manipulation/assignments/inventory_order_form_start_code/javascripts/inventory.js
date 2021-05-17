var inventory;

(function() {
  inventory = {
    lastId: 0,
    collection: [],
    setDate: function() {
      let date = new Date();
      document.body.querySelector("#order_date").textContent = date.toUTCString();
    },
    cacheTemplate: function() {
      let iTmpl = document.querySelector('#inventory_item');
      this.template = Handlebars.compile(iTmpl.innerHTML);
      iTmpl.remove();
    },
    add: function() {
      this.lastId++;
      var item = {
        id: this.lastId,
        name: "",
        stock_number: "",
        quantity: 1
      };
      this.collection.push(item);

      return item;
    },
    remove: function(idx) {
      this.collection = this.collection.filter(function(item) {
        return item.id !== idx;
      });
    },
    get: function(id) {
      let found_item;

      this.collection.forEach(function(item) {
        if (item.id === id) {
          found_item = item;
        }
      });

      return found_item;
    },
    update: function(itemRow) {
      let id = this.findID(itemRow);
      let item = this.get(id);

      item.name = itemRow.querySelector("[name^=item_name]").value;
      item.stock_number = itemRow.querySelector("[name^=item_stock_number]").value;
      item.quantity = itemRow.querySelector("[name^=item_quantity]").value;
      console.log(this.collection)
    },
    newItem: function(e) {
      e.preventDefault();
      let item = this.add();
      document.querySelector('#inventory')
              .insertAdjacentHTML('beforeend', this.template({ id: item.id }));
    },
    findParent: function(e) {
      return e.target.closest("tr");
    },
    findID: function(itemRow) {
      return Number(itemRow.querySelector("input[type=hidden]").value);
    },
    deleteItem: function(e) {
      e.preventDefault();
      let anchorTag = e.target.tagName
      if (anchorTag === "A" && e.target.classList.contains("delete")) {
        let item = this.findParent(e);
        this.remove(this.findID(item));
        item.remove();
      }
    },
    updateItem: function(e) {
      if (e.target.tagName === "INPUT") {
        let item = this.findParent(e);

        this.update(item);
      }
    },
    bindEvents: function() {
      let self = this;
      document.getElementById("add_item").addEventListener("click", (event) => {
        self.newItem.call(self, event);
      });
      document.querySelector("#inventory").addEventListener("click", (event) => {
        self.deleteItem.call(self, event);
      });
      document.querySelector("#inventory").addEventListener("focusout", (event) => {
        self.updateItem.call(self, event);
      });
    },
    init: function() {
      this.setDate();
      this.cacheTemplate();
      this.bindEvents();
    }
  };
})();

document.addEventListener("DOMContentLoaded", () => inventory.init.bind(inventory)());
