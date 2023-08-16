export interface ScreenType{
    id:number,
    name:string
}

export interface ScreenModel{
    //{ "uid": "2013", "tid": 12, "name": "", "type": "-1" }
    uid:string,
    tid:number,
    name:string,
    type:number
}

export interface Screen{
    //{ "uid": "2013", "tid": 12, "name": "", "type": "-1" }
    id:number
    tid:number,
    name:string,
    type:string,
    baseprice:number
}