#include "colors.inc"
#include "woods.inc"
#include "finish.inc"
#include "texture_jeu.inc"

#declare M_PI = 3.141592654;

#declare Num=int(clock);
//#declare Num=10;

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

// *** Bois Haut Bas ***
// *********************
#declare OBasHaut=difference {
	 box { <-11,-4.25,-14> <11,0,14> }
	 box { <-1,0,-15> <2,2,15> rotate <0,0,45> translate <-11,-0.5,0> }
	 box { <1,0,-15> <-2,2,15> rotate <0,0,-45> translate <11,-0.5,0> }
}

#declare OGaucheDroite=difference {
	 box { <-11,-4.25,-14> <11,0,14> }
	 box { <-1,0,-15> <2,2,15> rotate <0,0,45> translate <-11,-0.5,0> }
	 box { <1,0,-15> <-2,2,15> rotate <0,0,-45> translate <11,-0.5,0> }
	 rotate <0,90,0>
}

// *** Rails du Haut Bas ***
// *************************
#declare CBasHaut=union {
	 cylinder { <-6.25,0,-15> <-6.25,0,15>,1.5 }
	 cylinder { <6.25,0,-15> <6.25,0,15>,1.5 }
}

#declare CGaucheDroite=union {
	 cylinder { <-6.25,0,-15> <-6.25,0,15>,1.5 }
	 cylinder { <6.25,0,-15> <6.25,0,15>,1.5 }
	 rotate <0,90,0>
}


// *** Bois Bas Gauche ***
// ***********************
#declare OBasGauche=difference {
	 cylinder { <14,-4.25,14> <14,0,14>,25 }
	 cylinder { <14,-5,14> <14,1,14>,3 }
	 plane { x,14 inverse }
	 plane { z,14 inverse }
	 cone { <14,-0.5,14>,3 <14,0.5,14>,4 }
	 cone { <14,0.5,14>,24 <14,-5.5,14>,30 inverse }
}

// *** Rail Bas Gauche ***
// ***********************
#declare CBasGauche=union {
	 torus { 20.25 1.5 translate <14,0,14> }
	 torus { 7.75 1.5 translate <14,0,14> }
}

// *** Bois Bas Droite ***
// ***********************
#declare OBasDroite=difference {
	 cylinder { <14,-4.25,14> <14,0,14>,25 }
	 cylinder { <14,-5,14> <14,1,14>,3 }
	 plane { x,14 inverse }
	 plane { z,14 inverse }
	 cone { <14,-0.5,14>,3 <14,0.5,14>,4 }
	 cone { <14,0.5,14>,24 <14,-5.5,14>,30 inverse }
	 scale <-1,1,1>
}

// *** Rail Bas Gauche ***
// ***********************
#declare CBasDroite=union {
	 torus { 20.25 1.5 translate <14,0,14> }
	 torus { 7.75 1.5 translate <14,0,14> }
	 scale <-1,1,1>
}

// *** Fait un trou de raccord ***
// *******************************
#declare TrouG=union {
	 cylinder { <12,-5,0> <12,0.5,0>,2 }
	 cone { <12,-2.5,0>,0 <12,0.5,0>,3 }
	 box { <15,-5,1.2> <12,0.5,-1.2> }
}

#declare TrouH=union {
	 cylinder { <12,-5,0> <12,0.5,0>,2 }
	 cone { <12,-2.5,0>,0 <12,0.5,0>,3 }
	 box { <15,-5,1.2> <12,0.5,-1.2> }
	 rotate <0,90,0>
}

// *** Fait un raccord ***
// ***********************
#declare BoutD=union { 
	 box { <-14,0,-1> <-16,-4.25,1> }
	 cylinder { <-16,-4.25,0> <-16,-0.5,0>,2 }
	 cylinder { <-16,0,0> <-16,-0.5,0>,1.5 }
	 torus { 1.5,0.5 translate <-16,-0.5,0> }
}
 
#declare BoutB=union { 
	 box { <-14,0,-1> <-16,-4.25,1> }
	 cylinder { <-16,-4.25,0> <-16,-0.5,0>,2 }
	 cylinder { <-16,0,0> <-16,-0.5,0>,1.5 }
	 torus { 1.5,0.5 translate <-16,-0.5,0> }
	 rotate <0,90,0>
}

// *** Définition du verre ***
// ***************************
#declare Loco=union {
#if (Num=0) // GD
    difference {
	       union { 
		     object { OBasHaut rotate <0,90,0> }
		     object { BoutD }
		     }
	       union {
		     object { CBasHaut rotate <0,90,0> }
		     object { TrouG }
		     }
	}
	texture { Bois_SapinR rotate <-0.5,90.234,1.2> }
