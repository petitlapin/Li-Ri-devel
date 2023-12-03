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

// *** Fabrique une roue ***
// *************************
#declare Monde=union {
	 sphere { <0,0,0>,0.5 }
	 texture {
		 T_Blanc
		 pigment { image_map { png "Textures/map_monde.png" map_type 1} }
	 }
 	 normal { bump_map { png "Textures/map_monde.png" map_type 1 }  bump_size 2 }
} 

// *** Fabrique une aiguille ***/
// *****************************/
#declare AiguilleW=union {
	 cylinder { <-13,0,0> <-1,0,0>,0.1 texture { T_Metal } }
	 sphere { <-13,0,0>,0.8 texture { T_Blanc } }
} 
#declare AiguilleR=union {
	 cylinder { <-13,0,0> <-1,0,0>,0.1 texture { T_Metal } }
	 sphere { <-13,0,0>,0.8 texture { T_Rouge } }
} 
#declare AiguilleB=union {
	 cylinder { <-13,0,0> <-1,0,0>,0.1 texture { T_Metal } }
	 sphere { <-13,0,0>,0.8 texture { T_Bleu } }
} 
#declare AiguilleJ=union {
	 cylinder { <-13,0,0> <-1,0,0>,0.1 texture { T_Metal } }
	 sphere { <-13,0,0>,0.8 texture { T_Jaune } }
} 

// *** Définition de la scene ***
// ******************************
union { 
//      object { Fond }

      union  {
	     object { Monde scale 18}
	     object { AiguilleR rotate <0,0,-38> rotate <0,4,0> }
	     object { AiguilleB rotate <0,0,3> rotate <0,-20,0> }
	     object { AiguilleW rotate <0,0,-35> rotate <0,115,0> }
	     object { AiguilleW rotate <0,0,-20> rotate <0,-100,0> }
	     object { AiguilleJ rotate <0,0,25> rotate <0,70,0> }
	     object { AiguilleB rotate <0,0,27> rotate <0,240,0> }
	     object { AiguilleJ rotate <0,0,-28> rotate <0,-57,0> }

	     rotate <0,Avance*360,0>
	     rotate <90+sin(Avance*M_PI*2)*27,0,cos(Avance*M_PI*2)*10> 
	     translate <0,28,0>
	     scale 0.88
	     }

}