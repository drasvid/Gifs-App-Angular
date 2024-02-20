import { HttpClient, HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Gif, searchResponce } from '../interfaces/gifs.interfaces';

@Injectable({
  providedIn: 'root'
})



export class GifsService {


  constructor (private http:HttpClient){}


  private _tagsHistory:string[]=[]; 

  private ApiKey='jdBbPwdqRLH6qaRmrUUJowgsgOH0ruBJ';

  private serviceUrl='http://api.giphy.com/v1/stickers';

  // va a contener la lista de todos los gifs

  public gifList:Gif[]=[];




  
  public get tagsHistory() : string[] {


    return [...this._tagsHistory]
  }
  

  private organizeHistory(tag:string){


    const limitOfHistory=10;

    if (this._tagsHistory.includes(tag)) {
      
      this._tagsHistory=this._tagsHistory.filter(oldTag=>oldTag!==tag)

    }

    

    // if(this._tagsHistory.length>=10){

    //   this._tagsHistory.splice(limitOfHistory,1);

    // }


    // lo que pasa aqui es que el metodo splice cuando retona, osea es el valor de una variable muestra los elementos que elimino

    this._tagsHistory=this._tagsHistory.splice(0,10);



  }


  searchTag(tag:string){

    this.organizeHistory(tag);

    this._tagsHistory.unshift(tag);

    console.log( this.tagsHistory );



    const params=new HttpParams()
    .set('api_key', this.ApiKey)
    .set('limit','10')
    .set('q',tag)

    


    this.http.get<searchResponce>(`${this.serviceUrl}/search`,{params})

    .subscribe((answer)=>{

      this.gifList=answer.data;

      console.log( {gifs:this.gifList} );
    })



  }


  


  



}