#end

#if (Num=1) // BD
    difference {
	       union { 
		     object { OBasDroite }
		     object { BoutD }
		     object { BoutB }
		     }
	       union {
		     object { CBasDroite }
		     }
	}
	texture { Bois_SapinR rotate <0.4,45.423,-0.7> }
#end

#if (Num=2) // BG
    difference {
	       union { 
		     object { OBasGauche }
		     object { BoutB }
		     }
	       union {
		     object { CBasGauche }
		     object { TrouG }
		     }
	}
	texture { Bois_SapinR rotate <0.24,-45.298,1.345> }
#end

#if (Num=3) // BGD
    difference {
	       union { 
		     object { OBasGauche }
		     object { OBasDroite }
		     object { OGaucheDroite }
		     object { BoutB }
		     object { BoutD }
		     }
	       union {
		     object { CBasGauche }
		     object { CBasDroite }
		     object { CGaucheDroite }
		     object { TrouG }
		     }
	}
	texture { Bois_SapinR rotate <-0.24,-94.298,0.345> }
#end

#if (Num=4) // HD
    difference {
	       union { 
		     object { OBasGauche rotate <0,180,0> }
		     object { BoutD }
		     }
	       union {
		     object { CBasGauche rotate <0,180,0> }
		     object { TrouH }
		     }
	}
	texture { Bois_SapinR rotate <-0.12,-47.298,-0.145> }
#end

#if (Num=5) // HG
    difference {
	       union { 
		     object { OBasDroite rotate <0,180,0> }
		     }
	       union {
		     object { CBasDroite rotate <0,180,0> }
		     object { TrouH }
		     object { TrouG }
		     }
	}
	texture { Bois_SapinR rotate <-0.12,43.198,-0.145> }
#end

#if (Num=6) // HGD
    difference {
	       union { 
		     object { OBasGauche rotate <0,180,0> }
		     object { OBasDroite rotate <0,180,0> }
		     object { OGaucheDroite }
		     object { BoutD }
		     }
	       union {
		     object { CBasGauche rotate <0,180,0> }
		     object { CBasDroite rotate <0,180,0> }
		     object { CGaucheDroite }
		     object { TrouG }
		     object { TrouH }
		     }
	}
	texture { Bois_SapinR rotate <-0.15,92.198,0.214> }
#end

#if (Num=7) // HB
    difference {
	       union { 
		     object { OBasHaut }
		     object { BoutB }
		     }
	       union {
		     object { CBasHaut }
		     object { TrouH }
		     }
	}
	texture { Bois_SapinR rotate <-0.5,1.034,0.3> }
#end

#if (Num=8) // HBD
    difference {
	       union { 
		     object { OBasHaut }
		     object { OBasGauche rotate <0,180,0> }
		     object { OBasDroite }
		     object { BoutB }
		     object { BoutD }
		     }
	       union {
		     object { CBasHaut }
		     object { CBasGauche rotate <0,180,0> }
		     object { CBasDroite }
		     object { TrouH }
		     }
	}
	texture { Bois_SapinR rotate <-0.3,0.034,-0.3> }
#end

#if (Num=9) // HBG
    difference {
	       union { 
		     object { OBasHaut }
		     object { OBasDroite rotate <0,180,0> }
		     object { OBasGauche }
		     object { BoutB }
		     }
	       union {
		     object { CBasHaut }
		     object { CBasDroite rotate <0,180,0> }
		     object { CBasGauche }
		     object { TrouH }
		     object { TrouG }
		     }
	}
	texture { Bois_SapinR rotate <-0.18,0.234,0.228> }
#end

#if (Num=10) // HBGD
    difference {
	       union { 
		     object { OBasHaut }
		     object { OBasDroite rotate <0,180,0> }
		     object { OBasGauche }
		     object { OBasGauche rotate <0,180,0> }
		     object { OBasDroite }
		     object { BoutB }
		     object { BoutD }
		     }
	       union {
		     object { CBasHaut }
		     object { CBasHaut rotate <0,90,0> }
		     object { CBasDroite rotate <0,180,0> }
		     object { CBasGauche }
		     object { CBasGauche rotate <0,180,0> }
		     object { CBasDroite }
		     object { TrouH }
		     object { TrouG }
		     }
	}
	texture { Bois_SapinR rotate <0.18,37.234,-0.228> }
#end

	scale <-1,1,-1>
}

// *** Définition de la scene ***
// ******************************
union { 
      object { Fond }
      object { Loco }
}