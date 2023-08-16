export{}
enum myEnum{
    x=1,
    y,
    z
}
console.log(`${myEnum[1]}  ${myEnum[2]} ${myEnum[3]}`);
enum str{
    p="macbook",
    q="play station",
    r="xbox",
    s="intel"
}
console.log(`the value of string enum is ${str.p}`);

enum bool{
    f=0,
    t="yes"
}
console.log(`value of bool enum is ${bool.f} and ${bool.t}`);
enum cnt{
    a,
    b,
    c
}
function init(obj:{a:number,b:number,c:number}):number{
    return obj.a;
}
var i=init(cnt)
console.log(`the value of const enum is ${i}`);