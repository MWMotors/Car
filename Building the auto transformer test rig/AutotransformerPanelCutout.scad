// OpenSCAD
// Autotransformer panel cutout

$totw=129;
$toth       =88;
$inw=117;
$inh=77;
$edgl=21;

$sww=21.5;
$swh=27+1;

$ssww=12.5;
$sswh=18.5;

$th=1;

$sockw=50;
$sockh=50;
$sock2w=30;
$sock2h=12;
$sockholedia=4; // socket screw hole diameter
$sockholesp=38; // socket hole spacing
$sockholemain=43; // mount hole for the socket
$sockhe=($sockw-$sockholesp)/2;

$fa=2;$fs=0.5;

module outline()
{
    difference(){
      cube([$totw,$toth,$th]);
      translate([($totw-$inw)/2,($toth-$inh)/2,0])
          cube([$inw,$inh,$th]); 
    }
    cube([$edgl,$edgl,$th]);
    translate([0,$toth-$edgl,0])cube([$edgl,$edgl,$th]);
    translate([$totw-$edgl,$toth-$edgl,0])cube([$edgl,$edgl,$th]);
    translate([$totw-$edgl,0,0])cube([$edgl,$edgl,$th]);
}

module switchoutline(x,y)
{
    translate([x,y,0])cube([26,31,$th]);
}
module switchhole(x,y)
{
    translate([x+2.25,y+1.5,0])cube([21.5,27+1,$th]);
}
module switchoutline2(x,y)
{
    difference(){
        switchoutline(x,y);
        switchhole(x,y);
    }
}

module smswitchoutline(x,y)
{
    translate([x,y,0])cube([14.5,21,$th]);
}
module smswitchhole(x,y)
{
    translate([x+1,y+1,0])cube([12.5,19,$th]);
}
module smswitchoutline2(x,y)
{
    difference(){
        smswitchoutline(x,y);
        smswitchhole(x,y);
    }
}

module sswitch(x,y)
{
    translate([x,y,0])cube([$ssww,$sswh,$th]);
}


module socketoutline(x,y)
{
    translate([x,y,0]){
        cube([$sockw,$sockh,$th]);
        translate([($sockw-$sock2w)/2,$sockh,0])cube([$sock2w,$sock2h,$th]);
    }
}

module sockethole(x,y)
{
    translate([x,y,0]){
        translate([$sockhe,$sockhe,0])cylinder(d=$sockholedia,h=$th);
        translate([$sockhe,$sockh-$sockhe,0])cylinder(d=$sockholedia,h=$th);
        translate([$sockw-$sockhe,$sockhe,0])cylinder(d=$sockholedia,h=$th);
        translate([$sockw-$sockhe,$sockh-$sockhe,0])cylinder(d=$sockholedia,h=$th);
        translate([$sockw/2,$sockh/2,0])cylinder(d=$sockholemain,h=$th);
    }
}

module socketoutline2(x,y)
{
    difference(){
        socketoutline(x,y);
        sockethole(x,y);
    }
}


module iecsockethole(x,y)
{
    translate([x,y,0]){
        translate([11.5,1.5,0])
        linear_extrude(height=$th)
        polygon(points=[[0,1],[1,0],[26,0],[27,1],[27,14],[27-6,20],[6,20],[0,14]]);
    }
    translate([x+5,y+11.5,0])cylinder(d=3,h=$th);
    translate([x+45,y+11.5,0])cylinder(d=3,h=$th);
}

module iecsocketoutline(x,y)
{
    translate([x,y,0]){
        linear_extrude(height=$th)
        polygon(points=[[7,0],[50-7,0],[50,10],[50,13],[50-7,23],[7,23],[0,13],[0,10]]);
    }
}

module iecsocketoutline2(x,y)
{
    difference(){
        iecsocketoutline(x,y);
        iecsockethole(x,y);
    }
}


module totallayout(){
outline();
socketoutline2(72,($toth-$sockh)/2);
iecsocketoutline2(18,12);
switchoutline2(22,43);
smswitchoutline2(52,53);
}

module cutlayout()
{
//    outline();
//sockethole(72,($toth-$sockh)/2);
//iecsockethole(18,12);
//switchhole(22,43);
//smswitchhole(52,53);
sockethole(129-50-72,($toth-$sockh)/2);
iecsockethole(129-50-18,12);
switchhole(129-26-22,43);
smswitchhole(129-14.5-52,53);
}

projection()translate([0,88,0])rotate([180,0,0])cutlayout();
