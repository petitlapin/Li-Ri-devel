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

// *** Fabrique un aileron de flechette ***
// ****************************************
#declare Aileron = union {
	 difference {
		    box { <-0.25,0,-5> <0.25,2,-3> }
		    cylinder { <-1,0,-3> <1,0,-3>,2 inverse }
	 }
	 difference {
		    box { <-0.25,0,-3> <0.25,2,0> }
		    cylinder { <-1,0,0> <1,0,0>,1 inverse scale
		    <1,2,3> translate <0,0,-3> }
	}
	scale <2,2,2>
	texture { Bois_Rouge }
	translate <0,0.5,-2>
}

// *** Fabrique une flèchette ***
// ******************************
#declare Fleche=union {
	 object { Aileron }
	 object { Aileron rotate <0,0,135> }
	 object { Aileron rotate <0,0,-135> }
	 cylinder { <0,0,-12.1> <0,0,5>,1 texture { Bois_Bleu } }

	 // fait la pointe de la flechette
	 difference { 
		    cylinder { <0,0,5> <0,0,10>,1.3 }
		    torus { 1.3 0.2 rotate <90,0,0> translate <0,0,6> }
		    torus { 1.3 0.2 rotate <90,0,0> translate <0,0,7> }
		    torus { 1.3 0.2 rotate <90,0,0> translate <0,0,8> }
		    torus { 1.3 0.2 rotate <90,0,0> translate <0,0,9> }
		   texture { T_Metal }
	 }
	 sphere { <0,0,10>,1.3 texture { T_Metal } }
	 sphere { <0,0,0>,0.3 scale <1,1,25> translate <0,0,10> texture { T_Metal } }
}

// *** Définition de la scene ***
// ******************************
union { 
//      object { Fond }

      object { Fleche rotate <0,90,0> rotate
      <Avance*360/3,sin(Avance*M_PI*2)*25,cos(Avance*M_PI*2)*20> translate <sin(Avance*M_PI*2)*2-3,6,0> }
}