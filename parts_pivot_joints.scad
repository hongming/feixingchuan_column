$fn=100;

pivot_joints();
 
 module pivot_joints(){
     translate([-20,-20,20])
     rotate([-45,0,90])
rotate([0,90,0]){
         pivot_joint_connector();
rotate([90,0,270-45]){
 translate([-20,1,-20]){
     color("grey")
        pivot_joint_stand();
     }
    }
    }
    
    }

module pivot_joint_connector(){
for(i=[[0,0,0],[0,0,40+2]]){
    translate(i){
difference(){
    union(){cylinder(h=2,r=19,center=true);
translate([0,(120-19)/2,0]){
cube([38,120-19,2],center=true);}}

cylinder(h=12,r=5,center=true);
translate([0,40,0]){
    cylinder(h=12,r=5,center=true);
    }
translate([0,80,0]){
    cylinder(h=12,r=5,center=true);
    }
    }}
}}

module pivot_joint_stand() {
    difference(){
union(){
cube([40,40,20]);
translate([20,20,20]){
 rotate([90,0,0]){
cylinder(h=40,d=40,center=true);
 }
 }}
 translate([20,20,0]){
 cylinder(h=1000,d=16,center=true); }
 
translate([20,20,20]){
rotate([90,0,0]){
 
cylinder(h=60,d=10,center=true);    
 
}
}}
    }
    