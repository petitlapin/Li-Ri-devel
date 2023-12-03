#include "colors.inc"
#include "woods.inc"
#include "finish.inc"
#include "textures.inc"
#include "metals.inc"
#include "stones.inc"

// *** Définition des couleurs de bois ***
// ***************************************
#declare M_BSapinA = 
color_map { 
    [0.0, 0.1 color rgb <0.60, 0.35, 0.20>
              color rgb <0.60, 0.35, 0.20>]
    [0.1, 0.9 color rgb <0.60, 0.35, 0.20>
              color rgb <0.90, 0.65, 0.30>]
    [0.9, 1.0 color rgb <0.90, 0.65, 0.30>
              color rgb <0.60, 0.35, 0.20>]
}
#declare M_BSapinB = 
color_map { 
    [0.0, 0.4 color rgbt <1.00, 1.00, 1.00, 1.00>
              color rgbt <0.90, 0.65, 0.30, 0.30>]
    [0.4, 0.5 color rgbt <0.90, 0.65, 0.30, 0.00>
              color rgbt <0.90, 0.65, 0.30, 0.30>]
    [0.5, 1.0 color rgbt <0.90, 0.65, 0.30, 0.30>
              color rgbt <1.00, 1.00, 1.00, 1.00> ] 
}

#declare M_BJauneA = 
color_map { 
    [0.0, 0.1 color rgb <0.60, 0.60, 0.0>
              color rgb <0.60, 0.60, 0.0>]
    [0.1, 0.9 color rgb <0.60, 0.60, 0.0>
              color rgb <0.90, 0.90, 0.10>]
    [0.9, 1.0 color rgb <0.90, 0.90, 0.10>
              color rgb <0.60, 0.60, 0.0>]
}
#declare M_BJauneB = 
color_map { 
    [0.0, 0.4 color rgbt <1.00, 1.00, 1.00, 1.00>
              color rgbt <0.90, 0.90, 0.15, 0.30>]
    [0.4, 0.5 color rgbt <0.90, 0.90, 0.15, 0.00>
              color rgbt <0.90, 0.90, 0.15, 0.30>]
    [0.5, 1.0 color rgbt <0.90, 0.90, 0.15, 0.30>
              color rgbt <1.00, 1.00, 1.00, 1.00> ] 
}

#declare M_BRougeA = 
color_map { 
    [0.0, 0.1 color rgb <0.60, 0.0, 0.0>
              color rgb <0.60, 0.0, 0.0>]
    [0.1, 0.9 color rgb <0.60, 0.0, 0.0>
              color rgb <0.90, 0.15, 0.10>]
    [0.9, 1.0 color rgb <0.90, 0.15, 0.10>
              color rgb <0.60, 0.0, 0.0>]
}
#declare M_BRougeB = 
color_map { 
    [0.0, 0.4 color rgbt <1.00, 1.00, 1.00, 1.00>
              color rgbt <0.90, 0.15, 0.0, 0.30>]
    [0.4, 0.5 color rgbt <0.90, 0.15, 0.0, 0.00>
              color rgbt <0.90, 0.15, 0.0, 0.30>]
    [0.5, 1.0 color rgbt <0.90, 0.15, 0.0, 0.30>
              color rgbt <1.00, 1.00, 1.00, 1.00> ] 
}

#declare M_BBleuA = 
color_map { 
    [0.0, 0.1 color rgb <0.0, 0.0, 0.50>
              color rgb <0.0, 0.0, 0.60>]
    [0.1, 0.9 color rgb <0.0, 0.0, 0.60>
              color rgb <0.10, 0.15, 0.90>]
    [0.9, 1.0 color rgb <0.10, 0.15, 0.90>
              color rgb <0.0, 0.0, 0.60>]
}
#declare M_BBleuB = 
color_map { 
    [0.0, 0.4 color rgbt <1.00, 1.00, 1.00, 1.00>
              color rgbt <0.0, 0.15, 0.90, 0.30>]
    [0.4, 0.5 color rgbt <0.0, 0.15, 0.90, 0.00>
              color rgbt <0.0, 0.15, 0.90, 0.30>]
    [0.5, 1.0 color rgbt <0.0, 0.15, 0.90, 0.30>
              color rgbt <1.00, 1.00, 1.00, 1.00> ] 
}

#declare M_BVertA = 
color_map { 
    [0.0, 0.1 color rgb <0.0, 0.50, 0.0>
              color rgb <0.0, 0.60, 0.0>]
    [0.1, 0.9 color rgb <0.0, 0.60, 0.0>
              color rgb <0.10, 0.90, 0.15>]
    [0.9, 1.0 color rgb <0.10, 0.90, 0.15>
              color rgb <0.0, 0.6, 0.0>]
}
#declare M_BVertB = 
color_map { 
    [0.0, 0.4 color rgbt <1.00, 1.00, 1.00, 1.00>
              color rgbt <0.0, 0.90, 0.15, 0.30>]
    [0.4, 0.5 color rgbt <0.0, 0.90, 0.15, 0.00>
              color rgbt <0.0, 0.90, 0.15, 0.30>]
    [0.5, 1.0 color rgbt <0.0, 0.90, 0.15, 0.30>
              color rgbt <1.00, 1.00, 1.00, 1.00> ] 
}

