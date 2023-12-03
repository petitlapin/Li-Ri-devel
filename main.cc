//      (_||_/
//      (    )       Programme Principale
//     ( o  0 )
//-OOO°--(_)---°OOO---------------------------------------
//                   Copyright (C) 2006 By Dominique Roux-Serret
// .OOOo      oOOO.  roux-serret@ifrance.com
//-(   )------(   )---------------------------------------
//  ( (        ) /   Le 03/01/2006
//   (_)      (_/

//    This program is free software; you can redistribute it and/or modify
//    it under the terms of the GNU General Public License as published by
//    the Free Software Foundation; either version 2 or version 3 of the License.

//    This program is distributed in the hope that it will be useful,
//    but WITHOUT ANY WARRANTY; without even the implied warranty of
//    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//    GNU General Public License for more details.

//    You should have received a copy of the GNU General Public License along
//    with this program; if not, write to the Free Software Foundation, Inc.,
//    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

#include <stdlib.h>
#include <iostream>
#include <SDL/SDL.h>
#include <SDL/SDL_image.h>

#include "sprite.h"

/*** Variables globales ***/
/**************************/
SDL_Surface *sdlVideo; // Pointe sur l'écran video
Uint32 FontColor;      // Couleur du fond d'écran
FILE *file;            // Pointe sur le fichier de sauvegarde

char Titre[]="MakeDat V2.0.1";

struct s_Sprite {
  char *NomF,*NomA;
  int nombre;
  bool Caractaire;
};

char* Langues[]={"langues/De/","langues/En/","langues/Es/","langues/Fr/","langues/Ar/","langues/Cn/",
		 "langues/Jp/","langues/Ru/","langues/Sl/","langues/It/","langues/Br/","langues/Po/",
		 "langues/Se/","langues/Eo/","langues/Hu/","langues/Tu/","langues/Pl/","langues/Du/",
		 "langues/Ko/",NULL};

s_Sprite Spri[]={
  { "png/locomotive","png/locomotiveA",320,false},
  { "png/charbon","png/charbonA",320,false},
  { "png/buche","png/bucheA",320,false},
  { "png/balles","png/ballesA",320,false},
  { "png/moteur","png/moteurA",320,false},
  { "png/citerne","png/citerneA",320,false},
  { "png/wagon","png/wagonA",50,false},
  { "png/pluslong","png/pluslongA",50,false},
  { "png/pluscourt","png/pluscourtA",50,false},
  { "png/vitesse","png/vitesseA",50,false},
  { "png/vie","png/vieA",50,false},
  { "png/nouveau_wagon",NULL,50,false},
  { "png/logo_vie","png/logo_vieA",1,false},
  { "png/rail","png/railA",11,false},
  { "png/dir",NULL,12,false},
  { "langues/lettres",NULL,1,true},
  { "langues/chiffres",NULL,1,true},
  { "png/logo",NULL,1,false},
  { "png/copyright",NULL,1,false},
  { "png/deco","png/decoA",24,false},
  { "png/curseur","png/curseurA",20,false},
  { "png/fleche_gauche","png/fleche_gaucheA",20,false},
  { "png/fleche_droite","png/fleche_droiteA",20,false},
  { "png/fleches","png/flechesA",6,false},
  { "png/monde",NULL,50,false},
  { "png/music",NULL,25,false},
  { "png/bruitage",NULL,25,false},
  { "png/fscreen",NULL,1,false},
  { "png/window",NULL,1,false},
  { "png/keys",NULL,1,false},
  { "png/gmenu",NULL,1,false},
  { "png/menu",NULL,1,false},
  { "png/fond_hr",NULL,1,false},
  { "png/fond_hrr",NULL,1,false},

  // *** FONDS D'ECRAN ***
  { "png/fond_menu",NULL,1,false},
  { "png/fond",NULL,1,false},
  { NULL,NULL,0,false }
};

s_Sprite SpriLoad[]={
  { "png/chargeur",NULL,20,false},
  { NULL,NULL,0,false }
};

