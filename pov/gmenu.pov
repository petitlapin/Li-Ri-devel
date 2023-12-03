#include "colors.inc"
#include "woods.inc"
#include "finish.inc"
#include "texture_jeu.inc"

#declare M_PI = 3.141592654;

#declare Avance = 0;

// *** D�finition de la sc�ne pour le test ***
// *******************************************
camera {
	location <0,250,0>
	look_at <0,0,0>
	angle 8.7
	right <800/600,0,0>
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

// *** Bois de cot� du cadre ***/
// *****************************/
#declare Cadre_Cote=difference {
	 union {
	  difference {
		     union {
		    		    cylinder { <3,0,11> <3,2.5,11>,3 }
				    cone { <3,2.5,11>,3 <3,3,11>,2.5 }
			   }
		     plane { x,3 inverse }
		    }
	  difference {
		     union {
		    		    cylinder { <3,0,-11> <3,2.5,-11>,3 }
				    cone { <3,2.5,-11>,3 <3,3,-11>,2.5 }
			   }
		     plane { x,3 inverse }
		    }
	  difference {
		    box { <0,0,-11> <3,3,11> }
		    box { <-1,0,-12> <2,2,12> rotate <0,0,45> translate <0,2.5,0> }
		    }
	     }
         box { <-2,0,-16> <1,2,16> rotate <0,0,-45> translate <3,2.75,0> }
}

#declare Cadre_Haut=difference {
	 box { <-15.3,0,0> <15.3,3,-3> } 
	 box { <-16,0,1> <16,1,-1> rotate <45,0,0> translate <0,2.5,0> }
	 box { <-16,0,1> <16,1,-1> rotate <-45,0,0> translate <0,2.75,-3> }
	 box { <-2,0,-5> <2,1,1> rotate <0,0,45> translate <-15.3,2.75,0> }
	 box { <-2,0,-5> <2,1,1> rotate <0,0,-45> translate <15.3,2.75,0> }
}

// *** D�finition du verre ***
// ***************************
#declare Loco=union {
	 object { Cadre_Cote texture { Bois_Vert scale <1.5,1.4,1.6> } translate <-18.3,0,0> }
	 object { Cadre_Cote texture { Bois_Vert scale <1.2,1.5,1.3> rotate <1,2,3> } translate <-18.3,0,0> scale <-1,1,1> }

	 difference { object { Cadre_Haut }
		    cylinder { <0,-1,-1.5> <0,4,-1.5>,0.3 }
	   texture { Bois_Vert scale <1.6,1.5,1.7> rotate <0,82,-2> }
	   translate <0,0,14> }

	 object { Cadre_Haut texture { Bois_Vert scale <1.2,1.4,1.8> rotate <2,85,0> } translate <0,0,14> scale <1,1,-1> }
 	 box { <-16,0,-11> <16,0.48,11> 
	     pigment { color Black }
	     finish { specular 0.3 } // metallic }
	     normal { bump_map { png "Textures/fond_menu.png" }
		    bump_size 8
		    rotate <90,0,0> 
		    translate <-0.5,0,0.5>
		    scale <8,-8,6>
		    scale 3.8
		    }
	     }

	 box { <-16,0,-11> <16,0.5,11> texture { T_Grnt8a finish { specular 0.35 } }
 	 normal { waves 0.06 frequency 1000 scale <700,500,700> }
	 }
}

// *** D�finition de la scene ***
// ******************************
union { 
//      object { Fond }

      object { Loco }
}