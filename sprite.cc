//      (_||_/
//      (    )       Classe Sprite
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

#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "sprite.h"

/*** Variables Globales ***/
/**************************/
extern SDL_Renderer *sdlRenderer;
extern SDL_Surface *sdlVideo;
extern FILE *file;

/*** Ecris un word dans le fichier (compatible tout system) ***/
void wint(int i) {
  unsigned char Buf[2];

  Buf[0]=(char)(i/256);
  Buf[1]=(char)(i%256);

  fwrite(Buf,1,2,file);
}

/*** Constructeur ***/
/********************/
Sprite::Sprite(void) : N(0), Image(NULL), Dim(NULL)
{ }

Sprite::~Sprite(void)
{
  if(N) {
    for(int i=0;i<N;i++) {
      SDL_FreeSurface(Image[i]);
    }
    delete [] Image;
    delete [] Dim;
  }
}

/*** Charge les sprites ***/
/**************************/
bool Sprite::Load(const char *Nom,const char *NomA,int Nombre)
{
  int i,j,x,y,S;
  int LS,HS,bpp;
  unsigned char *IA;
  unsigned char *IB;
  char* Provi=new char [strlen(Nom)+80]; // Chaine du nom
  int Fin=strlen(Nom);
  int FinA=0;
  SDL_Surface *Img=NULL;
  SDL_Surface *Ombre=NULL;

 
  if(NomA) FinA=strlen(NomA);
  N=Nombre; // Nombre de sprites
  Image=new SDL_Surface* [N]; // Alloue les surfaces
  Dim=new s_Dim [N];

  // Chargement des Sprites Image
  for(i=1;i<=N;i++) {
    strcpy(Provi,Nom); // Création du nom
    
    if(N>1) {
      Provi[Fin]=(char)(i/100)+'0';
      Provi[Fin+1]=(char)(i/10-i/100*10)+'0';
      Provi[Fin+2]=(char)(i%10)+'0';
      
      Provi[Fin+7]=0;
      memcpy(Provi+Fin+3,".png",4); // Met l'extension
    }
    else {
      Provi[Fin+4]=0;
      memcpy(Provi+Fin,".png",4);
    }
    
    // Chargement de l'image
    Img=IMG_Load(Provi);
    if(Img==NULL) {
      std::cerr <<"Impossible de lire '"<<Provi<<"' !"<<std::endl;
      return false;
    }
    LS=Img->w; // Prend la dimension de l'image
    HS=Img->h;
    bpp=Img->format->BytesPerPixel;
    std::cout <<"Sprite "<<Provi<<" chargé L="<<LS<<" H="<<HS<<std::endl;
    
    // Si image de l'alpha, la charge
    if(NomA) {
      strcpy(Provi,NomA); // Création du nom de l'image avec alpha
      if(N>1) {
	Provi[FinA]=(char)(i/100)+'0';
	Provi[FinA+1]=(char)(i/10-i/100*10)+'0';
	Provi[FinA+2]=(char)(i%10)+'0';
      
	Provi[FinA+7]=0;
	memcpy(Provi+FinA+3,".png",4); // Met l'extension
      }
      else {
	memcpy(Provi+FinA,".png",4);
	Provi[FinA+4]=0;
      }
      
      // Chargement de l'image
      Ombre=IMG_Load(Provi);
      if(Ombre==NULL) {
	std::cerr <<"Impossible de lire '"<<Provi<<"' !"<<std::endl;
	return false;
      }
      std::cout <<"Sprite Ombre "<<Provi<<" chargé!"<<std::endl;

      /*** Si ombre, Calcule les ombres ***/
      /************************************/
      // Prend les Adresses
      SDL_LockSurface(Img);
      SDL_LockSurface(Ombre);
      
      IA=(unsigned char*)Img->pixels;
      IB=(unsigned char*)Ombre->pixels;
      
      // Recopie l'alpha dans l'image sans le fond
      for(j=0;j<LS*HS*4;j+=4) {
	IA[j+3]=IB[j+3];
	int Somme=IA[j]+IA[j+1]+IA[j+2];
	if(IA[j+3]!=255 && Somme<(86*3)) IA[j+3]=ALPHA_OMBRE;
      }
      
      SDL_UnlockSurface(Ombre);
      SDL_UnlockSurface(Img);
      SDL_FreeSurface(Ombre);
      std::cout <<"Calcule de l'Alpha fini!"<<std::endl;
    
      /*** Calcule la dimension du Sprite ***/
      /**************************************/
      std::cout <<"Calcule de la dimension "<<std::flush;
      SDL_LockSurface(Img);
      IA=(unsigned char*)Img->pixels;
      
      SDL_Rect Di;
      Di.x=LS; // départ en x
      Di.w=0;  // Fin en x
      Di.y=HS; // départ en y
      Di.h=0;  // Fin en y
      
      for(x=0;x<LS;x++) { // teste gauche et droite
	S=0;
	for(y=0;y<HS;y++) S+=(int)IA[(y*LS+x)*4+3]; // Fait somme colonne
	if(S) {
	  if(Di.x>x) Di.x=x;
	  if(Di.w<x) Di.w=x;
	}
      }
      for(y=0;y<HS;y++) { // teste Haut et bas
	S=0;
	for(x=0;x<LS;x++) S+=(int)IA[(y*LS+x)*4+3]; // Fait somme colonne
	if(S) {
	  if(Di.y>y) Di.y=y;
	  if(Di.h<y) Di.h=y;
	}
      }
      SDL_UnlockSurface(Img);
      
      Dim[i-1].L=Di.w-Di.x+1; // Calcule longueur et largeur
      Dim[i-1].H=Di.h-Di.y+1;
      Dim[i-1].cx=LS/2-Di.x; // Calcule le nouveau centre
      Dim[i-1].cy=HS/2-Di.y;
      Dim[i-1].bpp=bpp;
      std::cout <<"fini ! L="<<Dim[i-1].L<<" H="<<Dim[i-1].H<<" Cx="<<Dim[i-1].cx<<" Cy="<<Dim[i-1].cy<<" bpp="<<Dim[i-1].bpp<<std::endl;
    }
    else { // Si pas d'alpha
      Dim[i-1].L=LS; // Calcule longueur et largeur
      Dim[i-1].H=HS;
      Dim[i-1].cx=LS/2;; // Calcule le nouveau centre
      Dim[i-1].cy=HS/2;
      Dim[i-1].bpp=bpp;
      std::cout <<"Pas Alpha: L="<<Dim[i-1].L<<" H="<<Dim[i-1].H<<" Cx="<<Dim[i-1].cx<<" Cy="<<Dim[i-1].cy<<" bpp="<<Dim[i-1].bpp<<std::endl;
    }
    
    // *** Fabrique l'image finale ***
    std::cout <<"flags = "<<Img->flags<<std::endl;
    Image[i-1]=SDL_CreateRGBSurface(Img->flags,Dim[i-1].L,Dim[i-1].H,bpp*8,Img->format->Rmask,Img->format->Gmask,Img->format->Bmask,Img->format->Amask);
    if(Image[i-1]==NULL) {
      std::cerr <<"Impossible d'allouer la mémoire!"<<std::endl;
      return false;
    }
    
    // *** Copie l'image finale ***
    SDL_LockSurface(Img);
    SDL_LockSurface(Image[i-1]);
    
    IA=(unsigned char*)Img->pixels;
    IB=(unsigned char*)Image[i-1]->pixels;
    S=0;

    int Depx=LS/2-Dim[i-1].cx;
    int Depy=HS/2-Dim[i-1].cy;
    for(y=Depy;y<Dim[i-1].H+Depy;y++)
      for(x=Depx;x<Dim[i-1].L+Depx;x++) {
	IB[S++]=IA[(y*LS+x)*bpp];
	IB[S++]=IA[(y*LS+x)*bpp+1];
	IB[S++]=IA[(y*LS+x)*bpp+2];
	if(bpp==4) IB[S++]=IA[(y*LS+x)*bpp+3];
      }

    SDL_UnlockSurface(Image[i-1]);
    SDL_UnlockSurface(Img);
    SDL_FreeSurface(Img);
    
    // Affiche le sprite pour le test
    Affiche(400,300,i-1);
    SDL_RenderPresent(sdlRenderer);
  }

  delete [] Provi; // Libère la mémoire

  // Sauve le sprite
  wint(N); // Sauve le nombre de sprite
  for(i=0;i<N;i++) { // Fait tous les sprites
    wint(Dim[i].L); // Sauve les dimensions
    wint(Dim[i].H);
    wint(Dim[i].cx);
    wint(Dim[i].cy);
    wint(Dim[i].bpp);

    SDL_LockSurface(Image[i]);
    fwrite((void*)Image[i]->pixels,1,Dim[i].L*Dim[i].H*Dim[i].bpp,file);
    SDL_UnlockSurface(Image[i]);
  }
  
  Delete();

  return true;
}

