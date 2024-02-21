import { Component,Input, OnInit } from '@angular/core';
import { Gif } from '../../interfaces/gifs.interfaces';

@Component({
  selector: 'gifs-card',
  templateUrl: './gifs-card.component.html',
  styleUrl: './gifs-card.component.css'

})

// La propiedad OnInit se utiliza para que al iniciar una app, haga ciertas verificaciones

export class GifsCardComponent implements OnInit {

  constructor(){}

  @Input()

  public gif!:Gif;



  // Aqui se le dicen que verificaciones se desean

  ngOnInit(): void {

    if(!this.gif) throw new Error("Gif Property i required");
    


  }
  
}


