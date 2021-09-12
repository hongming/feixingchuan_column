
hooks();

module hooks(){

$fn=100;

difference(){

translate([(70/2)*tan(30),0,0]){
 
cylinder(16,(70/2)/cos(30),(70/2)/cos(30),$fn=3,center=true);

    }
    
    
    translate([30,0,0]){
cylinder(40,d=10,center=true);}



}

translate([61/2+30,0,0])
rotate([90,0,0])
{
    difference(){
cube([61,29,5],center=true);
cube([51,19,15],center=true);    
    }
}}