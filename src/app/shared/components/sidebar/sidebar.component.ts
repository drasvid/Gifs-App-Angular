import { Component } from '@angular/core';
import { GifsService } from '../../../gifs/services/gifs.service';

@Component({
  selector: 'shared-sidebar',
  templateUrl: './sidebar.component.html',
  styleUrl: './sidebar.component.css'
})
export class SidebarComponent {

   constructor(private gifService:GifsService){}

  get tagHistory(){


      return this.gifService.tagsHistory;

  }  


  public searchTag(newTag:string):void{

    this.gifService.searchTag(newTag);

    console.log( newTag );


  }

}
