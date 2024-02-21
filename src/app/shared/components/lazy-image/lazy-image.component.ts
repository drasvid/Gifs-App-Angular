import { Component, Input, OnInit } from '@angular/core';

@Component({
  selector: 'shared-lazy-image',
  templateUrl: './lazy-image.component.html',
  styleUrl: './lazy-image.component.css'
})
export class LazyImageComponent implements OnInit {
  
  
  @Input()
  
  public url!:string;

  // public title!:string;


  public hasLoaded:boolean=false;




  public onLoad(){

      this.hasLoaded=true

  }
  
  
  ngOnInit(): void {

    if(!this.url) throw new Error('Url is required');
  }

}
