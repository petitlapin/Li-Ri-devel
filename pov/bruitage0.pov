#include "colors.inc"
#include "woods.inc"
#include "finish.inc"
#include "texture_jeu.inc"

#declare M_PI = 3.141592654;

#declare Avance=clock;

#declare Av=sin(Avance*M_PI*2);

// *** Définition de la scène pour le test ***
// *******************************************
camera {
	location <0,250,0>
//	location <-20,20,30>
	look_at <0,3,0>
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

// *** Fabrique un corde ***
// *************************
#declare Trompette=union {
	 difference {
		    torus { 1.5,1.2 }
		    torus { 1.5,1.13 }
		    plane {  y,0 inverse }
		    cylinder { <0,-2,0> <0,2,0>,1.5 inverse }
		    scale <1,1.3,1>
		    texture { Bois_Rouge rotate <90,0,0> }
	}
	torus { 1.5,0.1 translate <0,-1.55,0> texture { Bois_Bleu } }
	torus { 0.37,0.1 texture { Bois_Bleu } }
	torus { 0.37,0.1 translate <0,1,0 > texture { Bois_Bleu } }
	cylinder { <0,1,0> <0,0,0>,0.37 texture { Bois_Jaune rotate <0,0,90> } }

	sphere { <0,2-Av*0.35,0>,1-Av*0.35 texture { T_Noir } }
	torus { 1-Av*0.35,0.1-Av*0.035 translate <0,2-Av*0.35,0> texture { T_Noir } }

	rotate <0,0,90>
	translate <0.8,0,0>
}

// *** Définition de la scene ***
// ******************************
union { 
//      object { Fond }
      object { Trompette scale 6 rotate <0,cos(Avance*M_PI*2)*16,Av*17> translate <Av*1.5,12+Av*2,0> }
}
