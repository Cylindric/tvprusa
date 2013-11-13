// PRUSA Mendel  
// Coupling
// Used for joining Z leadscrew to motor shaft
// GNU GPL v2
// Josef Průša
// josefprusa@me.com
// prusadjs.cz
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

include <configuration.scad>

/**
 * @id coupling
 * @name Coupling
 * @category Printed
 * @using 4 m3x20
 * @using 4 m3washer
 * @using 4 m3nut
 * @step Place M3 nuts in all nut traps.
 * @step Insert screws with washers on them and tighet it just a bit.
 */

/**
 * 20mm long piece of PVC tube. 5mm inside diameter, 8mm outside diameter.
 * @id coupling-tube
 * @name Coupling tube
 * @category Nuts&bolts
 */

coupling();

holeX = 7.5;
holeY = 6.5;

corner_cut = 26;

shaft_dia = 8.0;

module coupling()
{
	union()
	{
		difference()
		{
			cube( size = [30, 25, 8], center = true );

				//slot
				*cube(size = [2, 40, 30], center = true);
                
			//nut holes
			translate( [holeX, -holeY, m3_nut_thickness / 2 - 4.01 - 3 / 2] ) nut( m3_nut_diameter, m3_nut_thickness );
			translate( [-holeX,  holeY, m3_nut_thickness / 2 - 4.01 - 3 / 2] ) nut( m3_nut_diameter, m3_nut_thickness );

			//shaft groves
			translate( [-16, 0, 4.5] ) rotate( [0, 90, 0] ) cylinder( h = 16, r = threaded_rod_diameter / 2, $fn = 16 );
			translate( [-0.5, 0, 4.5] ) rotate( [0, 90, 0] ) cylinder( h = 16, r = shaft_dia / 2,  $fn = 16 );

			//screw holes
			translate( [holeX,  holeY, -10] ) polyhole( m3_diameter, 20 );
			translate( [holeX, -holeY, -10] ) polyhole( m3_diameter, 20 );
			translate( [-holeX,  holeY, -10] ) polyhole( m3_diameter, 20 );
			translate( [-holeX, -holeY, -10] ) polyhole( m3_diameter, 20 );

			//corners
			rotate( [0, 0, 30] ) translate( [corner_cut, 0, 0] ) cube( size = [20, 40, 20], center = true );
			rotate( [0, 0, -30] ) translate( [corner_cut, 0, 0] ) cube( size = [20, 40, 20], center = true );
			rotate( [0, 0, 150] )  translate( [corner_cut, 0, 0] ) cube( size = [20, 40, 20], center = true );
			rotate( [0, 0, -150] ) translate( [corner_cut, 0, 0] ) cube( size = [20,40,20], center = true );
		}

		 // bridge
		translate( [holeX, -holeY, m3_nut_thickness - 3.9] ) cylinder( h = 0.4, r = m3_nut_diameter / 2 + 0.1, $fn = 6, center = true );
		translate( [-holeX,  holeY, m3_nut_thickness - 3.9] ) cylinder( h = 0.4, r = m3_nut_diameter / 2 + 0.1, $fn =6, center = true );
	}
}
