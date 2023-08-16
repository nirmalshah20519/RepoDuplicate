let keys = [1, 23, 13, 3];
let items = [
    { name: 'Nathaniel Elliott', id: 1 },
    { name: 'Jim Ruiz', id: 2 },
    { name: 'Mabelle Cohen', id: 3 },
    { name: 'Chester Bishop', id: 4 },
    { name: 'Rebecca Fleming', id: 5 },
    { name: 'Augusta Murphy', id: 6 },
];
function s(lst, key) {
    let keys = [1, 23, 13, 3];
    let items = [
        { name: 'Harry Porter', id: 1 },
        { name: 'Troy Wagner', id: 2 },
        { name: 'Leon Owens', id: 3 },
        { name: 'Bessie Howard', id: 4 },
        { name: 'Emily Hodges', id: 5 },
        { name: 'Caroline Lynch', id: 6 },
    ];
    function display(lst, key) {
        let val = 0;
        for (const i of lst) {
            if (i['id'] == key[val]) {
                console.log(i['name']);
            }
            val++;
        }
    }
    display(items, keys);
    class Gen {
        get val() {
            return this.num1;
        }
        set value(v) {
            this.num1 = v;
        }
    }
    let g1 = new Gen();
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
s(items, keys);
class Gen {
    get val() {
        return this.num1;
    }
    set value(v) {
        this.num1 = v;
    }
}
let g1 = new Gen();
g1.value = 2;
console.log(`the value of object is: ${g1.val}`);
