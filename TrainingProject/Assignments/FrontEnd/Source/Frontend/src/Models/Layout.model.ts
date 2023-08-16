export interface SeatType{
    id:number,
    name:string,
    factor:number
}

export interface Layout{
    [type:string]:{[row: string]: number[]};
}

export interface ShortLayout{
    [type:string]:{row: number|null, seats:number|null}
}

export interface LayoutPost{
    sid:number,
    layout:ShortLayout
}

export interface LayoutGet{
    seatType:number,
    price:number,
    seatgroup:seat[]
}

export interface seat{
    row:string,
    rowSeats:number[]
}