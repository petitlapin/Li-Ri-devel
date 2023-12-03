#include "colors.inc"
#include "woods.inc"
#include "finish.inc"
#include "texture_jeu.inc"

#declare M_PI = 3.141592654;

#declare Avance=clock;

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

// *** Définition du verre ***
// ***************************
#declare Loco=union {
	 difference {
	 	 cylinder { <0,3,-3> <0,3,-12>,2.1 }
		 plane { x,0 }
		 plane { y,3 }
		 texture { Bois_Rouge }
		 }

	 difference {
	 	 cylinder { <0,3,-3> <0,3,-12>,2.1 }
		 plane { x,0 inverse }
		 plane { y,3 }
		 texture { Bois_Vert }
		 }

	 difference {
	 	 cylinder { <0,3,-3> <0,3,-12>,2.1 }
		 plane { x,0 }
		 plane { y,3 inverse }
		 texture { Bois_Jaune }
		 }

	 difference {
	 	 cylinder { <0,3,-3> <0,3,-12>,2.1 }
		 plane { x,0 inverse }
		 plane { y,3 inverse }
		 texture { Bois_Bleu }
		 }

	 cylinder { <0,3,6> <0,3,2>,0.8 texture { T_Stone8 } }

	 cylinder { <0,3,-2> <0,3,-3>,2.2 texture { T_Gold_3B } }
	 sphere { <0,3+2.2,-2.5>,0.27 texture { T_Gold_3B } }
	 sphere { <0,3-2.2,-2.5>,0.27 texture { T_Gold_3B } }
	 sphere { <-2.2,3,-2.5>,0.27 texture { T_Gold_3B } }
	 sphere { <2.2,3,-2.5>,0.27 texture { T_Gold_3B } }
	 sphere { <0,3,-2.5>,1.7 texture { T_Gold_3B } }
	 cylinder { <0,3,-12> <0,3,-13>,2.2 texture { T_Gold_3B } }
	 sphere { <0,3+2.2,-12.5>,0.27 texture { T_Gold_3B } }
	 sphere { <0,3-2.2,-12.5>,0.27 texture { T_Gold_3B } }
	 sphere { <-2.2,3,-12.5>,0.27 texture { T_Gold_3B } }
	 sphere { <2.2,3,-12.5>,0.27 texture { T_Gold_3B } }
	 sphere { <0,3,-12.5>,1.7 texture { T_Gold_3B } }

	 cylinder { <0,3,-2> <0,3,1.7>,0.75 texture { T_Gold_3B } }
	 cylinder { <0,3,0.8> <0,3,1.7>,1.2 texture { T_Gold_3B } }
	 torus { 1.2,0.1 rotate <90,0,0> translate <0,3,1.6> texture { T_Gold_3B } }
	 torus { 1.2,0.1 rotate <90,0,0> translate <0,3,0.9> texture { T_Gold_3B } }
	 
	 difference {
		    cylinder { <0,3,1.7> <0,3,4>,0.9 }
		    cylinder { <0,3,0> <0,3,4>,0.8 }
		    box { <-0.2,0,0> <0.2,6,6> }
		    box { <-5,2.8,0> <5,3.2,6> }
		    texture { T_Gold_3B }
		    }

	translate <0,-3,-5>
}

// *** Définition de la scene ***
// ******************************
union { 
//      object { Fond }

      object { Loco
	     translate <-0.5,cos(Avance*M_PI*2)*1,-sin(Avance*M_PI*2)*2.5+1>
//	     rotate <0,0,Avance*360>
	     rotate <20,0,0>
	     rotate <0,0,-Avance*360>
	     rotate <20,-35,0>
      }
}