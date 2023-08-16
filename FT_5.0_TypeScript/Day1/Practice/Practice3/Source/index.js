var __extends = (this && this.__extends) || (function () {
    var extendStatics = function (d, b) {
        extendStatics = Object.setPrototypeOf ||
            ({ __proto__: [] } instanceof Array && function (d, b) { d.__proto__ = b; }) ||
            function (d, b) { for (var p in b) if (Object.prototype.hasOwnProperty.call(b, p)) d[p] = b[p]; };
        return extendStatics(d, b);
    };
    return function (d, b) {
        if (typeof b !== "function" && b !== null)
            throw new TypeError("Class extends value " + String(b) + " is not a constructor or null");
        extendStatics(d, b);
        function __() { this.constructor = d; }
        d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
    };
})();
var MyClass = /** @class */ (function () {
    function MyClass(myName) {
        this.myName = myName;
    }
    MyClass.prototype.greeting = function () {
        console.log("Hello " + this.myName + "!");
    };
    return MyClass;
}());
var MyClass2 = /** @class */ (function (_super) {
    __extends(MyClass2, _super);
    function MyClass2() {
        return _super !== null && _super.apply(this, arguments) || this;
    }
    MyClass2.prototype.greeting = function () {
        console.log("Hello " + this.myName + "! Have a nice day");
    };
    return MyClass2;
}(MyClass));
console.log("Basic class");
var c1 = new MyClass("Nirmal");
c1.greeting();
var c2 = new MyClass2("Sibten");
c2.greeting();
console.log("Using class as an interface");
var Point = /** @class */ (function () {
    function Point() {
    }
    return Point;
}());
var point3d = { x: 1, y: 2, z: 3 };
console.log(point3d);
