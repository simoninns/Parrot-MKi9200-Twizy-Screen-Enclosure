/************************************************************************

    main.scad
    
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

// Local includes
include <screen.scad>
include <case.scad>

// Rendering resolution
$fn=50;

// Select rendering parameters
display = "Assembled"; // [Assembled, Printing]

// Select what to render:
display_screen = "No"; // [Yes, No]
display_lower_case = "No"; // [Yes, No]
display_upper_case = "No"; // [Yes, No]

// Render the required items
module main()
{
    toPrint = (display == "Printing") ? true:false;

    // Display selections
    d_screen = (display_screen == "Yes") ? true:false;
    d_lower_case = (display_lower_case == "Yes") ? true:false;
    d_upper_case = (display_upper_case == "Yes") ? true:false;

    if (d_screen && (toPrint == false)) render_screen();
    if (d_lower_case) render_lower_case(toPrint);
    if (d_upper_case) render_upper_case(toPrint);
}

main();
