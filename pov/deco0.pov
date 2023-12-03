#include "colors.inc"
#include "woods.inc"
#include "finish.inc"
#include "texture_jeu.inc"

#declare M_PI = 3.141592654;

#declare Avance=clock;
#declare Num=int(clock);
//#declare Num=20;

// *** Définition de la scène pour le test ***
// *******************************************
camera {
	location <0,250,0>
//	location <80,89,-78>
	look_at <0,0,0>
	angle 15.5
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
	plane { y,-0 }
	texture { T_Fond }
}

// *** Fabrique une flèchette ***
// ******************************
#declare Cube=union {
	 sphere { <-4,4,-4>,1 }
	 sphere { <-4,4,4>,1 }
	 sphere { <4,4,-4>,1 }
	 sphere { <4,4,4>,1 }
	 sphere { <-4,-4,-4>,1 }
	 sphere { <-4,-4,4>,1 }
	 sphere { <4,-4,-4>,1 }
	 sphere { <4,-4,4>,1 }

	 cylinder { <-4,4,-4> <-4,4,4>,1 }
	 cylinder { <4,4,-4> <4,4,4>,1 }
	 cylinder { <-4,4,-4> <4,4,-4>,1 }
	 cylinder { <-4,4,4> <4,4,4>,1 }

	 cylinder { <-4,-4,-4> <-4,-4,4>,1 }
	 cylinder { <4,-4,-4> <4,-4,4>,1 }
	 cylinder { <-4,-4,-4> <4,-4,-4>,1 }
	 cylinder { <-4,-4,4> <4,-4,4>,1 }

	 cylinder { <-4,-4,-4> <-4,4,-4>,1 }
	 cylinder { <4,-4,-4> <4,4,-4>,1 }
	 cylinder { <-4,-4,4> <-4,4,4>,1 }
	 cylinder { <4,-4,4> <4,4,4>,1 }

	 box { <-5,-4,-4> <5,4,4> }
	 box { <-4,-5,-4> <4,5,4> }
	 box { <-4,-4,-5> <4,4,5> }
}

#declare LettreA=union {
	 sphere { <0,0,0>,0.7 }
	 cylinder { <0,0,0> <0,0,-6>,0.7 rotate <0,30,0> }
	 cylinder { <0,0,0> <0,0,-6>,0.7 rotate <0,-30,0> } 
	 sphere { <0,0,-6>,0.7 rotate <0,-30,0> }
	 sphere { <0,0,-6>,0.7 rotate <0,30,0> }
	 cylinder { <-2.2,0,-3.5> <2.2,0,-3.5>,0.7 }
	 scale <1,0.3,1>
}

#declare LettreB=union {
	 sphere { <-1.5,0,-3>,0.7 }
	 sphere { <-1.5,0,3>,0.7 }
	 cylinder { <-1.5,0,-3> <-1.5,0,3>,0.7 }

	 difference {
		    union {
			  torus { 1.5,0.7 translate <0,0,1.5> }
			  torus { 1.5,0.7 translate <0,0,-1.5> }
		    }
		    plane { x,0 }
	 }

	 cylinder { <-1.5,0,0> <0.1,0,0>,0.7 }
	 cylinder { <-1.5,0,3> <0.1,0,3>,0.7 }
	 cylinder { <-1.5,0,-3> <0.1,0,-3>,0.7 }
	 scale <1,0.3,1>
}

#declare LettreC=union {
	 sphere { <1,0,2.5>,1 }
	 sphere { <1,0,-2.5>,1 }
	 difference {
		    torus { 2.5,1 }
		    plane { x,0 inverse }
	 }
	 cylinder { <-0.1,0,2.5> <1,0,2.5>,1 }
	 cylinder { <-0.1,0,-2.5> <1,0,-2.5>,1 }
	 scale <1,0.3,1>
}

#declare LettreD=union {
	 sphere { <-1.5,0,-2.5>,1 }
	  sphere { <-1.5,0,2.5>,1 }
	 cylinder { <-1.5,0,-2.5> <-1.5,0,2.5>,1 }

	 difference {
		    torus { 2.5,1 }
		    plane { x,0 }
	 }

	 cylinder { <-1.5,0,2.5> <0.1,0,2.5>,1 }
	 cylinder { <-1.5,0,-2.5> <0.1,0,-2.5>,1 }
	 scale <1,0.3,1>
}

