// [Name]
//       ,[Street]
//       ,[City]
//       ,[State]
//       ,[Country]
//       ,[CreateDate]
//       ,[UpdateDate]
//       ,[CreatedByID]
//       ,[UpdateByID]

export interface Theatre{
    name:string,
    street:string,
    city:string,
    state:string,
    country:string,
    uid:string,
    minprice:number
    facilities:number[]
}

export interface TheatreView{
    id:number
    name:string,
    street:string,
    city:string,
    state:string,
    country:string,
    uid:string,
    facilities:Facility[]
}

export interface Facility{
    id:number
    name:string,
    url:string
}