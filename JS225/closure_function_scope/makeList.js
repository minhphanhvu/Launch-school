function makeList() {
  let items = []
  return {

    list() {
      if (items.length === 0) {
        console.log('The list is empty!')
      } else {
        items.forEach(item => console.log(item))
      }
    },

    add(itemName) {
      let index = items.indexOf(itemName)
      if (index === -1) {
        items.push(itemName)
        console.log(itemName + ' added!')
      } else {
        console.log(itemName + ' already added')
      }
    },

    remove(itemName) {
      let index = items.indexOf(itemName)
      if (index === -1) {
        console.log(itemName + ' is not in the list')
      } else {
        items.splice(index, 1)
        console.log(itemName + ' removed!')
      }
    },

    clear() {
      items = [];
      console.log('all items deleted!');
    },
  }
}

let list = makeList()
list.add('peas')
list.list()
list.add('corn')
list.list()
list.remove('peas')
list.list()
console.log(list.items) // undefined
