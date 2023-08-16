interface Person {
    name: string;
    id: number;
  }
  
  let keys: Array<number> = [1, 23, 13, 3];
  let items: Array<Person> = [
    { name: 'Nathaniel Elliott', id: 1 },
    { name: 'Jim Ruiz', id: 2 },
    { name: 'Mabelle Cohen', id: 3 },
    { name: 'Chester Bishop', id: 4 },
    { name: 'Rebecca Fleming', id: 5 },
    { name: 'Augusta Murphy', id: 6 },
  ];
  function s<Type, k>(lst: Type[], key: k[]): void {
interface book {
  bname: string;
  bid: number;
}


let keys: Array<number> = [1, 23, 13, 3];
let items: Array<Person> = [
  { name: 'Harry Porter', id: 1 },
  { name: 'Troy Wagner', id: 2 },
  { name: 'Leon Owens', id: 3 },
  { name: 'Bessie Howard', id: 4 },
  { name: 'Emily Hodges', id: 5 },
  { name: 'Caroline Lynch', id: 6 },
];
function display<Type, k>(lst: Type[], key: k[]): void {
  let val = 0;
  for (const i of lst) {
    if (i['id'] == key[val]) {
      console.log(i['name']);
    }
    val++;
  }
}
display<Person, number>(items, keys);


class Gen<newtype> {
  private num1: newtype;
  public get val(): newtype {
    return this.num1;
  }
  public set value(v: newtype) {
    this.num1 = v;
  }
}
let g1 = new Gen<number>();
g1.value = 2;
console.log(`the value of object is: ${g1.val}`);

    let val = 0;
    for (const i of lst) {
      if (i['id'] == key[val]) {
        console.log(i['name']);
      }
      val++;
    }
  }
  s<Person, number>(items, keys);

  class Gen<newtype> {
    private num1: newtype;
    public get val(): newtype {
      return this.num1;
    }
    public set value(v: newtype) {
      this.num1 = v;
    }
  }
  let g1 = new Gen<number>();
  g1.value = 2;
  console.log(`the value of object is: ${g1.val}`);
  