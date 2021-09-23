include <NopSCADlib/utils/core/core.scad>
use <NopSCADlib/utils/layout.scad>
include <NopSCADlib/vitamins/box_sections.scad>
include <NopSCADlib/vitamins/nuts.scad>
include <NopSCADlib/vitamins/extrusions.scad>
include <NopSCADlib/vitamins/washers.scad>
use <parts_pivot_joints.scad>

//螺杆套装
module luosi(){

translate([0,0,-7]){
    cylinder(h=5,r=10,center=true);
    translate([0,0,-3]){
washer(M8_penny_washer);}
    
translate([0,0,-10-50/2]){
    cylinder(h=50,r=5,center=true);
    }
    
translate([0,0,-10-3-5]){
    color("black")
    cylinder(h=10,r=10,center=true);
    }

translate([0,0,-50]){
    color("black")
    cylinder(h=10,r=10,center=true);
    }
    
 
     translate([0,0,-35]){
    color("black")
 //   cylinder(h=10,r=20,center=true);
rotate([180,0,0])
         {           apapter_wingnut(); 
             }
    }
   
    
    }

}

//手拧螺丝
module apapter_wingnut(){
 M4_wingnut  =      ["M4_wingnut",       10,  20,   10,18,    M4_washer,     0, 40, 20, 6, 5];
    mirror([0,0,1]){
wingnut(M4_wingnut);}}