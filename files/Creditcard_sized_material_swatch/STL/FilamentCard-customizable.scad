// ****************************************************************************
// ****************************************************************************
// ****************************************************************************
// Github: https://github.com/TylorKing/
// Thingiverse: https://www.thingiverse.com/lauraevans/about
// licence: CC BY-NC 4.0 (https://creativecommons.org/licenses/by-nc/4.0/)
//
// Version: 1.0.0.1
// Date: 2020-07-07
// How to use:
// Download pFillamentCard-1-blank.stl and change the InputPath to full file path. For example:
// C:/folder/subfolder/pFillamentCard-1-blank.stl
// ****************************************************************************
// ****************************************************************************
// ****************************************************************************

// units are in mm
// Input file (adjust):
InputPath = "D:/3D-Druck/FillamentCard/pFillamentCard-1-blank.stl";
// parameter
TextSize = 3.5;
TextHeight = 0.5;  //valid between 0 and 1.9 -> 1.x equales hole
TextTopSpacing = 2.0;
RowSpacing = 2.0;
//Text
ID = "42";
Material = "PETG";
Brand = "Formfutura";
Name = "HDglass Blinded Light Grey";
SKU = "175HDGLA-BLLGRY-0750";
Date = "19-12-27";

// code
difference() {
    import(InputPath);
    rotate([0, -90, -90]){
        linear_extrude(2) {
            // *** first row ***
            // Brand
            translate([-50.6, -(TextTopSpacing + TextSize), 1 - TextHeight]){
                text(Material, font = "Tahoma", size = 3.5);
            }
            // Material
            translate([-82.6, -(TextTopSpacing + TextSize), 1 - TextHeight]){
                text(Brand, font = "Tahoma", size = 3.5);
            }
            // ID
            translate([-3, -(TextTopSpacing + TextSize), 1 - TextHeight]){
                text(ID, font = "Tahoma", size = 3.5, halign = "right");
            }
            // *** second row ***
            // Name
            translate([-82.6, -(TextTopSpacing + 2 * TextSize + 1 * RowSpacing), 1 - TextHeight]){
                text(Name, font = "Tahoma", size = 3.5);
            }
            // Date
            translate([-3, -(TextTopSpacing + 2 * TextSize + 1 * RowSpacing), 1 - TextHeight]){
                text(Date, font = "Tahoma", size = 3.5, halign = "right");
            }
            // *** third row ***
            // SKU / atribute
            translate([-82.6, -(TextTopSpacing + 3 * TextSize + 2 * RowSpacing), 1 - TextHeight]){
                text(SKU, font = "Tahoma", size = 3.5);
            }
        }
    }    
}