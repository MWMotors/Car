// OpenSCAD
// mount helper for connector binding posts for autotransformer jig

$len=100;
$heig=3;
$wid=7;
$heig2=1;
$wid2=15;

$holed=4;
$holey=$wid-$holed/2+0.8;
$holeh=$heig+$heig2+1;

$holesp=19;

$holeleft=10;
$holeright=$len-10;

$fa=2;$fs=0.5;


module jig()
{
    cube([$len,$wid2,$heig2]);
    translate([0,0,$heig2])cube([$len,$wid,$heig]);
}

module jigholes()
{
    translate([$holeleft,$holey,0])cylinder(d=$holed,h=$holeh);
    translate([$holeleft+$holesp,$holey,0])cylinder(d=$holed,h=$holeh);

    translate([$holeright,$holey,0])cylinder(d=$holed,h=$holeh);
    translate([$holeright-$holesp,$holey,0])cylinder(d=$holed,h=$holeh);
    translate([$holeright-$holesp*2,$holey,0])cylinder(d=$holed,h=$holeh);
}


difference(){
jig();
jigholes();
}