import { Component, ElementRef, ViewChild } from '@angular/core';
import { GifsService } from '../../services/gifs.service';

@Component({
  selector: 'gifs-search-box',
  templateUrl: './search-box.component.html',
  styleUrl: './search-box.component.css'
})
export class SearchBoxComponent {

  // aqui escucha los cambios en el input mediante una referencia local #txtTagInput

  @ViewChild('txtTagInput') 
  
  public tagInput!:ElementRef<HTMLInputElement>;


  constructor(private gifsService:GifsService){}



  searchTag(){

    const newTag=this.tagInput.nativeElement.value;


    this.gifsService.searchTag(newTag);

    this.tagInput.nativeElement.value='';



}

}