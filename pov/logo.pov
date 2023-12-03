#include "colors.inc"
#include "woods.inc"
#include "finish.inc"
#include "texture_jeu.inc"

#declare M_PI = 3.141592654;

// *** Définition de la scène pour le test ***
// *******************************************
camera {
	location <0,250,0>
//	location <80,89,-78>
	look_at <0,0,0>
	angle 45.5
//	angle 40
	right <350/90,0,0>
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
	plane { y,-0 }
	texture { T_Fond }
}

// *** Fabrique une flèchette ***
// ******************************
#declare Cube=union {
	 sphere { <-4,4,-4>,1 }
	 sphere { <-4,4,4>,1 }
	 sphere { <4,4,-4>,1 }
	 sphere { <4,4,4>,1 }
	 sphere { <-4,-4,-4>,1 }
	 sphere { <-4,-4,4>,1 }
	 sphere { <4,-4,-4>,1 }
	 sphere { <4,-4,4>,1 }

	 cylinder { <-4,4,-4> <-4,4,4>,1 }
	 cylinder { <4,4,-4> <4,4,4>,1 }
	 cylinder { <-4,4,-4> <4,4,-4>,1 }
	 cylinder { <-4,4,4> <4,4,4>,1 }

	 cylinder { <-4,-4,-4> <-4,-4,4>,1 }
	 cylinder { <4,-4,-4> <4,-4,4>,1 }
	 cylinder { <-4,-4,-4> <4,-4,-4>,1 }
	 cylinder { <-4,-4,4> <4,-4,4>,1 }

	 cylinder { <-4,-4,-4> <-4,4,-4>,1 }
	 cylinder { <4,-4,-4> <4,4,-4>,1 }
	 cylinder { <-4,-4,4> <-4,4,4>,1 }
	 cylinder { <4,-4,4> <4,4,4>,1 }

	 box { <-5,-4,-4> <5,4,4> }
	 box { <-4,-5,-4> <4,5,4> }
	 box { <-4,-4,-5> <4,4,5> }
}

#declare LettreR=union {
	 sphere { <-1.5,0,-3>,0.7 }
	 sphere { <-1.5,0,3>,0.7 }
	 sphere { <1.5,0,-3>,0.7 }
	 cylinder { <-1.5,0,-3> <-1.5,0,3>,0.7 }
	 cylinder { <0,0,0> <0,0,4>,0.7 rotate <0,-40,0> translate <1.5,0,-3> }
	 cylinder { <-1.5,0,3> <0,0,3>,0.7 }
	 cylinder { <-1.5,0,0> <0,0,0>,0.7 }

	 difference {
		    torus { 1.5,0.7 translate <0,0,1.5> }
		    plane { x,0 }
		}

	 scale <1,0.3,1>
}

#declare LettreI=union {
	 sphere { <-1.5,0,-3>,0.7 }
	 sphere { <-1.5,0,3>,0.7 }
	 sphere { <1.5,0,-3>,0.7 }
	 sphere { <1.5,0,3>,0.7 }
	 cylinder { <0,0,-3> <0,0,3>,0.7 }
	 cylinder { <0,0,-3> <0,0,3>,0.7 }
	 cylinder { <-1.5,0,3> <1.5,0,3>,0.7 }
	 cylinder { <-1.5,0,-3> <1.5,0,-3>,0.7 }

	 scale <1,0.3,1>
}

#declare LettreC=union {
	 sphere { <1,0,2.5>,1 }
	 sphere { <1,0,-2.5>,1 }
	 difference {
		    torus { 2.5,1 }
		    plane { x,0 inverse }
	 }
	 cylinder { <-0.1,0,2.5> <1,0,2.5>,1 }
	 cylinder { <-0.1,0,-2.5> <1,0,-2.5>,1 }

	 scale <1,0.3,1>
}

#declare LettreL=union {
	 sphere { <-1.5,0,-3>,0.7 }
	 sphere { <-1.5,0,3>,0.7 }
	 sphere { <1.5,0,-3>,0.7 }
	 cylinder { <-1.5,0,-3> <-1.5,0,3>,0.7 }
	 cylinder { <-1.5,0,-3> <1.5,0,-3>,0.7 }

	 scale <1,0.3,1>
}

#declare Cube_Rouge=difference {
	 object { Cube texture { Bois_Rouge scale <1.5,1.5,1.5> } translate <0,5,0> }
	 object { LettreL texture { Bois_Vert } translate <0.5,10,0> }
	 scale <2.5,2.5,2.5>
}

#declare Cube_Bleu=difference {
	 object { Cube texture { Bois_Bleu scale <1.5,1.5,1.5> } translate <0,5,0> }
	 object { LettreI texture { Bois_Jaune } translate <0.5,10,0> }
	 scale <2.5,2.5,2.5>
}

#declare Cube_Jaune=difference {
	 object { Cube texture { Bois_Jaune scale <1.5,1.5,1.5> } translate <0,5,0> }
	 object { LettreR texture { Bois_Bleu } translate <-0.25,10,0> }
	 scale <2.5,2.5,2.5>
	 translate <-3,0,2>
}

#declare Cube_Vert=difference {
	 object { Cube texture { Bois_Vert scale <1.5,1.5,1.5> } translate <0,5,0> }
	 object { LettreI texture { Bois_Rouge } translate <0,10,0> }
	 scale <2.5,2.5,2.5>
}

// *** Définition de la scene ***
// ******************************
union { 
//      object { Fond }

      object { Cube_Rouge rotate <0,-36,0> translate <-75,0,0> }
      object { Cube_Bleu rotate <0,-19,0> translate <-32,0,4> }
      object { Cube_Jaune rotate <0,21,0> translate <32,0,3> }
      object { Cube_Vert rotate <0,35,0> translate <75,0,0> }
      union { 
	    cylinder { <-4,0,0> <3,0,0>,4 }
	    sphere { <-4,0,0>,4 }
	    sphere { <3,0,0>,4 }
	    texture { Bois_Rouge }
	    translate <0,0,5>
	    }
}