console.log("UNION");
console.log("");
function printer(id) {
    console.log(typeof id);
    console.log("The id is " + id);
}
printer("Hello");
printer(26);
console.log("");
function ptr(pt) {
    console.log("first value is " + pt.x);
    console.log("second value is " + pt.y);
}
ptr({ x: "100", y: 100 });
function printSomeText(x) {
    if (x === null) {
        // do nothing
        console.log("paramater type is null");
    }
    else {
        console.log("paramater type is string");
        console.log("Hello, " + x.toUpperCase());
    }
}
printSomeText("myString");
printSomeText(null);
console.log("INTERSECTION");
var handleArtistsResponse = function (response) {
    if (response.success === false) {
        console.error(response.error.message);
        return;
    }
    console.log(response.artists);
};
var res = {
    "success": false,
    "error": { "message": "I generated this error with intersection" },
    "artists": [{ "name": "Name1" }, { "name": "Name2" }, { "name": "Name3" }]
};
handleArtistsResponse(res);