#declare M_BNoirA = 
color_map { 
    [0.0, 0.1 color rgb <0.0, 0.0, 0.0>
              color rgb <0.10, 0.10, 0.10>]
    [0.1, 0.9 color rgb <0.10, 0.10, 0.10>
              color rgb <0.15, 0.15, 0.15>]
    [0.9, 1.0 color rgb <0.10, 0.10, 0.10>
              color rgb <0.0, 0.0, 0.0>]
}
#declare M_BNoirB = 
color_map { 
    [0.0, 0.4 color rgbt <0.8, 0.8, 0.8, 1.00>
              color rgbt <0.0, 0.0, 0.0, 0.30>]
    [0.4, 0.5 color rgbt <0.0, 0.0, 0.0, 0.00>
              color rgbt <0.0, 0.0, 0.0, 0.30>]
    [0.5, 1.0 color rgbt <0.0, 0.0, 0.0, 0.30>
              color rgbt <0.8, 0.8, 0.8, 1.00> ] 
}

// *** Texture d'une roue ***
// **************************
#declare T_Roue = texture {
  pigment {
    color rgb<0.8,0.6,0.6>  }
  finish {
    specular 0.5
    reflection 0.3
    ambient 0.4
    metallic
  }
}


// *** Texture blanc et noir ***
// *****************************
#declare T_Blanc = texture {
  pigment {
    color White
  }
  finish {
    specular 0.7
    reflection 0.15
  }
}

#declare T_Jaune = texture {
  pigment {
    color Yellow
  }
  finish {
    specular 0.7
    reflection 0.15
  }
}
#declare T_Bleu = texture {
  pigment {
    color Blue
  }
  finish {
    specular 0.7
    reflection 0.15
  }
}

#declare T_Rouge = texture {
  pigment {
    color Red
  }
  finish {
    specular 0.7
    reflection 0.15
  }
}

#declare T_Noir = texture {
  pigment {
    color Black
  }
  finish {
    specular 0.8
    reflection 0.2
  }
}

// *** Texture du Fond ***
// ***********************
#declare T_Fond = texture {
  pigment {
    color rgbf<0.5,0.5,0.5,0.5>
    //    color rgb <1,1,1>
  }
  finish {
    //    diffuse 0
    specular 0.0
    reflection 0.0
    //    ambient 0.7
  }
}

// *** Texture de métal ***
// ************************
#declare T_Metal = texture {
	T_Silver_4B
}

// *** Texture des bois ***
// ************************
#declare TB_Sapin =
    texture {  pigment{ P_WoodGrain13A color_map { M_BSapinA }} rotate <5,4,3> scale 16 translate <-8,7,0> }
    texture {  pigment{ P_WoodGrain13B color_map { M_BSapinB }} rotate <5,4,3> scale 16 translate <-8,7,0> }

#declare TB_Jaune =
    texture {  pigment{ P_WoodGrain13A color_map { M_BJauneA }} rotate <5,4,3> scale 16 translate <-8,7,0> }
    texture {  pigment{ P_WoodGrain13B color_map { M_BJauneB }} rotate <5,4,3> scale 16 translate <-8,7,0> }

#declare TB_Rouge =
    texture {  pigment{ P_WoodGrain13A color_map { M_BRougeA }} rotate <5,4,3> scale 16 translate <-8,7,0> }
    texture {  pigment{ P_WoodGrain13B color_map { M_BRougeB }} rotate <5,4,3> scale 16 translate <-8,7,0> }

#declare TB_Bleu =
    texture {  pigment{ P_WoodGrain13A color_map { M_BBleuA }} rotate <5,4,3> scale 16 translate <-8,7,0> }
    texture {  pigment{ P_WoodGrain13B color_map { M_BBleuB }} rotate <5,4,3> scale 16 translate <-8,7,0> }

#declare TB_Vert =
    texture {  pigment{ P_WoodGrain13A color_map { M_BVertA }} rotate <5,4,3> scale 16 translate <-8,7,0> }
    texture {  pigment{ P_WoodGrain13B color_map { M_BVertB }} rotate <5,4,3> scale 16 translate <-8,7,0> }

#declare TB_Noir =
    texture {  pigment{ P_WoodGrain13A color_map { M_BNoirA }} rotate <5,4,3> scale 16 translate <-8,7,0> }
    texture {  pigment{ P_WoodGrain13B color_map { M_BNoirB }} rotate <5,4,3> scale 16 translate <-8,7,0> }

#declare Bois_Sapin = texture { TB_Sapin
  finish {
    specular 0.5
    reflection 0.1
  }
}

#declare Bois_SapinR = texture { TB_Sapin
  finish {
    specular 0.4
    reflection 0.05
  }
  scale <4.5,4.5,4.5>
}

#declare Bois_Bleu = texture { TB_Bleu
  finish {
    specular 0.6
    reflection 0.1
  }
}

#declare Bois_Rouge = texture { TB_Rouge
  finish {
    specular 0.5
    reflection 0.1
  }
}

#declare Bois_Jaune = texture { TB_Jaune
  finish {
    specular 0.5
    reflection 0.1
  }
}

#declare Bois_Vert = texture { TB_Vert
  finish {
    specular 0.5
    reflection 0.1
  }
}

#declare Bois_Noir = texture { TB_Noir
  finish {
    specular 0.8
    reflection 0.1
  }
}
