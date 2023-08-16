import { SafeHtml } from "@angular/platform-browser"

export interface Task{
    Name:string,
    URL:string
}

export interface TaskGroup{
    TaskType:string,
    TaskDetails:Task[]
}

export interface Subject{
    SubjectName:string,
    SubjectData:TaskGroup[]
}