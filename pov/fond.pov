#include "colors.inc"
#include "woods.inc"
#include "finish.inc"
#include "texture_jeu.inc"

#declare M_PI = 3.141592654;

#declare Avance = 0;

// *** Définition de la scène pour le test ***
// *******************************************
camera {
	location <0,250,0>
	look_at <0,0,0>
	angle 9.5
	right <800/600,0,0>
}

light_source { <-30,170,30> color White*0.8
	fade_distance 200 fade_power 2
}
light_source { <80,90,-80> color White*0.8
	fade_distance 160
	shadowless
}
//	angle 40

// *** Fond d'ecran ***
// ********************
#declare Fond=object {
	plane { y,0 }
//	texture { T_Grnt9 scale 0.8 }
	texture {	
		pigment {
			image_map { png "Textures/Fond_Sol.png" }
					translate <-0.5,-0.5,0>
					rotate <90,0,0>
					scale <5.2*8,1,5.2*6>
				}
				finish {
				       specular 0.3
				       reflection 0.015
				crand 0.2
				}
		}
}

// *** Bois de coté du cadre ***/
// *****************************/
#declare H = 76;

#declare Cadre_Cote=difference {
	 union {
	  difference {
		     union {
		    		    cylinder { <4,0,H> <4,2.5,H>,4 }
				    cone { <4,2.5,H>,4 <4,3,H>,3.5 }
			   }
		     plane { x,4 inverse }
		    }
	  difference {
		     union {
		    		    cylinder { <4,0,-H> <4,2.5,-H>,4 }
				    cone { <4,2.5,-H>,4 <4,3,-H>,3.5 }
			   }
		     plane { x,4 inverse }
		    }
	  difference {
		    box { <0,0,-H> <4,3,H> }
		    box { <-1,0,-H-1> <2,2,H+1> rotate <0,0,45> translate <0,2.5,0> }
		    }
	     }
         box { <-2,0,-H-5> <1,2,H+5> rotate <0,0,-45> translate <4,2.75,0> }
}

#declare Cadre_Haut=difference {
	 box { <-14.3,0,0> <14.3,3,-4> } 
	 box { <-15,0,1> <15,1,-1> rotate <45,0,0> translate <0,2.5,0> }
	 box { <-15,0,1> <15,1,-1> rotate <-45,0,0> translate <0,2.75,-4> }
	 box { <-2,0,-5> <2,1,1> rotate <0,0,45> translate <-14.3,2.75,0> }
	 box { <-2,0,-5> <2,1,1> rotate <0,0,-45> translate <14.3,2.75,0> }
}

// *** Définition du verre ***
// ***************************
#declare Cadre=union {
	 object { Cadre_Cote texture { Bois_Bleu scale <6.5,6.4,6.6> rotate <-1,-4,0> } translate <-18.3,0,0> }
	 object { Cadre_Cote texture { Bois_Bleu scale <6.2,6.5,6.3> rotate <1,-6,3> } translate <-18.3,0,0> scale <-1,1,1> }

	 difference { object { Cadre_Haut }
		    cylinder { <0,-1,-2> <0,4,-2>,0.3 }
	   texture { Bois_Bleu scale <6.6,6.5,6.7> rotate <0,82,-2> }
	   translate <0,0,H+4> }

	 object { Cadre_Haut texture { Bois_Bleu scale <6.2,6.4,6.8> rotate <2,85,0> } translate <0,0,H+4> scale <1,1,-1> }
 	 box { <-15,0,-H> <15,0.48,H> pigment { color Black } finish { specular 0.3 metallic } }
	 box { <-15,0,-H> <15,0.5,H> texture { T_Grnt8a finish { specular 0.35 } }
 	 normal { waves 0.06 frequency 1000 scale <990,100,990> }
	 }
}

// *** Définition de la scene ***
// ******************************
union { 
      object { Fond }

      object { Cadre scale <0.17,0.44,0.17> translate <17.5,0,-1.87> }
}