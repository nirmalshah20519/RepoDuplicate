interface Product {
  PID: number;
  ProductName: string;
  Quantity: number;
}

interface Order {
  OID: number;
  PID: number;
  ProductName: string;
  Quantity: number;
  OrderDate: Date;
}

interface Inventory {
  // Products: Product[];
  // Orders: Order[];
  addProduct(pname: string, qty: number): void;
  addOrder(product: Product): void;
  requestOrder(pid: number, qty: number): void;
  renderOrderSummary(): void;
  renderInventoryData(): void;
  renderSelectData(): void;
}

class Product implements Product {
  public constructor(
    public PID: number,
    public ProductName: string,
    public Quantity: number
  ) {}
}

class Order implements Order {
  public constructor(
    public OID: number,
    public PID: number,
    public ProductName: string,
    public Quantity: number,
    public OrderDate: Date
  ) {}
}

class Inventory implements Inventory {
  private Products: Product[] = [];
  private Orders: Order[] = [];
  requestOrder(pid: number, qty: number) {
    let arr: Product | undefined = this.Products.find((val) => val.PID === pid);
    if (arr!.Quantity < qty) {
      alert(
        `${qty} number of ${arr!.ProductName} is not available in Inventory`
      );
    } else {
      arr!.Quantity -= qty;
      this.renderInventoryData();
      this.renderSelectData();
      alert(`Order Created Successfully`);
      let id:number =
        this.Orders.length === 0
          ? 1
          : this.Orders[this.Orders.length - 1].OID + 1;
      let order = new Order(id,pid,arr!.ProductName,qty,new Date());
      this.Orders.push(order)
      this.renderOrderSummary();
    }
  }
  addProduct(pname: string, qty: number) {
    let id: number;
    let checkAlreadyExists: Product = this.Products.find(
      (val) => val.ProductName.toLowerCase() === pname.toLowerCase()
    )!;
    if (checkAlreadyExists !== undefined) {
      checkAlreadyExists.Quantity += qty;
      this.renderInventoryData();
    } else {
      id =
        this.Products.length == 0
          ? 1
          : this.Products[this.Products.length - 1].PID + 1;
      let item: Product = new Product(id, pname, qty);
      this.Products.push(item);
      this.renderInventoryData();
      this.renderSelectData();
    }
  }
  renderOrderSummary() {
    let data: HTMLElement | null = document.getElementById("orderSummary");
    let str: string = `<table class="table table-striped">
    <caption></caption>
    <thead>
      <tr>
        <th>OID</th>
        <th>PID</th>
        <th>Product Name</th>
        <th>Quantity</th>
        <th>Order Date</th>
      </tr>
    </thead>
    <tbody>`;
    for (const i in this.Orders) {
      str += `<tr>
      <td>${this.Orders[i].OID}</td>
      <td>${this.Orders[i].PID}</td>
      <td>${this.Orders[i].ProductName}</td>
      <td>${this.Orders[i].Quantity}</td>
      <td>${this.Orders[i].OrderDate.toDateString()}</td>
    </tr>`;
    }
    str += `</tbody></table>`;
    data!.innerHTML = str;
  }
  renderInventoryData() {
    let data: HTMLElement | null = document.getElementById("data");
    let str: string = `<table class="table">
    <caption></caption>
    <thead>
      <tr>
        <th>PID</th>
        <th>Product Name</th>
        <th>Quantity</th>
      </tr>
    </thead>
    <tbody>`;
    for (const i in this.Products) {
      str += `<tr>
      <td>${this.Products[i].PID}</td>
      <td>${this.Products[i].ProductName}</td>
      <td>${this.Products[i].Quantity}</td>
    </tr>`;
    }
    str += `</tbody></table>`;
    data!.innerHTML = str;
  }
  renderSelectData() {
    let data: HTMLElement | null = document.getElementById("productSelect");
    let str: string = `<option value="${null}">---Select Product---</option>`;
    for (const i in this.Products) {
      str += `<option value="${this.Products[i].PID}">${this.Products[i].ProductName}</option>`;
    }
    data!.innerHTML = str;
  }
}

let myInventory: Inventory = new Inventory();
myInventory.addProduct("Watch", 51);
myInventory.addProduct("Toy", 98);
myInventory.addProduct("Mobile", 12);
myInventory.addProduct("Glass", 41);
myInventory.addProduct("Laptop", 6);

(function () {
  myInventory.renderInventoryData();
  myInventory.renderSelectData();
  myInventory.renderOrderSummary();

})();
(document.getElementById("addProd") as HTMLElement).addEventListener(
  "click",
  () => {
    let pname: string = (document.getElementById("pName") as HTMLFormElement)!
      .value;
    let qty: number = Number(
      (document.getElementById("pQty") as HTMLFormElement)!.value
    );
    myInventory.addProduct(pname, qty);
    (document.getElementById("inventory") as HTMLFormElement).reset();
  }
);

(document.getElementById("order") as HTMLElement).addEventListener(
  "click",
  () => {
    let pid: number = Number(
      (document.getElementById("productSelect") as HTMLFormElement)!.value
    );
    let qty: number = Number(
      (document.getElementById("QtySelect") as HTMLFormElement)!.value
    );
    if (qty < 5) {
      alert("Minimum quantity required for order is 5");
      (document.getElementById("selectForm") as HTMLFormElement).reset();
    } else {
      myInventory.requestOrder(pid, qty);
      (document.getElementById("selectForm") as HTMLFormElement).reset();
    }
  }
);
