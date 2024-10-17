include<BOSL2/std.scad>

$fn = 64;


wallStrength = 5;

handleCutoutInnerWidth = 30;
handleCutoutInnerDepth = 30;

handleCutoutOuterWidth = handleCutoutInnerWidth + wallStrength * 2;
handleCutoutOuterDepth = handleCutoutInnerDepth + wallStrength * 2;

backpackHookInnerDiameter = 30;
backpackHookOuterDiameter = 40;

backpackHookOpening = 5;


hookStrength = 50;


linear_extrude(hookStrength)
    difference()
    {
        union()
        {
            // suitcase handle
            square([handleCutoutOuterWidth, handleCutoutOuterDepth]);


            // backpack hook
            back(handleCutoutOuterDepth)
                square([backpackHookOuterDiameter, backpackHookOuterDiameter / 2]);

            translate([backpackHookOuterDiameter / 2, handleCutoutOuterDepth + backpackHookOuterDiameter / 2])
                circle(d = backpackHookOuterDiameter);
        }

        // suitcase handle cutout
        translate([wallStrength, wallStrength])
            square([handleCutoutInnerWidth + wallStrength, handleCutoutInnerDepth]);
        
        // backpack hook cutout
        translate([backpackHookOuterDiameter / 2, handleCutoutOuterDepth + backpackHookOuterDiameter / 2])
            circle(d = backpackHookInnerDiameter);

        // backpack hook opening cutout
        translate([0, handleCutoutOuterDepth + (backpackHookOuterDiameter - backpackHookInnerDiameter) / 2])
            square([backpackHookOuterDiameter / 2, backpackHookOpening]);
    }