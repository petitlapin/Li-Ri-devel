#include "colors.inc"
#include "woods.inc"
#include "finish.inc"
#include "texture_jeu.inc"

#declare M_PI = 3.141592654;

#declare Avance=0.10;
#declare ARoue=-360*Avance;

// *** Définition de la scène pour le test ***
// *******************************************
camera {
	location <0,250,0>
//	location <-20,20,30>
	look_at <0,3,0>
	angle 8.0
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

// *** Fabrique une roue ***
// *************************
#declare Roue=union {
	 union { 
	 	 torus { 3 1.25 translate <0,1.25,0> }
		 cylinder { <0,0,0> <0,2.5,0>,3 }
		 texture { Bois_Bleu }
	 }
	 cylinder { <0,2.5,0> <0,2.7,0>,2.8 texture { Bois_Jaune } }
	 sphere { <0,0,0>,1.5 scale <1,0.8,1> translate <0,2.7,0> texture { T_Roue } }
	 rotate <0,0,-90>
}

// *** Fabrique un crochet ***
// ***************************
#declare Crochet=union {
	 torus { 1.3 0.4 }
	 cylinder { <0,0,-1.3> <0,0,-4>,0.4 }
	 texture { T_Roue }
	 translate <0,-1,2.3>
}

// *** Définition du verre ***
// ***************************
#declare Loco=union {
	 // Met les roues
	 object { Roue rotate <ARoue+34,0,0> translate <5.01,-1,6> }
	 object { Roue rotate <ARoue,0,0> translate <5.01,-1,-7> }
	 object { Roue rotate <ARoue+120,0,0> translate <5.01,-1,6> scale <-1,1,1> }
	 object { Roue rotate <ARoue+240,0,0> translate <5.01,-1,-7> scale <-1,1,1> }

	 // Met le crochet
	 object { Crochet translate <0,0,10> }

	 // Plateau de la loco
	 difference {
	 	 box { <-5,-2,-13> <5,0,10> }
		 plane { z,0 rotate <35,15,0> translate <0,-2,-13> }
		 plane { z,0 rotate <35,15,0> translate <0,-2,-13> scale <-1,1,1> }
		 texture { Bois_Sapin }
	 }

	 // Chaudière
	 union { 
	 	 cylinder { <0,3.5,2> <0,3.5,-9>,3.5 }
		 difference { 
		 	sphere { <0,0,0>,4 scale <1,1,0.2> translate <0,3.5,-9> }
			cylinder { <0,3.5,0> <0,3.5,-18>,3.5 inverse }
		 } 
		 texture { Bois_Bleu }
	}
	difference {
		union {
		      box { <-3.5,0,2> <-4.5,12,9> }
		      box { <3.5,0,2> <4.5,12,9> }
		}
		cylinder { <-5,9,5.5> <5,9,5.5>,2 }
		texture { Bois_Rouge rotate <90,0,0> }
	}
	box { <-3.5,0,2> <3.5,7.5,3> texture { Bois_Rouge rotate <0,91,0> translate <2,5,-3> }}

	// Fait la toiture
	difference {
		   union {
			 box { <-2,12,1> <2,13,10> }
			 cylinder { <-2,12,1> <-2,12,10>,1 }
			 cylinder { <2,12,1> <2,12,10>,1 }
		   }
		   plane { y,12 }
		   texture { Bois_Jaune translate <1,12,1> }
		   scale <1.66,1,1>
	}
	sphere { <0,13,6>,1 texture { Bois_Rouge rotate <90,0,0> translate <0,12,-1> } }

	// Fait les réservoires sur le coté
	cylinder { <-3.7,1,-7> <-3.7,1,-3>,1 texture { Bois_Noir } }
	cylinder { <3.7,1,-7> <3.7,1,-3>,1 texture { Bois_Noir } }

	// Fait la cheminée
	union {
		difference {
			   cone { <0,0,-6>,0 <0,10,-6>,3 }
			   cone { <0,3,-6>,0 <0,10.1,-6>,2.3 }
		}
		sphere { <0,7,0>,1 }
		texture { Bois_Rouge rotate <90,0,0> translate <0,0,-6> } 
	}
	cylinder { <0,3,-6> <0,7.5,-6>,1.5 texture { Bois_Noir rotate <90,0,1> } }
}

// *** Définition de la scene ***
// ******************************
union { 
//      object { Fond }

      object { Loco rotate <sin(Avance*M_PI*2)*55,0,sin(Avance*M_PI*2)*55> rotate <0,360*Avance,0>  translate <0,8,0> }
}