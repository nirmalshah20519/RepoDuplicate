var myEnum;
(function (myEnum) {
    myEnum[myEnum["x"] = 1] = "x";
    myEnum[myEnum["y"] = 2] = "y";
    myEnum[myEnum["z"] = 3] = "z";
})(myEnum || (myEnum = {}));
console.log(`${myEnum[1]}  ${myEnum[2]} ${myEnum[3]}`);
var str;
(function (str) {
    str["p"] = "macbook";
    str["q"] = "play station";
    str["r"] = "xbox";
    str["s"] = "intel";
})(str || (str = {}));
console.log(`the value of string enum is ${str.p}`);
var bool;
(function (bool) {
    bool[bool["f"] = 0] = "f";
    bool["t"] = "yes";
})(bool || (bool = {}));
console.log(`value of bool enum is ${bool.f} and ${bool.t}`);
var cnt;
(function (cnt) {
    cnt[cnt["a"] = 0] = "a";
    cnt[cnt["b"] = 1] = "b";
    cnt[cnt["c"] = 2] = "c";
})(cnt || (cnt = {}));
function init(obj) {
    return obj.a;
}
var i = init(cnt);
console.log(`the value of const enum is ${i}`);