s_Sprite Sprit[]={
  { "langue",NULL,1,false},
  { "level",NULL,1,false},
  { "lives",NULL,1,false},
  { "options",NULL,1,false},
  { "score",NULL,1,false},
  { "press_any_key",NULL,1,false},
  { "continue",NULL,1,false},
  { "moptions",NULL,1,false},
  { "exit_game",NULL,1,false},
  { "play",NULL,1,false},
  { "scores",NULL,1,false},
  { "better_scores",NULL,1,false},
  { "quit",NULL,1,false},
  { "new_game",NULL,1,false},
  { "old_level",NULL,1,false},
  { "menu",NULL,1,false},
  { "easy",NULL,1,false},
  { "normal",NULL,1,false},
  { "hard",NULL,1,false},
  { "question",NULL,1,false},
  { "tart1",NULL,1,false},
  { "tart2",NULL,1,false},
  { "tart3",NULL,1,false},
  { "tart4",NULL,1,false},
  { "tart5",NULL,1,false},
  { "tart6",NULL,1,false},
  { "tart7",NULL,1,false},
  { "tart8",NULL,1,false},
  { "tart9",NULL,1,false},
  { "tart10",NULL,1,false},
  { "tart11",NULL,1,false},
  { "tart12",NULL,1,false},
  { "tart13",NULL,1,false},
  { "tart14",NULL,1,false},
  { "tart15",NULL,1,false},
  { "tart16",NULL,1,false},
  { "tart17",NULL,1,false},
  { "tart18",NULL,1,false},
  { "tart19",NULL,1,false},
  { "tart20",NULL,1,false},
  { "tart21",NULL,1,false},
  { "tart22",NULL,1,false},
  { "tart23",NULL,1,false},
  { "tart24",NULL,1,false},
  { "tart25",NULL,1,false},
  { "tart26",NULL,1,false},
  { "tart27",NULL,1,false},
  { "tart28",NULL,1,false},
  { "tart29",NULL,1,false},
  { "tart30",NULL,1,false},
  { "art1",NULL,1,false},
  { "art2",NULL,1,false},
  { "art3",NULL,1,false},
  { "art4",NULL,1,false},
  { "art5",NULL,1,false},
  { "art6",NULL,1,false},
  { "art7",NULL,1,false},
  { "art8",NULL,1,false},
  { "art9",NULL,1,false},
  { "art10",NULL,1,false},
  { "art11",NULL,1,false},
  { "art12",NULL,1,false},
  { "art13",NULL,1,false},
  { "art14",NULL,1,false},
  { "art15",NULL,1,false},
  { "art16",NULL,1,false},
  { "art17",NULL,1,false},
  { "art18",NULL,1,false},
  { "art19",NULL,1,false},
  { "art20",NULL,1,false},
  { "art21",NULL,1,false},
  { "art22",NULL,1,false},
  { "art23",NULL,1,false},
  { "art24",NULL,1,false},
  { "art25",NULL,1,false},
  { "art26",NULL,1,false},
  { "art27",NULL,1,false},
  { "art28",NULL,1,false},
  { "art29",NULL,1,false},
  { "art30",NULL,1,false},
  { NULL,NULL,0,false }
};

