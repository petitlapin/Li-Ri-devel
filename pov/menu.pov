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
	angle 8.5
	right <550/450,0,0>
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
	plane { y,0 }
	texture { T_Grnt9 scale 0.8 }
}

// *** Fabrique une flèche rouge ***
// *********************************
#declare Fleche=union {
	 box { <-4,-1,-10> <0,1,10> texture { Bois_Bleu } }
	 sphere { <-4,0,10>,4 texture { Bois_Vert } }
	 sphere { <-4,0,-10>,4 texture { Bois_Vert } }
}

// *** Bois de coté du cadre ***/
// *****************************/
#declare Cadre_Cote=difference {
	 union {
	  difference {
		     union {
		    		    cylinder { <4,0,11> <4,2.5,11>,4 }
				    cone { <4,2.5,11>,4 <4,3,11>,3.5 }
			   }
		     plane { x,4 inverse }
		    }
	  difference {
		     union {
		    		    cylinder { <4,0,-11> <4,2.5,-11>,4 }
				    cone { <4,2.5,-11>,4 <4,3,-11>,3.5 }
			   }
		     plane { x,4 inverse }
		    }
	  difference {
		    box { <0,0,-11> <4,3,11> }
		    box { <-1,0,-12> <2,2,12> rotate <0,0,45> translate <0,2.5,0> }
		    }
	     }
         box { <-2,0,-16> <1,2,16> rotate <0,0,-45> translate <4,2.75,0> }
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
#declare Loco=union {
	 object { Cadre_Cote texture { Bois_Vert scale <1.5,1.4,1.6> } translate <-18.3,0,0> }
	 object { Cadre_Cote texture { Bois_Vert scale <1.2,1.5,1.3> rotate <1,2,3> } translate <-18.3,0,0> scale <-1,1,1> }

	 difference { object { Cadre_Haut }
		    cylinder { <0,-1,-2> <0,4,-2>,0.3 }
	   texture { Bois_Vert scale <1.6,1.5,1.7> rotate <0,82,-2> }
	   translate <0,0,15> }

	 object { Cadre_Haut texture { Bois_Vert scale <1.2,1.4,1.8> rotate <2,85,0> } translate <0,0,15> scale <1,1,-1> }
 	 box { <-16,0,-11> <16,0.48,11> pigment { color Black } finish { specular 0.3 metallic } }
	 box { <-16,0,-11> <16,0.5,11> texture { T_Grnt8a finish { specular 0.35 } }
 	 normal { waves 0.06 frequency 1000 scale <700,300,700> }
	 }
}

// *** Définition de la scene ***
// ******************************
union { 
//      object { Fond }

      object { Loco }
}