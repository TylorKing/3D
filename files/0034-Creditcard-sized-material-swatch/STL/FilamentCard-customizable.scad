// ****************************************************************************
// ****************************************************************************
// ****************************************************************************
// Github: https://github.com/TylorKing/
// Thingiverse: https://www.thingiverse.com/lauraevans/about
// licence: CC BY-NC 4.0 (https://creativecommons.org/licenses/by-nc/4.0/)
//
// Version: 1.0.0.2 (edited by staead)
// Date: 2023-12-15
// How to use:
// Download pFillamentCard-1-blank.stl and change the InputPath to full file path. For example:
// C:/folder/subfolder/pFillamentCard-1-blank.stl
// ****************************************************************************
// ****************************************************************************
// ****************************************************************************



// Input file (adjust):
// You can use absolute path: C:/folder/subfolder/pFillamentCard-1-blank.stl
// Or if the stl file is in the same folder as scad file: pFillamentCard-1-blank.stl
InputPath = "pFillamentCard-1-blank.stl";


// Units are in mm (Millimetre)!!

// Parameters
TextSize = 3.7;
TextDepht = 0.5;  // values bigger that one, creates a text hole
                  //(for >1 the inner parts of letters will float -> fall out)
TextTopSpacing = 3;
TextSideSpacing = 3;
RowSpacing = 2.5;

// Text
ID = "42";
Material = "PLA";
Brand = "Prusament";
Name = "Pristine White";
SKU = "c13bfe5776";
Date = "15.12.23";


TextFont = "Tahoma"; // For more fonts go to Help -> Font List



// ****************************************************************************
// ****************************************************************************
// ****************************************************************************
// CODE - DO NOT EDIT THIS PART IF YOU DO NOT KNOW WHAT YOU ARE DOING!
// you can learn more about OpenSCAD here: openscad.org

eps = 0.01; // Epsilon for z-fighting
CardLength = 85.6;
CardWidth = 53.98;
CardHeight = 1;

difference() {
  translate([CardLength, CardWidth, 0]) rotate([90, 0, 90]) import(InputPath);
  translate([0, 0, CardHeight - TextDepht]){
    linear_extrude(TextDepht + eps) {
      // *** first row ***
      // Material
      translate([CardLength/2, CardWidth - (TextTopSpacing + TextSize), 0]){
        text(Material, font = TextFont, size = TextSize, halign = "center");
      }
      // Brand
      translate([TextSideSpacing, CardWidth - (TextTopSpacing + TextSize), 0]){
        text(Brand, font = TextFont, size = TextSize);
      }
      // ID
      translate([CardLength - TextSideSpacing, CardWidth -(TextTopSpacing + TextSize), 0]){
        text(ID, font = TextFont, size = TextSize, halign = "right");
      }
      // *** second row ***
      // Name
      translate([TextSideSpacing, CardWidth - (TextTopSpacing + 2 * TextSize + 1 * RowSpacing), 0]){
        text(Name, font = TextFont, size = TextSize);
      }
      // Date
      translate([CardLength - TextSideSpacing, CardWidth - (TextTopSpacing + 2 * TextSize + 1 * RowSpacing), 0]){
        text(Date, font = TextFont, size = TextSize, halign = "right");
      }
      // *** third row ***
      // SKU / atribute
      translate([TextSideSpacing, CardWidth - (TextTopSpacing + 3 * TextSize + 2 * RowSpacing), 0]){
        text(SKU, font = TextFont, size = TextSize);
      }
    }
  }
}