/*** Preogramme principale ***/
/*****************************/
int main(int narg,char *argv[])
{
  int i,j,n,nt;
  char **pTitre=NULL;
  char **pIcon=NULL;
  char Provi[512];
  char Extension[3];
  SDL_VideoInfo *sdlVideoInfo;
  Sprite Spr;
  int NL;
  unsigned char Buf[2];
  
  // Initilise SDL
  if( SDL_Init(SDL_INIT_VIDEO|SDL_INIT_TIMER|SDL_INIT_AUDIO|SDL_INIT_NOPARACHUTE) < 0 ) {
    std::cerr <<"Impossible d'initialiser SDL:"<<SDL_GetError()<<std::endl;
    exit(-1);
  }
  // Ferme le programme correctement quant quit
  atexit(SDL_Quit);
    
  // Teste la resolution video
  sdlVideoInfo=(SDL_VideoInfo*)SDL_GetVideoInfo();

  if(sdlVideoInfo->vfmt->BitsPerPixel==8) {
    std::cerr <<"Impossible d'utiliser 8bits pour la vidéo !"<<std::endl;
    exit(-1);
  }

  // Demande la recolution Video
  int vOption=SDL_HWSURFACE|SDL_DOUBLEBUF|SDL_ASYNCBLIT;
  //  if(Jeu.Pref.FullScreen) vOption|=SDL_FULLSCREEN;
  sdlVideo=SDL_SetVideoMode(800,600,sdlVideoInfo->vfmt->BitsPerPixel,vOption);

  if(sdlVideo==NULL) {
    std::cerr <<"Impossible de passer dans le mode vidéo 800x600 !"<<std::endl;
    exit(-1);
  }
  // Change le nom de la fenetre
  SDL_WM_GetCaption(pTitre,pIcon);
  SDL_WM_SetCaption(Titre,NULL);

  // Couleur du font d'écran
  FontColor=SDL_MapRGB(sdlVideo->format,128,128,128);

 
  // *** Compte les sprites de décos ***
  // ***********************************
  n=0;
  while(Spri[n].NomF!=NULL) n++;
  std::cout <<n<<"Sprites à traiter !"<<std::endl;
  
  // Compte les sprites de texte
  nt=0;
  while(Sprit[nt].NomF!=NULL) nt++;
  nt--; // del le sprite de langue
  std::cout <<nt<<"Sprites de texte à traiter par langue!"<<std::endl;
  
  // Compte les langues
  NL=0;
  while(Langues[NL]!=NULL) NL++;
  std::cout <<"Trouve "<<NL<<" langues!"<<std::endl;

  // *** Création du fichier de sauvegarde sprites.dat ***
  // *****************************************************
  file=fopen("sprites.dat","w");
  if(!file) {
    std::cerr <<"ERREUR: Impossible de créer sprites.dat!"<<std::endl;
    perror("fopen");
    exit(-1);
  }
 
  // Chargement des Sprites
  for(i=0;i<n;i++) {
    if(Spri[i].Caractaire==false) {
      if(Spr.Load(Spri[i].NomF,Spri[i].NomA,Spri[i].nombre)==false) exit(-1);
    }
    else {
      if(Spr.LoadCaractaire(Spri[i].NomF)==false) exit(-1);
    }
  }

  // Ferme le fichier
  fclose(file);

  // *** Création du fichier de sauvegarde sprites.dat ***
  // *****************************************************
  file=fopen("language.dat","w");
  if(!file) {
    std::cerr <<"ERREUR: Impossible de créer language.dat!"<<std::endl;
    perror("fopen");
    exit(-1);
  }

  // Sauve le nombre de sprites de decor
  Buf[0]=n/256;
  Buf[1]=n%256;
  fwrite(Buf,1,2,file);

  // Sauve le nombre textes par langues
  Buf[0]=nt/256;
  Buf[1]=nt%256;
  fwrite(Buf,1,2,file);
 
  // Sauve le nombre de langues
  Buf[0]=NL/256;
  Buf[1]=NL%256;
  fwrite(Buf,1,2,file);

  // sauve les noms de langues
  Extension[2]=0;
  for(i=0;i<NL;i++) {
    Extension[0]=Langues[i][8];
    Extension[1]=Langues[i][9];
    sprintf(Provi,"language.%s",Extension);
    fwrite(Provi,1,strlen(Provi)+1,file);
  }

  // Sauve les sprites de langue
  for(i=0;i<NL;i++) {
    sprintf(Provi,"%s%s",Langues[i],Sprit[0].NomF);
    if(Spr.Load(Provi,NULL,Sprit[0].nombre)==false) exit(-1);
  }

  // Sauve le sprite d'animation loars du chargement
  if(Spr.Load(SpriLoad[0].NomF,SpriLoad[0].NomA,SpriLoad[0].nombre)==false) exit(-1);
  
  // Ferme le fichier
  fclose(file);
  
  // *** Création des fichiers de langue ***
  // ***************************************
  for(j=0;j<NL;j++) {
    // Fabrique le nom du fichier
    Extension[0]=Langues[j][8];
    Extension[1]=Langues[j][9];
    sprintf(Provi,"language.%s",Extension);
    
    file=fopen(Provi,"w");
    if(!file) {
      std::cerr <<"ERREUR: Impossible de créer le fichier "<<Provi<<std::endl;
      perror("fopen");
      exit(-1);
    }
    
    // Charge les langues
    for(i=1;i<nt+1;i++) {
      sprintf(Provi,"%s%s",Langues[j],Sprit[i].NomF);
      if(Spr.Load(Provi,NULL,Sprit[i].nombre)==false) exit(-1);
    }
    
    fclose(file);  
  }  
  
  exit(0);
}

