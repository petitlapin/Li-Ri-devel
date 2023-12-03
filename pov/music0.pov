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

// *** Fabrique une baguette ***
// *****************************
#declare Baguette=union {
	 cone { <0,0,0>,0.25 <10,0,0>,0.15 }
	 sphere { <10,0,0>,0.5 }
	 texture { Bois_Sapin rotate <0,90,0> }
}

// *** Fabrique un corde ***
// *************************
#declare Corde=difference {
	 cylinder { <0,0,0> <0,6.1,0>,5.08 }
	 plane { y,0 inverse translate <0,0.15,0> rotate <0,0,73> }
	 plane { y,0 translate <0,-0.15,0> rotate <0,0,73> }
	 cylinder { <0,0,0> <0,8,0>,4.75 }
	 texture { T_Blanc }
}

// *** Fabrique un Tambour ***
// ***************************
#declare Tambour=union {
	difference {
		    cylinder { <0,0,0> <0,6,0>,5 }
		    cylinder { <0,-1,0> <0,8,0>,4.80 }
		    texture { Bois_Rouge rotate <88,0,0> }
	}
	torus { 4.90,0.05 texture { Bois_Rouge rotate <88,0,0> } }
	torus { 4.90,0.05 translate <0,6,0> texture { Bois_Rouge rotate <88,0,0> } }

	cylinder { <0,0,0> <0,5.3,0>,4.8 texture { T_Blanc } }
	cylinder { <0,4.5,0> <0,5,0>,5.05 texture { Bois_Jaune rotate <92,0,0> } }
	cylinder { <0,1,0> <0,1.5,0>,5.05 texture { Bois_Jaune rotate <88,0,0> } }
	cylinder { <0,1.5,0> <0,4.5,0>,5.05 texture { Bois_Bleu rotate <92,0,0> } }
	
	union {
	      object { Corde }
	      object { Corde scale <-1,1,1> }
	      sphere { <0,0.5,-5>,0.4 texture { T_Metal } }
	      sphere { <0,5.5,-5>,0.4 texture { T_Metal } rotate <0,22.5,0> }
	      sphere { <0,0.5,5>,0.4 texture { T_Metal } }
	      sphere { <0,5.5,5>,0.4 texture { T_Metal } rotate <0,22.5,0> }
	}
	union {
	      object { Corde }
	      object { Corde scale <-1,1,1> }
	      sphere { <0,0.5,-5>,0.4 texture { T_Metal } }
	      sphere { <0,5.5,-5>,0.4 texture { T_Metal } rotate <0,22.5,0> }
	      sphere { <0,0.5,5>,0.4 texture { T_Metal } }
	      sphere { <0,5.5,5>,0.4 texture { T_Metal } rotate <0,22.5,0> }
	      rotate <0,45,0>
	}
	union {
	      object { Corde }
	      object { Corde scale <-1,1,1> }
	      sphere { <0,0.5,-5>,0.4 texture { T_Metal } }
	      sphere { <0,5.5,-5>,0.4 texture { T_Metal } rotate <0,22.5,0> }
	      sphere { <0,0.5,5>,0.4 texture { T_Metal } }
	      sphere { <0,5.5,5>,0.4 texture { T_Metal } rotate <0,22.5,0> }
	      rotate <0,90,0>
	}
	union {
	      object { Corde }
	      object { Corde scale <-1,1,1> }
	      sphere { <0,0.5,-5>,0.4 texture { T_Metal } }
	      sphere { <0,5.5,-5>,0.4 texture { T_Metal } rotate <0,22.5,0> }
	      sphere { <0,0.5,5>,0.4 texture { T_Metal } }
	      sphere { <0,5.5,5>,0.4 texture { T_Metal } rotate <0,22.5,0> }
	      rotate <0,135,0>
	}

	object { Baguette rotate <0,0,-30+sin(Avance*M_PI)*60> translate <-11,10.5,0> rotate <0,30,0> }
	object { Baguette rotate <0,0,30-sin(Avance*M_PI)*60> translate <-11,10.5,0> rotate <0,30,0> scale<-1,1,1> }

	rotate <0,sin(Avance*2*M_PI)*15,0>
}

// *** Définition de la scene ***
// ******************************
union { 
//      object { Fond }
      object { Tambour scale 1.3 rotate <40+sin(Avance*M_PI)*10,0,0> translate <0,15,-4> }
}
