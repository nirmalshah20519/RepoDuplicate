interface Employee {
  ID: number;
  Name: string;
  City: string;
  DOJ: Date;
}

class Employee implements Employee {
  public constructor(
    public ID: number,
    public Name: string,
    public City: string,
    public DOJ: Date
  ) {}
}
interface Employees {
  addEmployee(name: string, city: string, doj: Date): void;
  getEmployee(id: number): Employee;
  getAllAfter2020():Employee[];
  viewAllAfter2020andCityMumbai():Employee[]
  renderAllEmployees(): void;
  renderSearchResult(emp: Employee[], place:string): void;
}

class Employees implements Employees {
  private EmployeeList: Employee[] = [];

  // ADD Employee
  addEmployee(name: string, city: string, doj: Date) {
    let id: number =
      this.EmployeeList.length == 0
        ? 1
        : this.EmployeeList[this.EmployeeList.length - 1].ID + 1;

    let emp = new Employee(id, name, city, doj);
    this.EmployeeList.push(emp);
  }

  // SEARCH EMPLOYEE

  getEmployee(id: number) {
    let arr: Employee[] = this.EmployeeList.filter((val) => val.ID === id);
    return arr[0];
  }

  // GET ALL AFTER 2020 
  getAllAfter2020(){
    let arr=this.EmployeeList.filter(val=>val.DOJ.getFullYear()>2020)
    return arr
  }

  // GET ALL AFTER 2020 AND CITY IS MUMBAI 
  viewAllAfter2020andCityMumbai(){
    let arr=this.EmployeeList.filter(val=>val.DOJ.getFullYear()>2020 && val.City.toLowerCase()==="mumbai")
    return arr
  }

  //Render All Employees
  renderAllEmployees() {
    let str: string = ``;
    let data: HTMLElement = document.getElementById("empData")!;
    str += `<table class="table table-primary table-striped">
    <caption></caption>
    <thead>
      <tr>
        <th>Employee ID</th>
        <th>Name</th>
        <th>City</th>
        <th>Date of Joining</th>
      </tr>
    </thead>
    <tbody>`;
    for (const i in this.EmployeeList) {
      str += `<tr>
      <td>${this.EmployeeList[i].ID}</td>
      <td>${this.EmployeeList[i].Name}</td>
      <td>${this.EmployeeList[i].City}</td>
      <td>${this.EmployeeList[i].DOJ.toLocaleDateString()}</td>
    </tr>`;
    }
    str += `</tbody>
    </table>`;
    data.innerHTML = str;
  }

  // RENDER SEARCH RESULT

  renderSearchResult(result: Employee[], place:string) {
    let str: string = ``;
    let data: HTMLElement = document.getElementById(place)!;
    str += `<table class="table table-primary table-striped">
    <caption></caption>
    <thead>
      <tr>
        <th>Employee ID</th>
        <th>Name</th>
        <th>City</th>
        <th>Date of Joining</th>
      </tr>
    </thead>
    <tbody>`;
    for (const i in result) {
      str += `
    <tr>
      <td>${result[i].ID}</td>
      <td>${result[i].Name}</td>
      <td>${result[i].City}</td>
      <td>${result[i].DOJ.toLocaleDateString()}</td>
    </tr>`;
    }
    str += `
    </tbody>
    </table>`;
    data.innerHTML = str;
  }
}

let EmployeeData = new Employees();
EmployeeData.addEmployee("Nirmal Shah", "Mumbai", new Date(2019, 1, 1));
EmployeeData.addEmployee("Sibten Shekh", "Delhi", new Date(2021, 9, 25));
EmployeeData.addEmployee("Deepak Khatri", "Mumbai", new Date(2022, 5, 16));
EmployeeData.addEmployee("Bhautik Hirpara","Gandhinagar",new Date(2020, 9, 1));
EmployeeData.addEmployee("Hitesh Lakhana", "Surat", new Date(2020, 5, 6));

document.getElementById("viewAll")?.addEventListener("click", function () {
  EmployeeData.renderAllEmployees();
});

document.getElementById("searchBtn")?.addEventListener("click", function () {
  let searchTxt = Number(
    (document.getElementById("searchTxt") as HTMLFormElement).value
  );
  let searchResult = EmployeeData.getEmployee(searchTxt);
  EmployeeData.renderSearchResult([searchResult], "empData");
  (document.getElementById("searchForm") as HTMLFormElement).reset();
});

document.getElementById("viewAllAfter2020")?.addEventListener("click", function () {  
  EmployeeData.renderSearchResult(EmployeeData.getAllAfter2020(), "empDataquery1");
});

document.getElementById("viewAllAfter2020andCityMumbai")?.addEventListener("click", function () {  
  EmployeeData.renderSearchResult(EmployeeData.viewAllAfter2020andCityMumbai(), "empDataquery2");
});


