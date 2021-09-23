/*
E4040铝型材
70厘米4根
133+4*40，取30厘米，2根
133+2*40，取22厘米，2根
133，取13厘米，4根


*/


//CPC Pier adapter

include <NopSCADlib/utils/core/core.scad>
use <NopSCADlib/utils/layout.scad>
include <NopSCADlib/vitamins/box_sections.scad>
include <NopSCADlib/vitamins/nuts.scad>
include <NopSCADlib/vitamins/extrusions.scad>
include <NopSCADlib/vitamins/washers.scad>
use <parts_pivot_joints.scad>
use <luosi.scad>

AL140x140x5 =  ["AL140x140x5",  "Aluminium rectangular box section 12mm x 8mm x 1mm",     [133, 133],  5.25, 0.5, silver, undef];
AL130x130x5 =  ["AL130x130x5",  "Aluminium rectangular box section 12mm x 8mm x 1mm",     [130, 130],  5, 0.5, silver, undef];
AL120x120x5 =  ["AL120x120x5",  "Aluminium rectangular box section 12mm x 8mm x 1mm",     [122.5, 122.5],  5.25, 0.5, silver, undef];

//手拧螺丝
module apapter_wingnut(){
 M4_wingnut  =      ["M4_wingnut",       10,  20,   10,18,    M4_washer,     0, 40, 20, 6, 5];
    mirror([0,0,1]){
wingnut(M4_wingnut);}}


 
if($preview)
{
      translate([0,0,10]){   
main();}
  column_A();
translate([0,0,-20
    //动画
//    +$t*300    
    ]){
    column_B();

        }
     translate([0,0,-20]){   
 rotate([0,0,20])
         telescope_connetor();
}
}


//立柱-外面一层
module column_A(){
translate([0,0,-210-10-10-5]){
            box_section(AL140x140x5, 420);
    }

translate([0,0,-420-10-10-5-2.5]){
    cube([200,200,5],center=true);
    }
    }
    
//立柱-里面一层 +连接件
module column_B(){
translate([0,0,-210-10-10-5]){
    translate([0,0,20]){
box_section(AL120x120x5, 420);  
        }
    }
    

    }

module telescope_connetor(){
    
 
//连接件-CPC连接件
translate([0,0,30]){
  difference(){
cube([260,260,10],center=true);
  for(i = [0,120,240]){
rotate(i)
translate([82,0,0]){
cylinder(h =60 ,d=10,center=true);} 
}


translate([105,105]){
cylinder(h=200,r=5,center=true);}

translate([105,-105]){
cylinder(h=200,r=5,center=true);}

translate([-105,105]){
cylinder(h=200,r=5,center=true);}

translate([-105,-105]){
cylinder(h=200,r=5,center=true);}   

//连接件-连接底部立柱-四个孔-不旋转
rotate([0,0,0]){
translate([51,51]){
cylinder(h=200,r=3,center=true);}

translate([51,-51]){
cylinder(h=200,r=3,center=true);}

translate([-51,51]){
cylinder(h=200,r=3,center=true);}

translate([-51,-51]){
cylinder(h=200,r=3,center=true);}
      }
      
//连接件-连接底部立柱-四个孔
rotate([0,0,-20]){
translate([51,51]){
cylinder(h=200,r=3,center=true);}

translate([51,-51]){
cylinder(h=200,r=3,center=true);}

translate([-51,51]){
cylinder(h=200,r=3,center=true);}

translate([-51,-51]){
cylinder(h=200,r=3,center=true);}
      }
      }
    }
    
    
//连接件-4角的螺杆
for(i=[[105,105],[105,-105],[-105,105],[-105,-105]])    {
translate(i){
    translate([0,0,45]){
luosi();}}

    }
//连接件-立柱连接件
translate([0,0,0]){
  difference(){
cube([260,260,10],center=true);
  for(i = [0,120,240]){
rotate(i)
translate([82,0,0]){
cylinder(h =60 ,d=10,center=true);} 
}
//连接件-两个连接件的孔
translate([85,85]){
cylinder(h=200,r=5,center=true);}

translate([85,-85]){
cylinder(h=200,r=5,center=true);}

translate([-85,85]){
cylinder(h=200,r=5,center=true);}

translate([-85,-85]){
cylinder(h=200,r=5,center=true);}

//连接件-连接底部立柱
translate([51,51]){
cylinder(h=200,r=3,center=true);}

translate([51,-51]){
cylinder(h=200,r=3,center=true);}

translate([-51,51]){
cylinder(h=200,r=3,center=true);}

translate([-51,-51]){
cylinder(h=200,r=3,center=true);}
      }
    }
    }

module main(){

//CPC
//translate([0,0,45]){
//    color("red")
//
//cylinder(h =7 ,d1=300,d2=340,center=true,$fn=400);
//}
//translate([0,0,38.5]){
//    color("black")
//difference(){
//cylinder(h =7 ,d1=250,d2=270,center=true,$fn=400);
//for(i = [0,120,240]){
//rotate(i)
//translate([82,0,0]){
//cylinder(h =60 ,d=10,center=true);} 
//}}}

 

    
 
//新抱箍(立柱是133毫米，为了加工方便按130毫米计算)

module column_box(){
 
    translate([0,0,0]){
extrusion(E4040,133+2*40,center=false); 
        } 
    translate([-133-40,0,0]){
extrusion(E4040,133+2*40,center=false); 
        } 
rotate([0,90,0]){
     translate([-20,0,-133-20]){
extrusion(E4040,133,center=false); 
        } 
    translate([-133-40-20,0,-133-20]){
extrusion(E4040,133,center=false); 
        } 
    
    }
        

}




//下面立柱-最粗第一节-上方抱箍
translate([133/2+20,133/2+40,-40-20]){
rotate([90,0,0]){
column_box();
    }
}

//下面立柱-最粗第一节-下方抱箍
translate([133/2+20,133/2+40,-40-20-420+60]){
rotate([90,0,0]){
column_box();
    }
}

//斜拉桥
rotate([0, 0, 0]) {
for (i = [
           [0, 0, 0],
           [0, 0, 90],
           [0, 0, 180],
           [0, 0, 270]
         ]) {
  rotate(i) {
    translate([460 + 80 + 40 * sin(45), 0, -440 - 90 * sin(45)]) {
      rotate([0, -45, 0]) {
        extrusion(E4040, 600, center = false, cornerHole = false);
      }
    }
  }

  //活动铰链
  rotate(i) {
    translate([-133 / 2 - 40, 0, -20 - 30 - 30]) {

      pivot_joints();
      //     pivot_joint();
    }
  }

  //活动铰链-底部
  rotate(i) {
    translate([-133 / 2 - 40 - 400 - 70, 0, -500 - 20 - 30]) {

      rotate([0, 90, 180]) {
        pivot_joints();
      }
      translate([-20, 0, -24])
      pivot_joint_foot();
      //     pivot_joint();
    }
  }
  //斜拉桥的花篮紧缩器
  rotate(i) {
    translate([0, -2.5, -420]) {
      rotate([0, -90, 0]) {
        cube([5, 5, 700]);
      }
    }




  }
}
}


    
    


 }
 
 
 
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
//脚杯
module pivot_joint_foot(){
    cylinder(h=12,d=50,center=false);
translate([0,0,12]){
    cylinder(h=12,d1=50,d2=10,center=false);
    }
cylinder(h=80,d=8,center=false);
    }