#declare Cube_Rouge=difference {
	 object { Cube texture { Bois_Rouge scale <1.5,1.5,1.5> } translate <0,5,0> }
	 object { LettreA texture { Bois_Jaune } translate <0,10,2.7> }
	 scale <2.5,2.5,2.5>
}

#declare Cube_Vert=difference {
	 object { Cube texture { Bois_Vert scale <1.5,1.5,1.5> } translate <0,5,0> }
	 object { LettreB texture { Bois_Rouge } translate <0,10,0> }
	 scale <2.5,2.5,2.5>
}

#declare Cube_Bleu=difference {
	 object { Cube texture { Bois_Bleu scale <1.5,1.5,1.5> } translate <0,5,0> }
	 object { LettreC texture { Bois_Rouge } translate <0.5,10,0> }
	 scale <2.5,2.5,2.5>
}

#declare Cube_Jaune=difference {
	 object { Cube texture { Bois_Jaune scale <1.5,1.5,1.5> } translate <0,5,0> }
	 object { LettreD texture { Bois_Bleu } translate <-0.25,10,0> }
	 scale <2.5,2.5,2.5>
	 translate <-3,0,2>
}

#declare Cube_Rougeb=difference {
	 object { Cube texture { Bois_Rouge scale <1.5,1.5,1.5> } translate <0,5,0> }
	 object { LettreC texture { Bois_Vert } translate <0.5,10,0> }
	 scale <2.5,2.5,2.5>
}

#declare Cube_Vertb=difference {
	 object { Cube texture { Bois_Vert scale <1.5,1.5,1.5> } translate <0,5,0> }
	 object { LettreD texture { Bois_Bleu } translate <-0.25,10,0> }
	 scale <2.5,2.5,2.5>
}

#declare Cube_Bleub=difference {
	 object { Cube texture { Bois_Bleu scale <1.5,1.5,1.5> } translate <0,5,0> }
	 object { LettreB texture { Bois_Jaune } translate <0,10,0> }
	 scale <2.5,2.5,2.5>
}

#declare Cube_Jauneb=difference {
	 object { Cube texture { Bois_Jaune scale <1.5,1.5,1.5> } translate <0,5,0> }
	 object { LettreA texture { Bois_Rouge } translate <0,10,2.7> }
	 object { LettreB texture { Bois_Rouge } rotate <0,0,-90> translate <5,5,0> }
	 scale <2.5,2.5,2.5>
	 translate <-3,0,2>
}

// *** Fabrique une voiture ***
// ****************************
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

// *** Fabrique une gare ***
// *************************
#declare Gare=union {
	 difference {
		    box { <-15,0,-15> <5,2,15> }
		    plane { y,0 rotate <0,0,15> translate <-15,0.2,0> inverse }
		    texture { Bois_Sapin }
	}

	box { <-6,2,-4> <2,12,4> texture { Bois_Vert rotate <-90,0,0> }}
	box { <-5,2,-14> <2,8,-4> texture { Bois_Vert } }
	box { <-5,2,14> <2,8,4> texture { Bois_Vert } }

	difference {
		   box { <-5.5,8,-14.5> <2.5,10,14.5> }
		   plane { y,0 rotate <0,0,23> translate <-1.5,10,0> inverse }
		   plane { y,0 rotate <0,0,-23> translate <-1.5,10,0> inverse }
		   texture { Bois_Rouge }
	}

	difference {
		   box { <-6.5,12,-4.5> <2.5,14,4.5> }
		   plane { y,0 rotate <0,0,20> translate <-2,14,0> inverse }
		   plane { y,0 rotate <20,0,0> translate <-2,14,0> inverse }
		   plane { y,0 rotate <0,0,-20> translate <-2,14,0> inverse }
		   plane { y,0 rotate <-20,0,0> translate <-2,14,0> inverse }
		   texture { Bois_Rouge }
	}

	difference {
		   box { <-12.5,8,-4> <-6.5,10,4> }
		   plane { y,0 rotate <22,0,0> translate <0,10,0> inverse }
		   plane { y,0 rotate <-22,0,0> translate <0,10,0> inverse }
		   texture { Bois_Rouge rotate <0,90,0> }
	}

	cylinder { <-11.5,0,3> <-11.5,8,3>,0.5 texture { Bois_Bleu rotate <90,0,0> } } 
	cylinder { <-11.5,0,-3> <-11.5,8,-3>,0.5 texture { Bois_Bleu rotate <90,0,0> } } 

	cylinder { <4,2,3> <4,6,3>,0.5 texture { Bois_Jaune rotate <90,0,0> } } 
	cylinder { <4,2,-3> <4,6,-3>,0.5 texture { Bois_Jaune rotate <90,0,0> } } 
	cylinder { <4,2,13> <4,6,13>,0.5 texture { Bois_Jaune rotate <90,0,0> } } 
	cylinder { <4,2,-13> <4,6,-13>,0.5 texture { Bois_Jaune rotate <90,0,0> } } 
	box { <2,6,-14> <5,7,14> texture { Bois_Bleu } }

	scale <1.5,1.5,1.5>
}

