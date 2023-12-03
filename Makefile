#      (_||_/       
#      (    )       MakeFile pour MakeDat
#     ( O  0 )      
#-Ooo°--(_)---°Ooo---------------------------------------
#                   Copyright (C) 2006 By Dominique Roux-Serret @2006
# .Oooo      Oooo.  roux-serret@ifrance.com
#-(   )------(   )---------------------------------------
#  ( (        ) /   Le 03/01/2006
#   (_)      (_/

#    This program is free software; you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation; either version 2 or version 3 of the License.

#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.

#    You should have received a copy of the GNU General Public License along
#    with this program; if not, write to the Free Software Foundation, Inc.,
#    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

CC=c++
LINKER=c++
AR=ar	
DEBUGOPT= -DLINUX
COPTS=-O3 -Wall -Wno-switch -Wno-deprecated -ffast-math -I/usr/X11R6/include -I/usr/include $(DEBUGOPT) `sdl-config --cflags`
LINKOPTS=-L/usr/lib `sdl-config --libs` -lSDL_image

TARGET=MakeDat

OBJECT = main.o sprite.o

# Type de suffix
.SUFFIXES: .cc

.cc.o: 
	$(CC) -c $(COPTS) -o $@ $<

# Compile
all: $(TARGET)

$(TARGET): $(OBJECT)
	$(LINKER) $(COPTS) $^ -o $@ $(LINKOPTS) -I./

$(CODE): $(OBJECTCODE)
	$(LINKER) $(COPTS) $^ -o $@ $(LINKOPTS) -I./

utils.o: utils.cc utils.h

sprite.o : sprite.h sprite.cc

main.o : main.cc sprite.o

clean:
	rm -f *~ *.o core

dep:
	rm -f *~ *.o core $(TARGET)
