export interface Response{
    QuestionID:number,
    Description:string,
    Options:string[],
    Answer:string,
    Response:string
}


export class ResponseClass implements Response{
    constructor(
        public QuestionID:number,
        public Description:string,
        public Options:string[],
        public Answer:string,
        public Response:string
    ){}
}