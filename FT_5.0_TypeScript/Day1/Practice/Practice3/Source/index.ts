interface cls{
    myName:string
}
class MyClass implements cls{    
    public constructor(
        public myName:string
    ){}
    greeting(){
        console.log("Hello "+this.myName+"!");
    }
}

class MyClass2 extends MyClass{
    greeting(): void {
        console.log("Hello "+this.myName+"! Have a nice day");
    }
}
console.log("Basic class");
let c1=new MyClass("Nirmal")
c1.greeting()
let c2=new MyClass2("Sibten")
c2.greeting()

console.log("Using class as an interface");

class Point {
    x: number;
    y: number;
  }
   
  interface Point3d extends Point {
    z: number;
  }
   
  let point3d: Point3d = { x: 1, y: 2, z: 3 };
  console.log(point3d);