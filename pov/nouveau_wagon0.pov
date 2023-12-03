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

// *** Fait le halo ***
// ********************
#declare Halo =
media {
	emission 0.03
	intervals 1
	samples 5
	method 3
	density {
		spherical
		ramp_wave
		turbulence 0.3
		color_map {
			[0.0 color rgb <0, 0, 0>]
			[0.1 color rgb <1, 0.1, 0>]
			[1.0 color rgb <1, 1, 0>]
		}
	}
}

// *** Fond d'ecran ***
// ********************
#declare Fond=object {
	plane { y,-4.25 }
	texture { T_Fond }
	hollow
}

// *** Définition du verre ***
// ***************************
#declare Loco=union {
	  sphere { <0,0,0>,(15-sin(Avance*M_PI/2)*15)
		 pigment { rgbt <1,1,1,0.9> }
		 finish {
			ambient 0.0
			diffuse 0.0
			phong 1.0
			phong_size 200
		 }
		 interior { ior 1.1 }
		 hollow no //yes
	  } 

	  sphere {< 0, 0, 0>, 1
		 pigment { color rgbf <1, 1, 1, 1> }
		 finish { ambient 0 diffuse 0 }
		 interior { media { Halo } }
		 scale 21-Avance*20
		 hollow
	  }
	  
}

// *** Définition de la scene ***
// ******************************
union { 
//      object { Fond }

      object { Loco rotate <Avance*156,Avance*32,Avance*92> }
}