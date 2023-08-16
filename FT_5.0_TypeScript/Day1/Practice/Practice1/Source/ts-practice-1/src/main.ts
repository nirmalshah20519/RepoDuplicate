export {}


// Implicit Data Types
console.log("Implicit Data Types");
console.log("String");
let name:string="Nirmal Shah"
console.log(name);
console.log("");

console.log("Number");
let age:number=21
console.log(age);
console.log("");

console.log("Boolean");
let isPlaced:boolean=true
console.log(isPlaced);
console.log("");

console.log("Undefined");
let x:undefined=undefined
console.log(x);
console.log("");

console.log("null");
let y:null =null
console.log(y);
console.log("");

// Explicit Data Types

console.log("Explicit Data Types");
console.log("Array");
 let names:string[] = ["Nirmal Shah", "Sibten Shekh"]
 console.log(names);
 console.log("");

 console.log("Tuple");
 let myTuple:[string, number, boolean]=["Nirmal", 51, false]
 console.log(myTuple);
 console.log("");

 console.log("Object");
 let detail:{name:string, age:number}={
  name:"Nirmal",
  age:21
 }
 console.log(detail);
 console.log("");

 console.log("Interface");
 interface Animal {
  sound: string,
  maxAge: number
}

const Lion: Animal = {
  sound: "Roars",
  maxAge: 10
};
const Dog: Animal = {
  sound: "Barks",
  maxAge: 12
};
console.log(Lion);
console.log(Dog);
console.log("");

console.log("Function");
function sayHello(name:string):string{
  return "Hello, "+name+"!";
}
console.log(sayHello("Nirmal"));
