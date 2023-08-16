export {};

interface Employee {
  ID: number;
  firstname: string;
  lastName: string;
  address: string;
  salary: number;
  // addEmp:Function
}

class EmployeeClass implements Employee {
  public constructor(
    public ID: number,
    public firstname: string,
    public lastName: string,
    public address: string,
    public salary: number
  ) {}
}

let Employees: EmployeeClass[] = [];

let data: any = document.getElementById("data");


function syncBtns():void {
  const buttons = Array.from(document.getElementsByClassName("delBtns"));
  buttons.forEach((btn) => {
    btn.addEventListener("click", function handleClick() {
      let id:number=Number(btn.id)
      showDelModal(id);
    });
  });
}

document.getElementById("addEmp")?.addEventListener("click", function () {
  let id: number =
    Employees.length === 0 ? 101 : Employees[Employees.length - 1].ID + 1;
  console.log(id);
  let firstname: string = (
    document.getElementById("firstName") as HTMLFormElement
  )?.value;
  let lastName: string = (
    document.getElementById("lastName") as HTMLFormElement
  )?.value;
  let address: string = (document.getElementById("address") as HTMLFormElement)
    ?.value;
  let salary: number = Number(
    (document.getElementById("salary") as HTMLFormElement)?.value
  );
  let emp: Employee = new EmployeeClass(
    id,
    firstname,
    lastName,
    address,
    salary
  );
  Employees.push(emp);
  data.innerHTML = getData(Employees);
  syncBtns();
  (document.getElementById("addEmpForm") as HTMLFormElement).reset()
});

document.getElementById("view")?.addEventListener("click", function () {
  data.innerHTML = getData(Employees);
  syncBtns()
});

document.getElementById("searchBtn")?.addEventListener("click", function () {
  let text: any = document.getElementById("searchTxt");
  let id: number = Number(text?.value);
  text.value = "";
  let arr: Employee[] = Employees.filter((val) => val.ID === id);
  if (arr.length == 0) {
    // data.innerHTML = getData(Employees)
    alert("No Results Found");
    data.innerHTML = getData(Employees);
    syncBtns()
  } else {
    data.innerHTML = getData(arr);
    syncBtns()
  }
});

document.getElementById("delBtn")?.addEventListener("click", function () {
  let text: any = document.getElementById("searchTxt");
  let id: number = Number(text?.value);
  let arr: Employee[] = Employees.filter((val) => val.ID !== id);
  Employees = arr;
  data.innerHTML = getData(Employees);
  syncBtns()
});

function getData(Arr: Employee[]): string {
  let str: string = ``;

  console.log();
  str += `<table class="table"><tr><th>ID</th><th>Full Name</th><th>FlatNo</th><th>City</th><th>State</th> <th>Total Salary</th><th>Actions</th></tr>`;
  for (const i in Arr) {
    let address: string[] = Arr[i].address.split(",");
    str += `<tr><td>${Arr[i].ID}</td><td>${Arr[i].firstname} ${
      Arr[i].lastName
    }</td><td> ${address[0].trim()}</td><td>${address[1].trim()}</td><td>${address[2].trim()}</td><td>${
      Arr[i].salary * 1.05
    }</td><td><input type="button" data-bs-toggle="modal" data-bs-target="#delModal" class="btn btn-outline-danger delBtns" id="${
      Arr[i].ID
    }" value="Delete"></input></td></tr>`;
  }
  str += `</table>`;
  
  return str;
}

function showDelModal(id: number): void {
  let str: string = `Delete Employee`;
  let Dellabel = document.getElementById("delModalLabel") as HTMLElement;
  Dellabel.innerHTML = str.concat(` ${id}`);
  document
    .getElementById("delEmp")
    ?.addEventListener("click", function deleteEmp() {
      Employees = Employees.filter((val) => val.ID !== Number(id));
      data.innerHTML = getData(Employees);
      Dellabel.innerHTML = ``;
    });
}

