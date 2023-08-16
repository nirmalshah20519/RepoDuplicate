export interface role{
    cid:number,
    rid:number
}

export interface movieData{
    MovieName:string,
    Description:string,
    ReleaseDate:Date,
    DurationHr:number,
    DurationMin:number,
    Poster:string,
    Trailer:string,
    Genre:number[],
    Language:number[],
    Casts:role[]
}

export interface Cast{
    castId:number,
    castName:string,
    roleId:number,
    roleName:string,
    castProfile:string
}

export interface Detail{
    id:number,
    typeName:string,
    typeId:number,    
}

export interface Movie {
    id: number;
    name: string;
    description: string;
    duration: string;
    imdbRating: number;
    releaseDate: Date;
    posterLink: string;
    trailerLink: string;
    createDate: string;
    updateDate: string;
    createdById: number;
    updateById: number;
    cast:Cast[],
    detail:Detail[]
    }

    // {
    //     "id": 101,
    //     "name": "Bholaa",
    //     "description": "Bholaa is a 2023 Indian Hindi-language action-adventure film directed by Ajay Devgn and jointly produced by Ajay Devgn FFilms, Reliance Entertainment, T-Series Films and Dream Warrior Pictures. It is a remake of the 2019 Tamil film Kaithi and stars Devgn in the titular role alongside Tabu, Deepak Dobriyal, Sanjay Mishra, Gajraj Rao and Vineet Kumar while Amala Paul, Abhishek Bachchan and Raai Laxmi make special appearances. The film follows an ex-convict who battles criminals while transporting a truck full of poisoned cops to the hospital in exchange for meeting his daughter after ten years of imprisonment.",
    //     "duration": "2 hr 24 min",
    //     "releaseDate": "2023-06-09T00:00:00",
    //     "imdbRating": 7,
    //     "trailerLink": "https://res.cloudinary.com/movie-booking-site/video/upload/v1685613360/movie/trailers/bholaa_trailer.mp41685613354104.mp4",
    //     "posterLink": "https://res.cloudinary.com/movie-booking-site/image/upload/v1685613362/movie/posters/bholaa.jpg1685613362642.jpg",
    //     "cast": [
    //       {
    //         "castId": 101,
    //         "castName": "Ajay Devgn",
    //         "roleId": 2,
    //         "roleName": "Director"
    //       },
    //       {
    //         "castId": 101,
    //         "castName": "Ajay Devgn",
    //         "roleId": 1,
    //         "roleName": "Actor"
    //       },
    //       {
    //         "castId": 111,
    //         "castName": "Amala Paul",
    //         "roleId": 1,
    //         "roleName": "Actor"
    //       }
    //     ],
    //     "detail": [
    //       {
    //         "id": 1,
    //         "typeName": "Action",
    //         "typeId": 1
    //       },
    //       {
    //         "id": 2,
    //         "typeName": "Adventure",
    //         "typeId": 1
    //       },
    //       {
    //         "id": 18,
    //         "typeName": "Hindi",
    //         "typeId": 2
    //       }
    //     ]
    //   },