/*** Charge plusieurs sprites dans un meme sprite ***/
/****************************************************/
bool Sprite::LoadCaractaire(const char *Nom)
{
  int i,j,x,S=0;
  int LS,HS,bpp;
  int D;
  unsigned char *IA;
  unsigned char *IB;
  char* Provi=new char [strlen(Nom)+80]; // Chaine du nom
  int Fin=strlen(Nom);
  SDL_Surface *Img=NULL;
    
  Image=new SDL_Surface* [128]; // Alloue les surfaces
  Dim=new s_Dim [128];
  N=0;

  strcpy(Provi,Nom); // Création du nom
    
  Provi[Fin+4]=0;
  memcpy(Provi+Fin,".png",4);
  
  // Chargement de l'image
  Img=IMG_Load(Provi);
  if(Img==NULL) {
    std::cerr <<"Impossible de lire '"<<Provi<<"' !"<<std::endl;
    return false;
  }
  LS=Img->w; // Prend la dimension de l'image
  HS=Img->h;
  bpp=Img->format->BytesPerPixel;
  std::cout <<"Sprite "<<Provi<<" chargé L="<<LS<<" H="<<HS<<std::endl;

  // Prépare la recherche
  SDL_LockSurface(Img);
  IA=(unsigned char*)Img->pixels;
  x=-1;

  do {
    // Cherche les colonnes vides au départ
    do {
      x++;
      S=0;
      for(i=0;i<HS;i++) {
	S+=IA[(i*LS+x)*bpp];
	S+=IA[(i*LS+x)*bpp+1];
	S+=IA[(i*LS+x)*bpp+2];
	if(bpp>3) S+=IA[(i*LS+x)*bpp+3];
      }
    } while(S==0 && x<LS);
    

    if(x<LS) { // Début d'une image
      std::cout <<"Départ de l'image en X="<<x<<std::endl;    
      D=x;
      
      // Recherche la fin de l'image
      do {
	x++;
	S=0;
	for(i=0;i<HS;i++) {
	  S+=IA[(i*LS+x)*bpp];
	  S+=IA[(i*LS+x)*bpp+1];
	  S+=IA[(i*LS+x)*bpp+2];
	  if(bpp>3) S+=IA[(i*LS+x)*bpp+3];
	}
      } while(S!=0 && x<LS);
      
      // Donne les valeurs au sprites
      Dim[N].L=x-D;
      Dim[N].H=HS;
      Dim[N].bpp=bpp;
      Dim[N].cx=Dim[N].L/2;
      Dim[N].cy=HS/2;
      N++;
      std::cout <<"N°"<<N<<" Longueur="<<Dim[N-1].L<<std::endl;
    
      // Fabrique l'image 
      Image[N-1]=SDL_CreateRGBSurface(Img->flags,Dim[N-1].L,Dim[N-1].H,bpp*8,Img->format->Rmask,
				      Img->format->Gmask,Img->format->Bmask,Img->format->Amask);
      if(Image[N-1]==NULL) {
	std::cerr <<"Impossible d'allouer la mémoire!"<<std::endl;
	return false;
      }
      
      // Copie l'image finale
      SDL_LockSurface(Image[N-1]);
      IB=(unsigned char*)Image[N-1]->pixels;
      for(j=0;j<HS;j++) {
	for(i=0;i<Dim[N-1].L;i++) {
	  IB[(j*Dim[N-1].L+i)*bpp]=IA[(j*LS+D+i)*bpp];
	  IB[(j*Dim[N-1].L+i)*bpp+1]=IA[(j*LS+D+i)*bpp+1];
	  IB[(j*Dim[N-1].L+i)*bpp+2]=IA[(j*LS+D+i)*bpp+2];
	  if(bpp==4) IB[(j*Dim[N-1].L+i)*bpp+3]=IA[(j*LS+D+i)*bpp+3];
	}
      }      
      SDL_UnlockSurface(Image[N-1]);

      // Affiche le sprite
      Affiche(400,300,N-1);
      SDL_RenderPresent(sdlRenderer);
    }    
  } while(x<LS);
  
  // Nettois la mémoire
  SDL_UnlockSurface(Img);
  SDL_FreeSurface(Img);
  delete [] Provi; // Libère la mémoire
  
  // Sauve le sprite
  wint(N); // Sauve le nombre de sprite
  for(i=0;i<N;i++) { // Fait tous les sprites
    wint(Dim[i].L); // Sauve les dimensions
    wint(Dim[i].H);
    wint(Dim[i].cx);
    wint(Dim[i].cy);
    wint(Dim[i].bpp);
    
    SDL_LockSurface(Image[i]);
    fwrite((void*)Image[i]->pixels,1,Dim[i].L*Dim[i].H*Dim[i].bpp,file);
    SDL_UnlockSurface(Image[i]);
  }
  
  Delete(); // Vide le sprite
  return true;
}
 
