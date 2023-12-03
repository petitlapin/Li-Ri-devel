#include "colors.inc"
#include "woods.inc"
#include "finish.inc"
#include "texture_jeu.inc"

#declare M_PI = 3.141592654;

// *** Définition de la scène pour le test ***
// *******************************************
camera {
	location <-30,16,-20>
	look_at <0,2,3>
	angle 55
	right <(800/600),0,0>
}

light_source { <-180,170,30> color White*1
	fade_distance 200 fade_power 2
}
light_source { <80,90,-80> color White*0.8
	fade_distance 160
	shadowless
}
light_source { <0,3,5> color Yellow*0.5
	fade_distance 80 fade_power 2
}
light_source { <0,9.3,-6> color Red*0.25
	fade_distance 80 fade_power 2
}

// *** Fond d'ecran ***
// ********************
#declare Fond=object {
	plane { y,-6.75 }
	texture { T_Grnt19 }
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

// *** Fabrique un crochet ***
// ***************************
#declare Crochet=union {
	 torus { 1.3 0.4 }
	 cylinder { <0,0,-1.3> <0,0,-4>,0.4 }
	 texture { T_Roue }
	 translate <0,-1,2.3>
}

// *** Fabrique une pelle ***
// **************************
#declare Pelle=union {
	 cylinder { <0,0,0> <0,0,4>,0.2 texture { Bois_Jaune } }
	 cylinder { <-0.7,0,0> <0.7,0,0>,0.2 texture { Bois_Jaune } rotate  <90,0,0> }
	 box { <-1,-0.05,3.8> <1,0.05,6> texture { T_Metal } } 
	 scale <1.2,1.2,1.2>
}

// *** Définition du verre ***
// ***************************
#declare Charbon=union {
	 // Met les roues
	 object { Roue rotate <34,0,0> translate <5.01,-1,5> }
	 object { Roue rotate <0,0,0> translate <5.01,-1,-5> }
	 object { Roue rotate <120,0,0> translate <5.01,-1,5> scale <-1,1,1> }
	 object { Roue rotate <240,0,0> translate <5.01,-1,-5> scale <-1,1,1> }

	 object { Pelle rotate <40,230,3> translate <3.8,8,7> }

	 // Met le crochet
	 object { Crochet translate <0,0,9> }
	 object { Crochet translate <0,0,9> scale <1,1,-1> }

	 // Plateau de la loco
	 union {
	  	 box { <-5,-2,-9> <5,0,9> }
		  texture { Bois_Sapin }
	 }

	 // Bords du charbon
	 union {
	       box { <-5,0,-9> <-4,4,9> }
	       box { <4,0,-9> <5,4,9> }
	       texture { Bois_Rouge }
	 }
	 union { 
	       box { <-9,0,-4> <-8,4,4> }
	       box { <9,0,-4> <8,4,4> }
	       texture { Bois_Rouge }
	       rotate <0,90,0>
	 }

	 // Fait le charbon
	 difference {
		    sphere { <0,-5,0>,12 scale <1,0.7,1>  translate <0,-0.5,0> }
		    box { <-4,0,-8> <4,10,8> inverse }
		    texture { Bois_Noir }
		    normal { bumps 0.9 bump_size 0.75 scale <0.3,0.3,0.3> }
	 }
}

