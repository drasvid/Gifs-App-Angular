import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { SidebarComponent } from './components/sidebar/sidebar.component';
import { GifsModule } from '../gifs/gifs.module';



@NgModule({
  declarations: [
    SidebarComponent
  ],

  exports:[

    SidebarComponent

  ],


  imports: [
    CommonModule,
    GifsModule
  ]
})
export class SharedModule { }
