#include "colors.inc"
#include "woods.inc"
#include "finish.inc"
#include "texture_jeu.inc"

#declare M_PI = 3.141592654;

#declare Num=int(clock);
//#declare Num=5;

// *** Définition de la scène pour le test ***
// *******************************************
camera {
	location <0,250,0>
//	location <20,22,-30>
	look_at <0,0,0>
	angle 8.7
//	angle 40
	right <1,0,0>
}

light_source { <-30,170,30> color White*7.5
	fade_distance 700 fade_power 3
}
light_source { <80,90,-80> color White*7.5
	fade_distance 600
	shadowless
}

// *** Fond d'ecran ***
// ********************
#declare Fond=object {
	plane { y,-4.25 }
	texture { T_Fond }
}

// *** Fabrique une pointe de fleche ***
// *************************************
#declare Pointe=difference {
	 box { <-6,0,-6> <6,4,6> rotate <0,45,0> }
	 plane { x,0 }
	 translate <9,0,0>
}

// *** Fabrique une Queue de fleche ***
// ************************************
#declare Queue=union {
	 box { <0,0,3> <-9,4,-3> rotate <0,45,0> }
	 box { <0,0,3> <-9,4,-3> rotate <0,-45,0> }
	 translate <-9,0,0>
}

// *** Fabrique un corp droit ***
// ******************************
#declare Droit=box { <-9,0,-3> <9,4,3> }

// *** Fabrique un corp courbe ***
// *******************************
#declare Courbe=difference {
	 cylinder { <-9,0,-9> <-9,4,-9>,12 }
	 cylinder { <-9,-0.5,-9> <-9,4.5,-9>,6 }
	 plane { x,-9 }
	 plane { z,-9 }
}

// *** Définition des fleches ***
// ******************************
#declare Loco=union {
#if (Num=0) // GH
    object { Pointe rotate <0,90,0> }
    object { Courbe }
    object { Queue }
    scale <1,1,-1>
#end

#if (Num=1) // GD
    object { Pointe }
    object { Droit }
    object { Queue }
#end

#if (Num=2) // GB
    object { Pointe rotate <0,90,0> }
    object { Courbe }
    object { Queue }
#end

// Haut
#if (Num=3) 
    object { Pointe rotate <0,90,0> }
    object { Courbe }
    object { Queue }
    scale <1,1,-1>
    rotate <0,90,0>
#end

#if (Num=4) 
    object { Pointe }
    object { Droit }
    object { Queue }
    rotate <0,90,0>
#end

#if (Num=5)
    object { Pointe rotate <0,90,0> }
    object { Courbe }
    object { Queue }
    rotate <0,90,0>
#end

// Droite
#if (Num=6) 
    object { Pointe rotate <0,90,0> }
    object { Courbe }
    object { Queue }
    scale <1,1,-1>
    rotate <0,180,0>
#end

#if (Num=7) 
    object { Pointe }
    object { Droit }
    object { Queue }
    rotate <0,180,0>
#end

#if (Num=8)
    object { Pointe rotate <0,90,0> }
    object { Courbe }
    object { Queue }
    rotate <0,180,0>
#end

// Haut
#if (Num=9) 
    object { Pointe rotate <0,90,0> }
    object { Courbe }
    object { Queue }
    scale <1,1,-1>
    rotate <0,270,0>
#end

#if (Num=10) 
    object { Pointe }
    object { Droit }
    object { Queue }
    rotate <0,270,0>
#end

#if (Num=11)
    object { Pointe rotate <0,90,0> }
    object { Courbe }
    object { Queue }
    rotate <0,270,0>
#end

    texture { Ruby_Glass }

}

// *** Définition de la scene ***
// ******************************
union { 
//      object { Fond }
      object { Loco }
}
