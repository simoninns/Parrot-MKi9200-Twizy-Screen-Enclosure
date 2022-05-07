/************************************************************************

    screen.scad
    
    Parrot MKi9200 Twizy Screen Enclosure
    Copyright (C) 2022 Simon Inns
    
    This is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.
    
    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.
    
    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
	
    Email: simon.inns@gmail.com
    
************************************************************************/

include <BOSL/constants.scad>
use <BOSL/transforms.scad>
use <BOSL/shapes.scad>

module screen()
{
    difference() {
        hull() {
            // Case front
            move([0,-3,0]) hull() {
                move([(72/2) - 2,0,(57/2) - 2]) xrot(90) cyl(h=6, d=4, chamfer2=0.5, chamfer1=0.5);
                move([-(72/2) + 2,0,(57/2) - 2]) xrot(90) cyl(h=6, d=4, chamfer2=0.5, chamfer1=0.5);

                move([(72/2) - 7,0,-(57/2) + 7]) xrot(90) cyl(h=6, d=14, chamfer2=0.5, chamfer1=0.5);
                move([-(72/2) + 7,0,-(57/2) + 7]) xrot(90) cyl(h=6, d=14, chamfer2=0.5, chamfer1=0.5);
            }

            // Case back
            move([0,3,-3]) cuboid([72/2,6,57 - 6]);
        }

        // Emboss screen location
        move([0,-6.1,10 - 6]) cuboid([50,2,37], chamfer=0.5);
    }
}

module bracket()
{
    move([0,7,-16]) {
        move([0,0,5]) cuboid([27,2,35]);
        move([0,-2,-10.5]) cuboid([22,2,4]);
        move([0,-2 - 2,-10.5]) cuboid([30,2,4]);
    }
}

module render_screen(toPrint)
{
    color([0.4,0.4,0.4]) move([0,0,28.5]) {
        screen();
        bracket();
    }
}