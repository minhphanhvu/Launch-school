let invoices = {
  unpaid: [],

  paid: [],

  add(name, amount) {
    this.unpaid.push({ name, amount });
  },

  totalDue() {
    return this.unpaid.reduce((sum, invoice) => sum + invoice.amount, 0)
  },

  payInvoice(name) {
    let newUnpaid = []

    for (let i = 0; i < this.unpaid.length; i++) {
      if (this.unpaid[i].name === name) {
        this.paid.push(this.unpaid[i])
      } else {
        newUnpaid.push(this.unpaid[i])
      }
    }

    this.unpaid = newUnpaid
  },

  totalPaid() {
    return this.paid.reduce((sum, invoice) => sum + invoice.amount, 0)
  }
};

console.log(invoices.totalDue())
// console.log(invoices.add('Hardware store', 5612));
console.log(invoices.add('Due North Development', 250));
invoices.add('Moonbeam Interactive', 187.50);
invoices.add('Slough Digital', 300);
console.log(invoices);
console.log(invoices.totalDue())
invoices.payInvoice('Due North Development');
invoices.payInvoice('Slough Digital');
console.log(invoices.totalPaid());
console.log(invoices.totalDue());