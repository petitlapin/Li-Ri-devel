#include "colors.inc"
#include "woods.inc"
#include "finish.inc"
#include "texture_jeu.inc"

#declare M_PI = 3.141592654;

#declare Avance=clock;
#declare ARoue=-360*Avance;

// *** Définition de la scène pour le test ***
// *******************************************
camera {
	location <0,250,0>
//	location <20,22,-30>
	look_at <0,0,0>
	angle 9.5
//	angle 40
	right <1,0,0>
}

light_source { <-30,170,30> color White*0.8
	fade_distance 200 fade_power 2
}
light_source { <80,90,-80> color White*0.8
	fade_distance 160
	shadowless
}

// *** Fond d'ecran ***
// ********************
#declare Fond=object {
	plane { y,-4.25 }
	texture { T_Fond }
}

// *** Fabrique une flèche rouge ***
// *********************************
#declare Fleche=union {
	 box { <-4,-1,-10> <0,1,10> texture { Bois_Bleu } }
	 sphere { <-4,0,10>,4 texture { Bois_Vert } }
	 sphere { <-4,0,-10>,4 texture { Bois_Vert } }
}

// *** Définition du verre ***
// ***************************
#declare Loco=union {
	 object { Fleche rotate <cos(Avance*M_PI*2)*35,0,0> translate <-8+sin(Avance*M_PI)*6,9,0> }
	 object { Fleche rotate <cos(Avance*M_PI*2)*35,0,0> translate
	 <-8+sin(Avance*M_PI)*6,9,0> rotate <0,180,0> }

	  sphere { <0,0,0>,3 texture { Bois_Jaune } scale <1,1,sin(Avance*M_PI)*3+1> translate <0,9,0> } 
}

// *** Définition de la scene ***
// ******************************
union { 
//      object { Fond }

      object { Loco }
}