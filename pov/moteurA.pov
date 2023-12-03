#include "colors.inc"
#include "woods.inc"
#include "finish.inc"
#include "texture_jeu.inc"

#declare M_PI = 3.141592654;

#declare Avance=clock-int(clock);
#declare Num=int(clock);
#declare ARoue=-360*Avance;

// *** Définition de la scène pour le test ***
// *******************************************
camera {
	location <0,250,0>
//	location <20,22,-30>
	look_at <0,0,0>
	angle 8
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
	 object { Roue rotate <ARoue,0,0> translate <5.01,-1,-6> }
	 object { Roue rotate <ARoue+120,0,0> translate <5.01,-1,6> scale <-1,1,1> }
	 object { Roue rotate <ARoue+240,0,0> translate <5.01,-1,-6> scale <-1,1,1> }

	 // Met le crochet
	 object { Crochet translate <0,0,10> }
	 object { Crochet translate <0,0,10> scale <1,1,-1> }

	 // Plateau de la loco
	 union {
	  	 box { <-5,-2,-10> <5,0,10> }
		 texture { Bois_Jaune }
	 }
	 // Met le bout d'axe au centre
	 union {
	       box { <-2,0,-2> <0,6,2> }
	       cylinder { <-2,6,0> <0,6,0>,2 }
	       texture { Bois_Rouge rotate <90,0,0> }
	}
	// Met le levier
	union {
	      box { <0,0,-8> <1,2,8> texture { Bois_Bleu } }
	      cylinder { <-4,0,0> <4,0,0>,0.75 texture { Bois_Bleu rotate <0,90,0> } translate <0,1,7> }
	      cylinder { <-4,0,0> <4,0,0>,0.75 texture { Bois_Bleu rotate <0,90,0> } translate <0,1,-7> }
	      translate <0,-1,0>
	      rotate <sin(Avance*M_PI*2)*35,0,0>
	      translate <0,6,0>
	 }

	 // Met l'axe
	 cylinder { <-2.5,0,0> <1.5,0,0>,0.5 texture { Bois_Vert rotate <0,90,0> } translate <0,7,0> }
}

// *** Définition de la scene ***
// ******************************
union { 
//      object { Fond }

#if (Num=0)
	object { Loco rotate <sin(Avance*M_PI*4)*2,0,sin(Avance*M_PI*2)*5> rotate <0,180,0> }
#end

#if (Num=1)
	object { Loco rotate <sin(Avance*M_PI*4)*2,0,sin(Avance*M_PI*2)*5> }
#end

#if (Num=2)
	object { Loco rotate <sin(Avance*M_PI*4)*2,0,sin(Avance*M_PI*2)*5> rotate <0,90,0> }
#end

#if (Num=3)
        object { Loco rotate <sin(Avance*M_PI*4)*2,0,sin(Avance*M_PI*2)*5> rotate <0,270,0> }
#end

#if (Num>=4)
        object { Loco rotate <sin(Avance*M_PI*4)*2,0,sin(Avance*M_PI*2)*5> rotate <0,180-Num*90-Avance*90,0>}
#end

}