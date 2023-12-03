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

#ifndef _SPRITE_DOM_
#define _SPRITE_DOM_

#include <SDL/SDL.h>
#include <SDL/SDL_image.h>

#define FCOLOR 128
#define ALPHA_OMBRE 155

/*** Definition de la structure Dim ***/
/**************************************/
struct s_Dim {
  int L,H;
  int cx,cy; // Centre de l'image après recadrage
  int bpp;   // Nombre de bytes par pixels 3 ou 4 avec l'alpha
};

/*** Definition de la classe Sprite ***/
/**************************************/
class Sprite
{
 public:
  Sprite(void);
  ~Sprite(void);

  /*** Fonctions ***/
  bool Load(char *NomImage,char *NomAlpha,int N); // Charge les fichiers au format PNG
  bool LoadCaractaire(char *NomImage);
  void Affiche(int X,int Y,int NumSpr);  // Affiche le sprite
  void Efface(int X,int Y,int NumSpr,SDL_Surface *Fond);   // Efface le sprite
  void Delete(void); // Efface la mémoire du sprite

  /*** Variables ***/
  int N;            // Nombre de sprite
  SDL_Surface **Image; // Pointe sur les sprites
  s_Dim *Dim; // Dimensions des sprites
};

#endif