// *** Définition de la scene ***
// ******************************
union { 
      object { Fond }

#if (Num=0)
    object { Cube_Rouge rotate <0,-13,0> }
#end

#if (Num=1)
    object { Cube_Vert rotate <0,8,0> }
#end

#if (Num=2)
    object { Cube_Bleu rotate <0,-38,0> }
#end

#if (Num=3)
    object { Cube_Jaune rotate <0,34,0> }
#end

#if (Num=4)
    object { Cube_Rougeb rotate <0,34,0> }
#end

#if (Num=5)
    object { Cube_Vertb rotate <0,63,0> }
#end

#if (Num=6)
    object { Cube_Bleub rotate <0,-38,0> }
#end

#if (Num=7)
    object { Cube_Jauneb rotate <0,3,0> }
#end

#if (Num=8)
    object { Cube_Jauneb rotate <0,0,34> rotate <0,10,0> translate <18,5,8.5> }
    object { Cube_Bleub rotate <0,-40,0> translate <-13,0,-8> }
#end

#if (Num=9)
    object { VoitureBleu rotate <0,33,0> }
#end

#if (Num=10)
    object { VoitureVert rotate <0,-97,0> translate <8,0,0> }
#end

#if (Num=11)
    object { VoitureVert rotate <0,0,100> rotate <0,37,0> translate <8,6,0> }
    object { VoitureBleu rotate <0,0,-30> rotate <0,167,0> translate <-9,4,-1> }
#end

#if (Num=12)
    object { Pilone }
#end

#if (Num=13)
    object { Pilone rotate <0,90,0> }
#end

#if (Num=14)
    object { Pilone translate <8,0,0> rotate <0,0,100> translate <14,0,0> rotate <0,138,0> }
#end

#if (Num=15)
    object { Arbre rotate <0,98,0> }
#end

#if (Num=16)
    object { Arbre rotate <0,184,0> }
#end

#if (Num=17)
    object { Arbre rotate <90,0,0> translate <0,2,-19> rotate <0,21,0> }
#end

#if (Num=18)
    object { Barriere }
    object { Barriere rotate <0,180,0> }
    box { <-15,0,9> <-11,7,14> texture { Bois_Bleu rotate <90,0,0> } }
    difference {
        box { <-16,7,8> <-10,10,15> }
	plane { y,0 rotate <0,0,40> translate <-13,10,0> inverse }
	plane { y,0 rotate <0,0,-40> translate <-13,10,0> inverse }
	texture { Bois_Vert }
    }
    scale <1.9,1.9,1.9>
#end

#if (Num=19)
    object { Barriere }
    object { Barriere rotate <0,180,0> }
    box { <-15,0,9> <-11,7,14> texture { Bois_Bleu rotate <90,0,0> } }
    difference {
        box { <-16,7,8> <-10,10,15> }
	plane { y,0 rotate <0,0,40> translate <-13,10,0> inverse }
	plane { y,0 rotate <0,0,-40> translate <-13,10,0> inverse }
	texture { Bois_Vert }
    }
    scale <1.9,1.9,1.9>
    rotate <0,90,0> scale <-1,1,1>
#end

#if (Num=20)
    object { Gare }
#end

#if (Num=21)
    object { Gare rotate <0,90,0> }
#end

#if (Num=22)
    object { Gare rotate <0,180,0> }
#end

#if (Num=23)
    object { Gare rotate <0,270,0> }
#end

}