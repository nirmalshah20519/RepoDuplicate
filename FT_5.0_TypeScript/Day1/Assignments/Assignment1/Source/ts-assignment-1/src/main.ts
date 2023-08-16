export {};

type Employee = {
  ID: number;
  firstname: string;
  lastName: string;
  address: string;
  salary: number;
}

let Employees: Employee[] = [
  {
    ID: 101,
    firstname: "Nirmal",
    lastName: "Shah",
    address: "B/204, Riddhi Siddhi Apt, Maneklal Road, Navsari",
    salary: 29000,
  },
  {
    ID: 102,
    firstname: "Clarence",
    lastName: "Watts",
    address: "941 Lavit Lane, Hevaam, Indonesia, Omegahek, Morocco",
    salary: 25000,
  },
  {
    ID: 103,
    firstname: "Willie ",
    lastName: "Wagner",
    address: "1734 Iguda Circle, Wico Boulevard, Adluwrin, Hungary",
    salary: 21000,
  },
  {
    ID: 104,
    firstname: "Pauline",
    lastName: "Munoz",
    address: "1607 Sous Square, Helat Turnpike, Otisuchub, Madagascar",
    salary: 26500,
  },
  {
    ID: 105,
    firstname: "Aaron ",
    lastName: "Watson",
    address: "407 Tacmid Mill, Luzsiw Ridge, Baesda, Turkey",
    salary: 31000,
  },
];
let initialEmp:Employee[]=Employees
console.log(Employees);
let data: any = document.getElementById("data");

document.getElementById("addEmp")?.addEventListener("click", function () {
  let id: number = Employees[Employees.length - 1]["ID"] + 1;
  let emp: Employee = {
    ID: id,
    firstname: (document.getElementById("firstName") as HTMLFormElement)?.value,
    lastName: (document.getElementById("lastName") as HTMLFormElement)?.value,
    address: (document.getElementById("address") as HTMLFormElement)?.value,
    salary: Number(
      (document.getElementById("salary") as HTMLFormElement)?.value
    ),
  };
  Employees.push(emp);
  data.innerHTML = getData(Employees);
  const collection = document.getElementsByTagName("td");
  const collection2 = document.getElementsByTagName("th");
  collection2[0].style.padding = "16px";
  for (const i in collection) {
    collection[i].style.padding = "16px";
  }
});

document.getElementById("view")?.addEventListener('click', function(){
  data.innerHTML=getData(initialEmp)
})

document.getElementById("searchBtn")?.addEventListener("click", function () {
  let text: any = document.getElementById("searchTxt");
  let id: number = Number(text?.value);
  text.value = "";
  let arr: Employee[] = Employees.filter((val) => val.ID === id);
  if (arr.length == 0) {
    // data.innerHTML = getData(Employees)
    alert("No Results Found")
    data.innerHTML = getData(Employees);
  } else {
    data.innerHTML = getData(arr);
  }
});

document.getElementById("delBtn")?.addEventListener("click", function () {
  let text: any = document.getElementById("searchTxt");
  let id: number = Number(text?.value);
  let arr: Employee[] = Employees.filter((val) => val.ID !== id);
  Employees = arr;
  data.innerHTML = getData(Employees);
});

function getData(Arr: Employee[]): string {
  let str: string = ``;
  str += `<table class="table"><tr><th>ID</th><th>FirstName</th><th>LastName</th><th>Address</th><th>Salary</th> <th>Actions</th></tr>`;
  for (const i in Arr) {
    str += `<tr><td>${Arr[i].ID}</td><td>${Arr[i].firstname}</td><td>${Arr[i].lastName}</td><td>${Arr[i].address}</td><td>${Arr[i].salary}</td><td><input type="button" data-bs-toggle="modal" data-bs-target="#delModal" class="btn btn-outline-danger delBtns" id="${i}" value="Delete"></input></td></tr>`;
  }
  str += `</table>`;
  return str;
}

function showDelModal(id:number):void{
  let str:string=`Delete Employee`  
  let Dellabel=(document.getElementById("delModalLabel") as HTMLElement)
  Dellabel.innerHTML=str.concat(` ${Employees[id].ID}`)
  document.getElementById("delEmp")?.addEventListener('click', function deleteEmp(){
    Employees=Employees.filter(val=>val.ID!==Employees[id].ID)
    data.innerHTML = getData(Employees);
    Dellabel.innerHTML=``
  })
}

data.innerHTML = getData(Employees);

const buttons = Array.from(document.getElementsByClassName("delBtns"));
buttons.forEach((btn) => {
  btn.addEventListener("click", function handleClick() {
    showDelModal(Number(btn.id))
  });
});