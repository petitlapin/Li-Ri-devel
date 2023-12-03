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
	angle 6.5
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
	plane { y,-5.25 }
	texture { T_Fond }
}

// *** Fabrique une flèche rouge ***
// *********************************
#declare Loco=difference {
	 cone { <-13,0,0>,0 <12,0,0>,9  scale <1,0.15,1> }	 
	 sphere { <5,0,0>,4.2 }
	 texture { Bois_Rouge rotate <0,90,0> }
}

// *** Définition de la scene ***
// ******************************
union { 
      object { Fond }

#if(Avance=0)
      object { Loco }
#end

#if(Avance=1)
      object { Loco }
      sphere { <5,0,0>,4.1 texture { Bois_Vert }}
#end

#if(Avance=2)
      object { Loco }
      sphere { <5,0,0>,4.1 texture { Bois_Jaune }}
#end

#if(Avance=3)
      object { Loco }
      scale <-1,1,1>
#end

#if(Avance=4)
      object { Loco }
      sphere { <5,0,0>,4.1 texture { Bois_Vert }}
      scale <-1,1,1>
#end

#if(Avance=5)
      object { Loco }
      sphere { <5,0,0>,4.1 texture { Bois_Jaune }}
      scale <-1,1,1>
#end
}