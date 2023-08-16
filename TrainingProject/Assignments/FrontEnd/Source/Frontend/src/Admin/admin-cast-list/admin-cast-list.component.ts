import { Component, ViewChild } from '@angular/core';
import { Cast, cast } from 'src/Models/Cast';
import { MovieService } from 'src/Services/movie.service';
import { initTE, Offcanvas, Ripple, Modal} from "tw-elements";
import { AgGridAngular } from 'ag-grid-angular';
import { CellClickedEvent, ColDef, GridReadyEvent, ICellRendererParams, ValueFormatterParams } from 'ag-grid-community';
import { Observable } from 'rxjs';

@Component({
  selector: 'app-admin-cast-list',
  templateUrl: './admin-cast-list.component.html',
  styleUrls: ['./admin-cast-list.component.css']
})
export class AdminCastListComponent {
  // Each Column Definition results in one Column.
  public columnDefs: ColDef[] = [
    { field: 'name'},
    { field: 'gender'},
    { field: 'dob', valueFormatter:this.dateFormatter },
    { field: 'description' },
    { field: 'city', },
    { field: 'state' ,},
    { field: 'country', },
    {
      field: 'profileUrl',
      cellRenderer: this.imageRenderer
    }
  ];

  // DefaultColDef sets props common to all Columns
  public defaultColDef: ColDef = {
    sortable: true,
    filter: true,
  };

  // name:string
  //     gender:string
  //     dob:Date,
  //     description:string,
  //     city:string,
  //     state:string,
  //     country:string,
  //     profileUrl:string,
  
  // Data that gets displayed in the grid
  public rowData$!: Observable<cast[]>;
  CastList:cast[]=[]
  tempCast:cast={} as cast
  currentPage = 1;
  itemsPerPage = 8;
  @ViewChild(AgGridAngular) agGrid!: AgGridAngular;
  constructor(private MovieService:MovieService) {}

  ngOnInit(){
    initTE({ Offcanvas, Ripple, Modal });
  }

  onGridReady(params: GridReadyEvent) {
    this.rowData$=this.MovieService.getCastData()
  }

  onReadClick(item:cast){
    this.tempCast=item
  }

  onCellClicked( e: CellClickedEvent): void {
    console.log('cellClicked', e.data);
    this.tempCast=e.data
  }

  // Example using Grid's API
  clearSelection(): void {
    this.agGrid.api.deselectAll();
  }

  dateFormatter(params: ValueFormatterParams) {
    const options: Intl.DateTimeFormatOptions = { year: 'numeric', month: 'short', day: 'numeric' };
    return new Date(params.value).toLocaleDateString(undefined, options);
  }

  imageRenderer(params: ICellRendererParams) {
    const image = document.createElement('img');
    image.src = params.value;
    image.alt = 'Profile Image';
    image.style.height = '50px';
    image.style.marginLeft='auto';
    image.style.marginRight='auto';
    image.setAttribute('data-te-offcanvas-toggle','true')
    image.setAttribute('data-te-target','#offcanvasRight')
    return image;
  }

}