// *** Définition de la loco ***
// *****************************
#declare Loco=union {
	 // Met les roues
	 object { Roue rotate <34,0,0> translate <5.01,-1,6> }
	 object { Roue rotate <0,0,0> translate <5.01,-1,-7> }
	 object { Roue rotate <120,0,0> translate <5.01,-1,6> scale <-1,1,1> }
	 object { Roue rotate <240,0,0> translate <5.01,-1,-7> scale <-1,1,1> }

	 // Met le crochet
	 object { Crochet translate <0,0,10> }

	 // Plateau de la loco
	 difference {
	 	 box { <-5,-2,-13> <5,0,10> }
		 plane { z,0 rotate <35,15,0> translate <0,-2,-13> }
		 plane { z,0 rotate <35,15,0> translate <0,-2,-13> scale <-1,1,1> }
		 texture { Bois_Sapin }
	 }

	 // Chaudière
	 union { 
	 	 cylinder { <0,3.5,2> <0,3.5,-9>,3.5 }
		 difference { 
		 	sphere { <0,0,0>,4 scale <1,1,0.2> translate <0,3.5,-9> }
			cylinder { <0,3.5,0> <0,3.5,-18>,3.5 inverse }
		 } 
		 texture { Bois_Bleu }
	}
	difference {
		union {
		      box { <-3.5,0,2> <-4.5,12,9> }
		      box { <3.5,0,2> <4.5,12,9> }
		}
		cylinder { <-5,9,5.5> <5,9,5.5>,2 }
		texture { Bois_Rouge rotate <90,0,0> }
	}
	box { <-3.5,0,2> <3.5,7.5,3> texture { Bois_Rouge rotate <0,91,0> translate <2,5,-3> }}

	// Fait la toiture
	difference {
		   union {
			 box { <-2,12,1> <2,13,10> }
			 cylinder { <-2,12,1> <-2,12,10>,1 }
			 cylinder { <2,12,1> <2,12,10>,1 }
		   }
		   plane { y,12 }
		   texture { Bois_Jaune translate <1,12,1> }
		   scale <1.66,1,1>
	}
	sphere { <0,13,6>,1 texture { Bois_Rouge rotate <90,0,0> translate <0,12,-1> } }

	// Fait les réservoires sur le coté
	cylinder { <-3.7,1,-7> <-3.7,1,-3>,1 texture { Bois_Noir } }
	cylinder { <3.7,1,-7> <3.7,1,-3>,1 texture { Bois_Noir } }

	// Fait la cheminée
	union {
		difference {
			   cone { <0,0,-6>,0 <0,10,-6>,3 }
			   cone { <0,3,-6>,0 <0,10.1,-6>,2.3 }
		}
		sphere { <0,7,0>,1 }
		texture { Bois_Rouge rotate <90,0,0> translate <0,0,-6> } 
	}
	cylinder { <0,3,-6> <0,7.5,-6>,1.5 texture { Bois_Noir rotate <90,0,1> } }
}

// *** Définition du verre ***
// ***************************
#macro Rail(Num)
union {
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
	translate <0,-3,0>
}
#end

// *** Fabrique une Barrière ***
// *****************************
#declare Barriere=union {
	 difference {
		    box { <-15,0,-15> <-5,2,15> }
		    plane { y,0 rotate <0,0,15> translate <-15,0.2,0> inverse }
		    texture { Bois_Sapin }
	}
	cylinder { <-11,0,-12> <-11,6,-12>,0.5 texture { Bois_Sapin rotate <90,0,0> }}
	cylinder { <-12,8,-12> <-10,8,-12>,2 texture { Bois_Rouge rotate <90,0,0> } }

	difference {
		   box { <-8,2,-12> <-6,7,-8> }
		   box { <-7.3,3,-13> <-6.7,8,-7> }
		   texture { Bois_Sapin rotate <90,0,0> }
		   }
	box { <-7.3,5,-3> <-6.7,7,20> texture { Bois_Rouge } rotate <-12,0,0> translate <0,0,-9> }

	translate <-2,0,0>
}

#declare RoueV=union {
	 union {
	 	 torus { 3,0.75 rotate <0,0,90> translate <0.75,3.75,0> }
		 cylinder { <0,3.75,0> <1.5,3.75,0>,3 }
		 texture { Bois_Rouge }
	}
	sphere { <0,3.75,0>,2 scale <0.2,1,1> translate <1.4,0,0> texture { Bois_Jaune } }
	cylinder { <-0.5,3.75,0> <0.2,3.75,0>,0.75 texture { Bois_Vert } }
	translate <0.2,0,0>
}

#declare VoitureBleu=union {
	 difference {
		    union {
			  cylinder { <-2,5,0> <2,5,0>,5 }
			  cylinder { <-2,0,9> <2,0,9>,5 }
			  box { <-2,0,-5> <2,5,9> }
		    }
		    plane { y,0 }
	 difference {
		    cylinder { <-3,5,0> <3,5,0>,3.5 }
		    plane { y,5 }
		    }
		    texture { Bois_Bleu }
		    translate <0,2,0>
	 }
	 object { RoueV translate <2,0,-1> }
	 object { RoueV translate <2,0,-1> scale <-1,1,1> }
	 object { RoueV translate <2,0,9> }
	 object { RoueV translate <2,0,9> scale <-1,1,1> }
	 scale <1.5,1.5,1.5>
}

#declare VoitureVert=union {
	 difference {
		    union {
			  cylinder { <-2,5,0> <2,5,0>,5 }
			  cylinder { <-2,0,9> <2,0,9>,5 }
			  box { <-2,0,-5> <2,5,9> }
		    }
		    plane { y,0 }
	 difference {
		    cylinder { <-3,5,0> <3,5,0>,3.5 }
		    plane { y,5 }
		    }
		    texture { Bois_Vert }
		    translate <0,2,0>
	 }
	 object { RoueV translate <2,0,-1> }
	 object { RoueV translate <2,0,-1> scale <-1,1,1> }
	 object { RoueV translate <2,0,9> }
	 object { RoueV translate <2,0,9> scale <-1,1,1> }
	 scale <1.5,1.5,1.5>
}

