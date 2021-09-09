//CPC Pier adapter

include <NopSCADlib/utils/core/core.scad>
use <NopSCADlib/utils/layout.scad>
include <NopSCADlib/vitamins/box_sections.scad>
include <NopSCADlib/vitamins/nuts.scad>
include <NopSCADlib/vitamins/extrusions.scad>
use <parts_pivot_joints.scad>

//手拧螺丝
module apapter_wingnut(){
 M4_wingnut  =      ["M4_wingnut",       10,  20,   10,18,    M4_washer,     0, 40, 20, 6, 5];
    mirror([0,0,1]){
wingnut(M4_wingnut);}}


 
if($preview)
{
 
main();
  column();

}

module column(){
    AL140x140x5 =  ["AL140x140x5",  "Aluminium rectangular box section 12mm x 8mm x 1mm",     [133, 133],  5.25, 0.5, silver, undef];
    
    AL130x130x5 =  ["AL130x130x5",  "Aluminium rectangular box section 12mm x 8mm x 1mm",     [130, 130],  5, 0.5, silver, undef];
    
    AL120x120x5 =  ["AL120x120x5",  "Aluminium rectangular box section 12mm x 8mm x 1mm",     [122.5, 122.5],  5.25, 0.5, silver, undef];

translate([0,0,-230-10-10-5]){
    box_section(AL140x140x5, 460);
//    translate([0,0,10]){
//box_section(AL130x130x5, 460);}
    translate([0,0,20]){
box_section(AL120x120x5, 460);  
        }
    
    }

    }


module main(){

//CPC支架
translate([0,0,40]){
    color("black")
difference(){
cylinder(h =10 ,d=205,center=true);
for(i = [0,120,240]){
rotate(i)
translate([82,0,0]){
cylinder(h =60 ,d=10,center=true);} 
}}}
 

//CPC连接件
translate([0,0,30]){
  difference(){
cube([210,210,10],center=true);
  for(i = [0,120,240]){
rotate(i)
translate([82,0,0]){
cylinder(h =60 ,d=10,center=true);} 
}

//
translate([85,85]){
cylinder(h=200,r=5,center=true);}

translate([85,-85]){
cylinder(h=200,r=5,center=true);}

translate([-85,85]){
cylinder(h=200,r=5,center=true);}

translate([-85,-85]){
cylinder(h=200,r=5,center=true);}    
      }
    }
    
    
//4角的螺杆
for(i=[[85,85],[85,-85],[-85,85],[-85,-85]])    {
translate(i){
    translate([0,0,45]){
luosi();}}

    }

//立柱连接件
translate([0,0,0]){
  difference(){
cube([210,210,10],center=true);
  for(i = [0,120,240]){
rotate(i)
translate([82,0,0]){
cylinder(h =60 ,d=10,center=true);} 
}
//两个连接件的孔
translate([85,85]){
cylinder(h=200,r=5,center=true);}

translate([85,-85]){
cylinder(h=200,r=5,center=true);}

translate([-85,85]){
cylinder(h=200,r=5,center=true);}

translate([-85,-85]){
cylinder(h=200,r=5,center=true);}
 //连接底部立柱


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




//下面立柱-最粗第一节-最上方抱箍
translate([133/2+20,133/2+40,-40-20]){
rotate([90,0,0]){

    color("blue")
column_box();
    }
}
//斜拉桥
    for(i=[
    [0,0,0],
        [0,0,90],
        [0,0,180],
        [0,0,270]
    ]){
        rotate(i){
    translate([460+80+40*sin(45),0,-440-90*sin(45)]){
    rotate([0,-45,0]){
extrusion(E4040,600,center=false,cornerHole = false);
    }}}
    
//活动铰链
            rotate(i){
translate([-133/2-40,0,-20-30-30]){
 
    pivot_joints();
       //     pivot_joint();
    }}
    
//活动铰链-底部
            rotate(i){
translate([-133/2-40-400-70,0,-500-20-30]){
 
    rotate([0,90,180]){
    pivot_joints();}
    translate([-20,0,-24])
    pivot_joint_foot();
       //     pivot_joint();
    }}
//斜拉桥的花篮紧缩器
        rotate(i){
    translate([460+90+10,-5,-460-40]){
    rotate([0,-90,0]){
cube([5,5,460*sqrt(2)]);
    }}



    
    }
    }
    
    
//螺杆套装
module luosi(){
translate([0,0,-5]){
    cylinder(h=10,r=10,center=true);

translate([0,0,-10-50/2]){
    cylinder(h=10+50,r=5,center=true);
    }
    
translate([0,0,-10-3-5]){
    color("black")
    cylinder(h=6,r=10,center=true);
    }

translate([0,0,-30]){
    color("black")
    cylinder(h=10,r=10,center=true);
    }
    
 
     translate([0,0,-50]){
    color("black")
 //   cylinder(h=10,r=20,center=true);
           apapter_wingnut(); 
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
    cylinder(h=12,d=90,center=false);
translate([0,0,12]){
    cylinder(h=12,d1=90,d2=10,center=false);
    }
cylinder(h=80,d=8,center=false);
    }
