//活动铰链部件
module pivot_joint_part() {
    difference(){
union(){
cube([40,40,30]);
translate([20,20,30]){
 rotate([90,0,0]){
cylinder(h=40,d=40,center=true);
 }
 }}
 
 
translate([20,20,30]){
rotate([90,0,0]){
    difference(){
cylinder(h=60,d=10,center=true);    
    }
}
}}
    }
    
 //活动铰链
 module pivot_joint(){   
       
    rotate([0,-90,0]){
        pivot_joint_part(); 
        }
        
        translate([-30,0,20]){
    rotate([0,45,0]){
   translate([-20,0,-30]){ 
            pivot_joint_part() ;}}}
            
        }
        
        pivot_joint();