// *** Fabrique un pilone ***
// **************************
#declare Pilone=union {
	 box { <-4,0,-4> <4,2,4> texture { Bois_Sapin } }
	 cylinder { <0,0,0> <0,15,0>,1 texture { Bois_Sapin rotate <90,0,0> } }
	 cylinder { <0,10,-3> <0,10,3>,0.5 texture { Bois_Sapin translate <0,10,0> } }
	 cylinder { <0,13,-3> <0,13,3>,0.5 texture { Bois_Sapin translate <0,12,0> } }
	 scale <2,2,2>
}

// *** Fabrique un arbre ***
// *************************
#declare Arbre=union {
	 cylinder { <3,5,-1> <3,5,1>,3 }
	 cylinder { <2.5,8,-1> <2.5,8,1>,2.5 }
	 cylinder { <2,10.5,-1> <2,10.5,1>,2.0 }
	 cylinder { <1.5,12.5,-1> <1.5,12.5,1>,1.5 }
	 cylinder { <1,14,-1> <1,14,1>,1.0 }
	 cylinder { <0.5,15,-1> <0.5,15,1>,0.5 }

	 cylinder { <-3,5,-1> <-3,5,1>,3 }
	 cylinder { <-2.5,8,-1> <-2.5,8,1>,2.5 }
	 cylinder { <-2,10.5,-1> <-2,10.5,1>,2.0 }
	 cylinder { <-1.5,12.5,-1> <-1.5,12.5,1>,1.5 }
	 cylinder { <-1,14,-1> <-1,14,1>,1.0 }
	 cylinder { <-0.5,15,-1> <-0.5,15,1>,0.5 }

	 cylinder { <0,15.5,-1> <0,15.5,1>,0.5 }

	 box { <-0.5,0,-1> <0.5,15.5,1> }

	 difference {
		    union {
			  cylinder { <-4,0,-1> <-4,0,1>,1 }
			  cylinder { <4,0,-1> <4,0,1>,1 }
			  box { <-4,0,-1> <4,1,1> }
		    }
		    plane { y,0 }
	  }

	 scale <2,3,2.4>
	 texture { Bois_Vert scale 2 rotate <90,0,0> }
}

// *** Définition de la scene ***
// ******************************
union { 
      object { Fond }

      object { Loco rotate <1,3,2> }
      object { Charbon rotate <3,2,1> translate <0,0,25> }
      union { 
            object { Rail(7) }
	    object { Rail(4) translate <0,0,-28.1> }
	    object { Rail(9) translate <0,0,28.1> }
	    object { Rail(7) translate <0,0,-28.1*2> }
	    translate <0,0,2>
      }
      union {
          object { Barriere }
	  object { Barriere rotate <0,180,0> }
	  box { <-15,0,9> <-11,7,14> texture { Bois_Bleu rotate <90,0,0> } }
	  difference {
		     box { <-16,7,8> <-10,10,15> }
		     plane { y,0 rotate <0,0,40> translate <-13,10,0> inverse }
		     plane { y,0 rotate <0,0,-40> translate <-13,10,0> inverse }
		     texture { Bois_Vert }
		     }
	  rotate <0,270,0> scale <-1,1,1>
	  translate <15,-6.75,100>
      }
      union {
          object { VoitureVert rotate <0,0,100> rotate <0,37,0> translate <8,6,0> }
	  object { VoitureBleu rotate <0,0,-30> rotate <0,167,0> translate <-9,4,-1> }
	  scale <0.7,0.7,0.7>
	  rotate <0,297,0>
	  translate <120,-6.75,25>
      }
    object { Pilone translate <8,0,0> rotate <0,0,100> scale 0.75 rotate <0,178,0> translate <-35,-6.75,5> }
    object { Pilone translate <8,0,0> rotate <0,41,0> scale 0.75 translate <35,-6.75,8> }

    object { Arbre rotate <0,161,0> scale 0.70 translate <40,-6.75,70> }
    object { Arbre rotate <0,261,0> scale 0.70 translate <70,-6.75,65> }
    object { Arbre rotate <0,101,0> scale 0.70 translate <80,-6.75,96> }
    object { Arbre rotate <0,181,0> scale 0.70 translate <50,-6.75,120> }
}