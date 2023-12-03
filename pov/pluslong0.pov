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
	angle 8.5
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
	 cone { <0,0,0>,0.8 <12,0,0>,2.5 texture { Bois_Rouge rotate <0,90,0> } }
	 cone { <0,0,0>,0.8 <0,0,12>,2.5 texture { Bois_Rouge } }
	 sphere { <0,0,0>,3 texture { Bois_Bleu } }
	 rotate <0,45,0>
}

// *** Définition du verre ***
// ***************************
#declare Loco=union {
	 object { Fleche rotate <cos(Avance*M_PI*2)*40,0,0> translate <-4-sin(Avance*M_PI)*8,9,0> }
	 object { Fleche rotate <cos(Avance*M_PI*2)*40,0,0> translate
	 <-4-sin(Avance*M_PI)*8,9,0> rotate <0,180,0> }

	  sphere { <0,0,0>,2 texture { Bois_Jaune } scale <1+sin(Avance*M_PI)*2.2,1,1> translate <0,9,0> } 
}

// *** Définition de la scene ***
// ******************************
union { 
      object { Fond }

      object { Loco }
}