/*** Affiche le sprite ***/
/*************************/
void Sprite::Affiche(int X,int Y,int NumSpr)
{
  SDL_Rect Position;
  SDL_Rect Di;

  Position.x=X-Dim[NumSpr].cx;
  Position.y=Y-Dim[NumSpr].cy;
  
  Position.w=Position.h=Di.x=Di.y=0;
  Di.w=Dim[NumSpr].L;
  Di.h=Dim[NumSpr].H;

  SDL_BlitSurface(Image[NumSpr],&Di,sdlVideo,&Position);
}

/*** Efface le sprite ***/
/************************/
void Sprite::Efface(int X,int Y,int NumSpr,SDL_Surface *Fond)
{
  SDL_Rect Position;
  
  Position.w=Dim[NumSpr].L;
  Position.h=Dim[NumSpr].H;
  Position.x=X-Dim[NumSpr].cx;
  Position.y=Y-Dim[NumSpr].cy;

  SDL_BlitSurface(Fond,&Position,sdlVideo,&Position);
}

/*** Efface le sprite ***/
/************************/
void Sprite::Delete(void)
{
  if(N) {
    for(int i=0;i<N;i++) {
      SDL_FreeSurface(Image[i]);
    }
    delete [] Image;
    delete [] Dim;
  }
}
