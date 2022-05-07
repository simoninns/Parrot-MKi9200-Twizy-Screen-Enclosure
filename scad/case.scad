/************************************************************************

    case.scad
    
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

module screen_cutout()
{
    move([0,-7,32.5]) cuboid([49 + 4,4,37 + 4], chamfer=0);
    move([0,-9.25,32.5]) cuboid([49 + 6,4,37 + 6], chamfer=1); // Screen
}

module car_mount()
{
    move([-11,6,-3]) {
        move([-24,2,0]) rotate([0,0,55]) cuboid([50,3,32], center=false, chamfer=1); // Car side mount
        move([-2.5,38,0]) rotate([0,0,-55]) cuboid([44,3,10], center=false, chamfer=1); // Strength
    }
}

module lower_case()
{
    move([0,0,0]) {
        difference() {
            union() {
                move([0,1.5,18-3]) cuboid([75,19,36], chamfer=1, edges=EDGES_Z_ALL+EDGES_X_BOT+EDGES_Y_BOT);
                move([0,10.5,15]) cuboid([27 + 4,4,36], chamfer=1, edges=EDGES_Z_ALL+EDGES_X_BOT+EDGES_Y_BOT);
                car_mount();
            }
            move([0,1.5 - 1.5,18 - 0 ]) cuboid([75 - 3,19 - 6,36], chamfer=1, edges=EDGES_Z_ALL+EDGES_X_BOT+EDGES_Y_BOT);
            move([0,6.5,18]) cuboid([32,4,36]); // Bracket clearance
            move([0,9.5,18]) cuboid([27,4,36]); // Bracket clearance

            move([0,8,22 + 28.5]) cuboid([6,8,36], chamfer=0); // Cable exit
            move([0,15.5,23 + 27]) cuboid([8,8,36], chamfer=1); // Cable exit chamfer

            screen_cutout();

            // Clips
            move([27,7.24,30.5]) cuboid([10,1.5,8]);
            move([27,7.5,27]) cuboid([10.5,2.5,2.5], chamfer=0.5, edges=EDGES_Z_ALL+EDGES_Y_TOP+EDGES_Y_BOT+EDGES_X_BOT+EDGES_X_TOP);
            
            move([-27,7.24,30.5]) cuboid([10,1.5,8]);
            move([-27,7.5,27]) cuboid([10.5,2.5,2.5], chamfer=0.5, edges=EDGES_Z_ALL+EDGES_Y_TOP+EDGES_Y_BOT+EDGES_X_BOT+EDGES_X_TOP);
        }
    }
}

module upper_case()
{
    move([0,0,0]) {
        difference() {
            union() {
                move([0,1.5,46.5]) cuboid([75,19,27], chamfer=1, edges=EDGES_Z_ALL+EDGES_X_TOP+EDGES_Y_TOP);
                move([0,10.5,38]) cuboid([27 + 4,4,10], chamfer=1, edges=EDGES_Z_ALL+EDGES_X_TOP);

                // Add extra overhang to remove need for a support when printing
                move([0,10,42.5]) cuboid([27 + 4,3,3], chamfer=1, edges=EDGES_X_TOP);
            }
            move([0,1.5 - 1.5,42 - 2]) cuboid([75 - 3,19 - 6,36], chamfer=1, edges=EDGES_Z_ALL+EDGES_X_BOT+EDGES_Y_BOT);
            move([0,6.5,22]) cuboid([32,4,36]); // Bracket clearance
            move([0,9.5,18.5]) cuboid([27,4,36]); // Bracket clearance

            move([0,8,22]) cuboid([6,8,36], chamfer=0); // Cable exit
            move([0,15.5,23]) cuboid([8,8,36], chamfer=1); // Cable exit chamfer

            screen_cutout();
        }

        // Clips
        move([27,7.25,29.5]) cuboid([10,1.5,7], chamfer=0.5, edges=EDGES_Z_ALL+EDGES_Y_BOT);
        move([27,7.75,27]) cuboid([10,2,2], chamfer=0.5, edges=EDGES_Z_ALL+EDGES_Y_TOP+EDGES_Y_BOT+EDGES_X_BOT+EDGES_X_TOP);
        
        move([-27,7.25,29.5]) cuboid([10,1.5,7], chamfer=0.5, edges=EDGES_Z_ALL);
        move([-27,7.75,27]) cuboid([10,2,2], chamfer=0.5, edges=EDGES_Z_ALL+EDGES_Y_TOP+EDGES_Y_BOT+EDGES_X_BOT+EDGES_X_TOP);
    }
}

module render_lower_case(toPrint)
{
    if (toPrint) {
        move([0,0,3]) lower_case();
    } else {
        lower_case();
    }
}

module render_upper_case(toPrint)
{
    if (toPrint) {
        move([0,-30,60]) xrot(180) upper_case();
    } else {
        move([0,0,0.25]) upper_case();
    }
}