/** 
Luigi: Lost Dimensions
Name: Ifaz Alam

Date: April 19th, 2018

You wake up to the discovery that you are in the wrong dimension and that you need to escape. If you don’t escape, you will cause instability in the dimension and die. With the help of a temporary buddy, you can learn only a few things that will help you find your way out. Can you do it? 
Luigi: Lost Dimensions is a 2D maze-style platform game where the objective is to navigate the iconic Nintendo character Luigi by through an environment that consists of white, blue, or rainbow coloured objects that typically create a maze-like formation.

RETRO FONT by Larry Serflaten and ジェイソン猫
https://www.khanacademy.org/computer-programming/retro-font/2583796852 (Larry Serflaten)

https://www.khanacademy.org/computer-programming/famicom-nes-text/6604670705532928 (ジェイソン猫)
**/
// Important variables

var char_frame = 1;
// initial frame of Luigi

{
var traps = false;
// traps in last lvl

var traps1 = false;
var traps2 = false;
// traps in level 1

var traps3 = false;
var traps4 = false;
var traps5 = false;
// traps in level 2

var traps5 = false;
//traps in level 4

} // traps

var talkX = 0;
//in-game text X coordinate
var talkY = 0;
//in-game text Y coordinate

var boxX = 0;
//in-game white box X coordinate

var boxY = 0;
//in-game white box Y coordinate

var arrowX = -102;
//main menu navigation arrow X coordinate

var arrowY = -72;
//main menu navigation arrow Y coordinate

var scene = 1;
//current scene

var blockX = 0; // text box x
var blockY = 0; // text box y

var direction = 1;
//initial direction Luigi is facing (Right)

var charX = 0;
var charLastLvlX = 0;
//character X coordinate

var charY = 0;
var charLastLvlY = 0;
//character Y coordinate

var keys = [];
//placeholder for the keys required to move Luigi

var palatte = [
    //row 1
    color(124,124,124),//0
    color(0,0,252),    //1
    color(0,0,188),    //2
    color(68,40,188),  //3
    color(148,0,132),  //4
    color(189,0,0),    //5
    color(168,16,0),   //6
    color(136,20,0),   //7
    color(80,48,0),    //8
    color(0,120,0),    //9
    color(0,104,0),    //10
    color(0,88,0),     //11
    color(0,64,88),    //12
    color(0,0,0),      //13
    color(0,0,0),      //14
    color(255, 255, 255),      //15
    //row 2
    color(188,188,188),//16
    color(0,120,248),  //17
    color(0,88,248),   //18
    color(104,68,252), //19
    color(216,0,204),  //20
    color(228,0,88),   //21
    color(248,56,0),   //22
    color(228,92,16),  //23
    color(172,124,0),  //24
    color(0,184,0),    //25
    color(0,168,0),    //26
    color(0,168,68),   //27
    color(0,136,136),  //28
    color(0,0,0),      //29
    color(0,0,0),      //30
    color(255, 255, 255),      //31
    //row 3
    color(248,248,248),//32
    color(60,188,252), //33
    color(104,136,252),//34
    color(152,120,248),//35
    color(248,120,248),//36
    color(248,88,152), //37
    color(248,120,88), //38
    color(252,160,68), //39
    color(248,184,0),  //40
    color(184,248,24), //41
    color(88,216,84),  //42
    color(88,248,152), //43
    color(0,232,216),  //44
    color(120,120,120),//45
    color(0,0,0),      //46
    color(0,0,0),      //47
    //row 4
    color(252,252,252),//48
    color(164,228,252),//49
    color(184,184,248),//50
    color(216,184,248),//51
    color(248,184,248),//52
    color(248,164,192),//53
    color(240,208,176),//54
    color(252,224,168),//55
    color(248,216,120),//56
    color(216,248,120),//57
    color(184,248,184),//58
    color(184,248,216),//59
    color(0,252,252),  //60
    color(248,216,248),//61
    color(0,0,0),      //62
    color(0,0,0),      //63
];
//NES Font text colours

var enLetters = [];
//array for NES font letters

var char_frame = 1;
//initial frame of Luigi (standing image)

{
var boo_frame = 1;
//initial frame of boo (facing left)

var booX = 0;
//ghost 1 x coordinate

var booY = 0;
//ghost  1y coordinate

var boo2X = 0;
//ghost 2 x coordinate

var boo3X = 0;
//ghost 3 x coordinate

var boo4X = 0;
// ghost 4 x coordinate

var boo5Y = 0;
// ghost 5 y coordinate

var boo6X = 0;
// ghost 6 x coordinate


var booSpeed = 1;
//ghost 1 moving speed

var boo2Speed = 1;
//ghost 2 moving speed

var boo3Speed = 1;
//ghost 3 moving speed

var boo4Speed = 1;
//ghost 4 moving speed

var boo5Speed = 2;
//ghost 5 moving speed

var boo6Speed = 2;
} //boo variables

var charSpeed = 3;
//character speed

var timer = 0;
//timer needed for switching run animation frames

var jumping = false;
//assumption that luigi is not jumping

var jumpTimer = 0;
//calculates jump time

var jumpSpeed = 3;
//how fast Luigi jumps

var menuAnimation = 0;
//responsible for the moving circles in the main menu

var widthHeight = 0;
//for transition effect

var text_timer = 0;

frameRate(75);
//frames per second

var start = false;
//game has not started (start button hasn't been clicked yet)
var about = false;
//help button hasn't been pressed

var letters = [];
// letter array

/** FUNCTIONS **/
var initEnLetters = function() {
    enLetters[0] = "1C3663637F636300";//A
    enLetters[1] = "7E63637E63637E00";//B
    enLetters[2] = "1E33606060331E00";//C
    enLetters[3] = "7C66636363667C00";//D
    enLetters[4] = "7F60607E60607F00";//E
    enLetters[5] = "7F60607E60606000";//F
    enLetters[6] = "1F30606763331F00";//G
    enLetters[7] = "6363637F63636300";//H
    enLetters[8] = "3C18181818183C00";//I
    enLetters[9] = "0F03030363633E00";//J
    enLetters[10] = "63666C786C666300";//K
    
    enLetters[11] = "6060606060607E00";//L
    enLetters[12] = "63777F7F6B636300";//M
    enLetters[13] = "63737B7F6F676300";//N
    enLetters[14] = "3E63636363633E00";//O
    enLetters[15] = "7E63637E60606000";//P
    enLetters[16] = "3E6363636F663D00";//Q
    enLetters[17] = "7E63637E6C666300";//R
    enLetters[18] = "3C66603E03633E00";//S
    enLetters[19] = "7E18181818181800";//T
    enLetters[20] = "6363636363633E00";//U
    enLetters[21] = "636363773E1C0800";//V
    
    enLetters[22] = "63636B7F7F776300";//W
    enLetters[23] = "63773E1C3E776300";//X
    enLetters[24] = "6666663C18181800";//Y
    enLetters[25] = "7F070E1C38707F00";//Z
    enLetters[26] = "0000007E00000000";//-
    enLetters[27] = "0000000000303000";//.
    enLetters[28] = "0000000030102000";//,
    enLetters[29] = "1818181818001800";//!
    enLetters[30] = "1808100000000000";//'
    enLetters[31] = "384428102A443B00";//&
    enLetters[32] = "0000000000303000";//.
    
    enLetters[33] = "1C26636363321C00";//0
    enLetters[34] = "1838181818187E00";//1
    enLetters[35] = "3E63071E3C707F00";//2
    enLetters[36] = "3F060C1E03633E00";//3
    enLetters[37] = "0E1E36667F060600";//4
    enLetters[38] = "7E607E0303633E00";//5
    enLetters[39] = "1E30607E63633E00";//6
    enLetters[40] = "7F63060C18181800";//7
    enLetters[41] = "3C62723C43433E00";//8
    enLetters[42] = "3E63633F03073E00";//9
    enLetters[43] = "0000000000000000";//space
    
    enLetters[44] = "3C4299A1A199423C";//copyright
    enLetters[45] = "3C660C1818001800";//?
};
//english letter data

var rainbowColor = function(i) {
    return color(sin(i)*151+100,sin(i+90)*+100,sin(i+180)*250, 420);
};
// rainbow colours

var initLetters = function(){
    // each string holds the vertical representation of each
    // glyph (in 2-byte hexidecimal notation).
    // 33-47 = "!"#$&%'()*+,-./"
    letters[33] = "0018181818001800";  // !
    letters[34] = "0066666600000000";  // "
    letters[35] = "0066FF6666FF6600";  // # ...
    letters[36] = "183E603C067C1800";
    letters[37] = "00666C1830664600";
    letters[38] = "1C361C386F663B00";
    letters[39] = "0018181800000000";
    letters[40] = "000E1C18181C0E00";
    letters[41] = "0070381818387000";
    letters[42] = "00663CFF3C660000";
    letters[43] = "0018187E18180000";
    letters[44] = "0000000000181830";
    letters[45] = "0000007E00000000";
    letters[46] = "0000000000181800";
    letters[47] = "00060C1830604000";
    // 48-57 = 0-9
    letters[48] = "003C666E76663C00";  // 0
    letters[49] = "0018381818187E00";  // 1
    letters[50] = "003C660C18307E00";  // 2 ...
    letters[51] = "007E0C180C663C00";
    letters[52] = "000C1C3C6C7E0C00";
    letters[53] = "007E607C06663C00";
    letters[54] = "003C607C66663C00";
    letters[55] = "007E060C18303000";
    letters[56] = "003C663C66663C00";
    letters[57] = "003C663E060C3800";
    // 58-64 = ":;<=>?@"
    letters[58] = "0000181800181800";
    letters[59] = "0000181800181830";
    letters[60] = "060C1830180C0600";
    letters[61] = "00003E00003E0000";
    letters[62] = "6030180C18306000";
    letters[63] = "003C660C18001800";
    letters[64] = "003C666E6E603E00";
    // 65-90 = A-Z
    letters[65] = "00183C66667E6600";  // A
    letters[66] = "007C667C66667C00";  // B
    letters[67] = "003C666060663C00";  // C ...
    letters[68] = "00786C66666C7800";
    letters[69] = "007E607C60607E00";
    letters[70] = "007E607C60606000";
    letters[71] = "003E60606E663E00";
    letters[72] = "0066667E66666600";
    letters[73] = "007E181818187E00";
    letters[74] = "0006060606663C00";
    letters[75] = "00666C78786C6600";
    letters[76] = "0060606060607E00";
    letters[77] = "0063777F6B636300";
    letters[78] = "0066767E7E6E6600";
    letters[79] = "003C666666663C00";
    letters[80] = "007C66667C606000";
    letters[81] = "003C6666666C3600";
    letters[82] = "007C66667C6C6600";
    letters[83] = "003C603C06063C00";
    letters[84] = "007E181818181800";
    letters[85] = "0066666666667E00";
    letters[86] = "00666666663C1800";
    letters[87] = "0063636B7F776300";
    letters[88] = "0066663C3C666600";
    letters[89] = "0066663C18181800"; 
    letters[90] = "007E0C1830607E00";
    // 91-96 = "[\]^_`"   //       ` added for completeness 
    letters[91] = "001E181818181E00";
    letters[92] = "00406030180C0600";
    letters[93] = "0078181818187800";
    letters[94] = "00081C3663000000";
    letters[95] = "000000000000FF00";
    letters[96] = "0018180C00000000";
    // 97-122 = a-z
    letters[97] = "00003C063E663E00";
    letters[98] = "0060607C66667C00";
    letters[99] = "00003C6060603C00";
    letters[100] = "0006063E66663E00";
    letters[101] = "00003C667E603C00";
    letters[102] = "000E183E18181800";
    letters[103] = "00003E66663E067C";
    letters[104] = "0060607C66666600";
    letters[105] = "0018003818183C00";
    letters[106] = "000600060606063C";
    letters[107] = "0060606C786C6600";
    letters[108] = "0038181818183C00";
    letters[109] = "0000667F7F6B6300";
    letters[110] = "00007C6666666600";
    letters[111] = "00003C6666663C00";
    letters[112] = "00007C66667C6060";
    letters[113] = "00003E66663E0606";
    letters[114] = "00007C6660606000";
    letters[115] = "00003E603C067C00";
    letters[116] = "00187E1818180E00";
    letters[117] = "0000666666663E00";
    letters[118] = "00006666663C1800";
    letters[119] = "0000636B7F3E3600";
    letters[120] = "0000663C183C6600";
    letters[121] = "00006666663E0C78";
    letters[122] = "00007E0C18307E00";
    // 123-126 = "{|}~"  // {} and ~ added for completeness
    letters[123] = "1C30306030301C00";
    letters[124] = "1818181818181818";
    letters[125] = "380C0C060C0C3800";
    letters[126] = "000070DB0E000000";
};
// letter data

var drawLetter = function(ltr, x, y, z){
    // ensure letters are prepared
    if (letters.length === 0){initLetters();}
    // get letter element (string)
    var code = letters[ltr.charCodeAt(0)];
    // verify letter is properly defined
    if (typeof code === "string" && code.length === 16){
        // calc cell size from letter size
        var s = floor(z/8);
        if (s<1){s=1;}
        // vert loop
        for (var i=0; i<8; i++){
            // get 2-byte hexadecimal value
            var seg = parseInt(code.substr(i+i, 2), 16);
            var yy = y+(i*s);
            // horz loop
            for (var xx=x+(s*7); xx>=0; xx-=s){
                if (seg & 1){
                   rect(xx, yy, s, s);
                }
                seg >>= 1;
            }
        }
    }
};
// Use the drawLetter function to draw single letters

var drawWords = function(wrd, x, y, z, color){
// wrd = string to draw
// x   = x position (LEFT)
// y   = y position (TOP)
// z   = font size (reduced to multiples of 8)

    // validate input
    if (typeof wrd !== "string"){
        wrd = wrd.toString();
    }
    // calc size (multiple of 8) 
    fill(palatte[color]);
    noStroke();
    var s = floor(z/8) * 8;
    if (s<8){s=8;}
    var xx = x; 
    // loop through word(s)
    for (var i=0; i<wrd.length; i++){
        drawLetter(wrd.substr(i, 1), xx, y, s);
        xx += s;
        // wrap around
        if (xx+s > width){
            xx = x;
            y += s;
        }
    }
};
// Use the drawWords function to draw a string of text

var draw_boo = function(x,y,size) {
var booleft = [[0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,0],
               [0,0,0,1,1,2,2,2,2,2,1,1,0,0,0,0],
               [0,0,1,2,2,3,3,3,3,3,2,2,1,0,0,0],
               [0,1,2,3,3,4,4,4,4,4,3,3,2,1,0,0],
               [0,1,2,1,4,1,4,4,4,4,4,4,3,2,1,0],
               [1,2,3,1,4,1,4,4,4,4,1,1,1,3,2,1],
               [1,2,3,1,4,1,4,4,4,1,4,4,1,3,2,1],
               [1,2,3,4,4,4,4,4,4,4,4,4,1,3,1,0],
               [1,2,5,4,5,4,5,4,4,4,4,1,4,3,2,1],
               [1,2,5,5,5,5,5,4,4,4,4,4,3,2,2,1],               
               [1,2,5,5,5,5,5,4,4,4,4,4,4,3,2,1],
               [0,1,2,5,5,5,5,5,4,4,4,4,4,3,2,1],    
               [0,1,2,5,3,5,4,5,4,4,4,3,3,2,1,0],
               [0,0,1,2,2,3,3,3,3,3,3,2,2,1,0,0],
               [0,0,0,1,1,2,2,2,2,2,2,1,1,0,0,0],
               [0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0],];

var booright = [[0,0,0,0,0,0,1,1,1,1,1,0,0,0,0,0],
               [0,0,0,0,1,1,2,2,2,2,2,1,1,0,0,0],
               [0,0,0,1,2,2,3,3,3,3,3,2,2,1,0,0],
               [0,0,1,2,3,3,4,4,4,4,4,3,3,2,1,0],
               [0,1,2,3,4,4,4,4,4,4,1,4,1,2,1,0],
               [1,2,3,1,1,1,4,4,4,4,1,4,1,3,2,1],
               [1,2,3,1,4,4,1,4,4,4,1,4,1,3,2,1],
               [0,1,3,1,4,4,4,4,4,4,4,4,4,3,2,1],
               [1,2,3,4,1,4,4,4,4,5,4,5,4,5,2,1],
               [1,2,2,3,4,4,4,4,4,5,5,5,5,5,2,1],               
               [1,2,3,4,4,4,4,4,4,5,5,5,5,5,2,1],
               [1,2,3,4,4,4,4,4,5,5,5,5,5,2,1,0],    
               [0,1,2,3,3,4,4,4,5,4,5,3,5,2,1,0],
               [0,0,1,2,2,3,3,3,3,3,3,2,2,1,0,0],
               [0,0,0,1,1,2,2,2,2,2,2,1,1,0,0,0],
               [0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0],];
               var boo;
               if (boo_frame === 1) {
                   boo = booleft;
               }
               
               else if (boo_frame ===2) {
                   boo = booright;
               }
//sets the size of each "pixel"
var booSize = size;
//sets the x and y placement of the sprite, useful if you want to move it
//around later
var booX = x;
var booY = y;

//Color 0: Transparent
//Color 1: Black
//Color 2: darkening grey
//Color 3: less darkening grey
// color 4: WHIte
// color 5: RED

var boocolors = [color(0, 0, 0,1), color(0, 0, 0),color(99,96,92), color(171,170,166), color(255,255,255), color(190,46,54),];

//painting the sprite in two for loops - the outside for loop for the rows,
//the inside for loop for the columns
for (var r = 0; r < boo[0].length; r++)
        {
            for (var c = 0; c < boo.length; c++)
            {
                noStroke();
                //sets the fill colour according to the colors in the array
                fill(boocolors[boo[c][r]]);
                //draws the rectangle
                rect((r * booSize)+booX, (c * booSize)+booY, booSize,
                    booSize);
            }
        }
};
//draws boo

var portal_blue = function(x,y,size) {
var brickTwo = [[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
                [0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0],
                [0,0,0,0,0,0,1,0,1,1,1,1,1,1,0,0,0,0],
                [0,0,0,0,0,1,0,1,1,1,1,1,1,1,1,0,0,0],
                [0,0,0,0,1,0,1,1,1,0,0,0,1,1,1,1,0,0],
                [0,0,0,1,0,1,1,1,0,0,0,0,0,1,1,1,0,0],
                [0,0,0,1,0,1,1,0,0,0,0,0,0,0,1,1,1,0],
                [0,0,0,1,1,1,0,0,0,0,0,0,0,0,1,1,1,0],
                [0,0,0,1,1,0,0,0,0,0,0,0,0,0,1,1,1,1],
                [0,0,1,1,1,0,0,0,0,0,0,0,0,0,1,1,1,1],               
                [0,0,1,1,1,0,0,0,0,0,0,0,0,0,1,1,1,1],
                [0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1],    
                [0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1],
                [0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,1,1,0],
                [0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0],
                [0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0],
                [1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0],
                [1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0],
                [1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0],
                [1,1,1,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0],
                [1,1,1,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0],
                [1,1,1,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0],
                [1,1,1,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0],
                [1,1,1,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0],
                [0,1,1,0,1,0,0,0,0,0,0,1,1,1,1,0,0,0],
                [0,1,1,0,1,0,0,0,0,0,1,1,1,1,0,0,0,0],
                [0,1,1,1,0,1,1,0,0,0,1,1,1,0,0,0,0,0],
                [0,0,1,1,1,0,1,1,1,1,1,1,0,0,0,0,0,0],
                [0,0,0,1,1,1,0,0,1,1,1,1,0,0,0,0,0,0],
                [0,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0,0,0],];
//sets the size of each "pixel"
var brickTwoSize = size;
//sets the x and y placement of the sprite, useful if you want to move it
//around later
var brickTwoX = x;
var brickTwoY = y;

//Color 0: Transparent
//Color 1: Dodger blue

var brickTwocolors = [color(0, 0, 0,1), color(1,150,253)];

//painting the sprite in two for loops - the outside for loop for the rows,
//the inside for loop for the columns
for (var r = 0; r < brickTwo[0].length; r++)
        {
            for (var c = 0; c < brickTwo.length; c++)
            {
                noStroke();
                //sets the fill colour according to the colors in the array
                fill(brickTwocolors[brickTwo[c][r]]);
                //draws the rectangle
                rect((r * brickTwoSize)+brickTwoX, (c * brickTwoSize)+brickTwoY, brickTwoSize,
                    brickTwoSize);
            }
        }
};
//draws blue portal :D

var portal_orange = function(x,y,size) {
var brickTwo = [[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
                [0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0],
                [0,0,0,0,0,0,1,0,1,1,1,1,1,1,0,0,0,0],
                [0,0,0,0,0,1,0,1,1,1,1,1,1,1,1,0,0,0],
                [0,0,0,0,1,0,1,1,1,0,0,0,1,1,1,1,0,0],
                [0,0,0,1,0,1,1,1,0,0,0,0,0,1,1,1,0,0],
                [0,0,0,1,0,1,1,0,0,0,0,0,0,0,1,1,1,0],
                [0,0,0,1,1,1,0,0,0,0,0,0,0,0,1,1,1,0],
                [0,0,0,1,1,0,0,0,0,0,0,0,0,0,1,1,1,1],
                [0,0,1,1,1,0,0,0,0,0,0,0,0,0,1,1,1,1],               
                [0,0,1,1,1,0,0,0,0,0,0,0,0,0,1,1,1,1],
                [0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1],    
                [0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1],
                [0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,1,1,0],
                [0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0],
                [0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0],
                [1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0],
                [1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0],
                [1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0],
                [1,1,1,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0],
                [1,1,1,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0],
                [1,1,1,0,0,0,0,0,0,0,0,0,0,1,1,1,0,0],
                [1,1,1,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0],
                [1,1,1,0,0,0,0,0,0,0,0,0,1,1,1,0,0,0],
                [0,1,1,0,1,0,0,0,0,0,0,1,1,1,1,0,0,0],
                [0,1,1,0,1,0,0,0,0,0,1,1,1,1,0,0,0,0],
                [0,1,1,1,0,1,1,0,0,0,1,1,1,0,0,0,0,0],
                [0,0,1,1,1,0,1,1,1,1,1,1,0,0,0,0,0,0],
                [0,0,0,1,1,1,0,0,1,1,1,1,0,0,0,0,0,0],
                [0,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0,0,0],];
//sets the size of each "pixel"
var brickTwoSize = size;
//sets the x and y placement of the sprite, useful if you want to move it
//around later
var brickTwoX = x;
var brickTwoY = y;

//Color 0: Transparent
//Color 1: Dodger blue

var brickTwocolors = [color(0, 0, 0,1), color(253,107,0)];

//painting the sprite in two for loops - the outside for loop for the rows,
//the inside for loop for the columns
for (var r = 0; r < brickTwo[0].length; r++)
        {
            for (var c = 0; c < brickTwo.length; c++)
            {
                noStroke();
                //sets the fill colour according to the colors in the array
                fill(brickTwocolors[brickTwo[c][r]]);
                //draws the rectangle
                rect((r * brickTwoSize)+brickTwoX, (c * brickTwoSize)+brickTwoY, brickTwoSize,
                    brickTwoSize);
            }
        }
};
//draws orange portal :D

var checkHit = function(x1,y1,width1,height1,x2,y2,width2,height2) {
    if (x1 + width1 >= x2 && x1 <= x2 + width2 && y1 + height1 >= y2 && y1 <= y2 + height2)     {
        return true;
     }
    else {
      return false;
    }
};
//checks if a rectangular object collides with rectangular object

var drawLuigi = function(x,y,z) {
     var LuigiStandingRight = [[0,0,0,0,0,2,2,2,2,2,0,0,0,0,0,0],
    [0,0,0,0,2,2,2,2,2,2,2,2,2,0,0,0],
    [0,0,0,0,1,1,1,3,3,1,3,0,0,0,0,0],
    [0,0,0,1,3,1,3,3,3,1,3,3,3,0,0,0],
    [0,0,0,1,3,1,1,3,3,3,1,3,3,3,0,0], 
    [0,0,0,1,1,3,3,3,3,1,1,1,1,0,0,0],
    [0,0,0,0,0,3,3,3,3,3,3,3,0,0,0,0],
    [0,0,0,0,1,1,2,1,1,1,1,0,0,0,0,0],
    [0,0,0,1,1,1,2,1,1,2,1,1,1,0,0,0],
    [0,0,1,1,1,1,2,1,1,2,1,1,1,1,0,0],
    [0,0,3,3,1,2,3,2,2,3,2,1,3,3,0,0],
    [0,0,3,3,3,2,2,2,2,2,2,3,3,3,0,0],
    [0,0,3,3,2,2,2,2,2,2,2,2,3,3,0,0],
    [0,0,0,0,2,2,2,0,0,2,2,2,0,0,0,0],
    [0,0,0,1,1,1,0,0,0,0,1,1,1,0,0,0],
    [0,0,1,1,1,1,0,0,0,0,1,1,1,1,0,0],];
                
    var LuigiRunningRight = [[0,0,0,0,0,2,2,2,2,2,0,0,0,0,0,0],
    [0,0,0,0,2,2,2,2,2,2,2,2,2,0,0,0],
    [0,0,0,0,1,1,1,3,3,1,3,0,0,0,0,0],
    [0,0,0,1,3,1,3,3,3,1,3,3,3,0,0,0],
    [0,0,0,1,3,1,1,3,3,3,1,3,3,3,0,0], 
    [0,0,0,1,1,3,3,3,3,1,1,1,1,0,0,0],
    [0,0,0,0,0,3,3,3,3,3,3,3,0,0,0,0],
    [0,0,0,0,1,1,1,1,2,1,0,3,0,0,0,0],
    [0,0,0,3,1,1,1,1,1,1,3,3,3,0,0,0],
    [0,0,3,3,2,1,1,1,1,1,3,3,0,0,0,0],
    [0,0,1,1,2,2,2,2,2,2,2,0,0,0,0,0],
    [0,0,1,2,2,2,2,2,2,2,2,0,0,0,0,0],
    [0,1,1,2,2,0,2,2,2,2,0,0,0,0,0,0],
    [0,1,0,0,0,2,2,2,2,0,0,0,0,0,0,0],
    [0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0],
    [0,0,0,0,0,1,1,1,1,1,0,0,0,0,0,0],
    ];
    
    var LuigiJumpingRight = [[0,0,0,0,0,2,2,2,2,2,0,0,3,3,3,0],
    [0,0,0,0,2,2,2,2,2,2,2,2,2,3,3,0],
    [0,0,0,0,1,1,1,3,3,1,3,0,1,1,1,0],
    [0,0,0,1,3,1,3,3,3,1,3,3,3,1,1,0],
    [0,0,0,1,3,1,1,3,3,3,1,3,3,3,1,0],
    [0,0,0,1,1,3,3,3,3,1,1,1,1,1,0,0],
    [0,0,0,0,0,3,3,3,3,3,3,3,1,0,0,0],
    [0,1,1,1,1,1,2,1,1,1,2,1,0,0,0,0],
    [3,3,1,1,1,1,1,2,1,1,1,2,0,0,0,1],
    [3,3,3,1,1,1,1,2,3,2,2,3,0,0,0,1],
    [3,3,0,0,2,1,2,2,2,2,2,2,2,2,1,1],
    [0,0,1,0,2,2,2,2,2,2,2,2,2,2,1,1],
    [0,1,1,1,2,2,2,2,2,2,2,2,2,2,1,1],
    [1,1,1,2,2,2,2,2,2,0,0,0,0,0,0,0],
    [1,0,0,2,2,2,2,0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
    ];
    
     var LuigiStandingLeft = [[0,0,0,0,0,0,2,2,2,2,2,0,0,0,0,0],
    [0,0,0,2,2,2,2,2,2,2,2,2,0,0,0,0],    
    [0,0,0,0,0,3,1,3,3,1,1,1,0,0,0,0],    
    [0,0,0,3,3,3,1,3,3,3,1,3,1,0,0,0],    
    [0,0,3,3,3,1,3,3,3,1,1,3,1,0,0,0],    
    [0,0,0,1,1,1,1,3,3,3,3,1,1,0,0,0],   
    [0,0,0,0,3,3,3,3,3,3,3,0,0,0,0,0],    
    [0,0,0,0,0,1,1,1,1,2,1,1,0,0,0,0],  
    [0,0,0,1,1,1,2,1,1,2,1,1,1,0,0,0],    
    [0,0,1,1,1,1,2,1,1,2,1,1,1,1,0,0],    
    [0,0,3,3,1,2,3,2,2,3,2,1,3,3,0,0],    
    [0,0,3,3,3,2,2,2,2,2,2,3,3,3,0,0],    
    [0,0,3,3,2,2,2,2,2,2,2,2,3,3,0,0],    
    [0,0,0,0,2,2,2,0,0,2,2,2,0,0,0,0],    
    [0,0,0,1,1,1,0,0,0,0,1,1,1,0,0,0],  
    [0,0,1,1,1,1,0,0,0,0,1,1,1,1,0,0],];
    
    var LuigiRunningLeft = [[0,0,0,0,0,0,2,2,2,2,2,0,0,0,0,0],
    [0,0,0,2,2,2,2,2,2,2,2,2,0,0,0,0], 
    [0,0,0,0,0,3,1,3,3,1,1,1,0,0,0,0],   
    [0,0,0,3,3,3,1,3,3,3,1,3,1,0,0,0],   
    [0,0,3,3,3,1,3,3,3,1,1,3,1,0,0,0],  
    [0,0,0,1,1,1,1,3,3,3,3,1,1,0,0,0],
    [0,0,0,0,3,3,3,3,3,3,3,0,0,0,0,0],
    [0,0,0,0,3,0,1,2,1,1,1,1,0,0,0,0],
    [0,0,0,3,3,3,1,1,1,1,1,1,3,0,0,0],
    [0,0,0,0,3,3,1,1,1,1,1,2,3,3,0,0],
    [0,0,0,0,0,2,2,2,2,2,2,2,1,1,0,0],
    [0,0,0,0,0,2,2,2,2,2,2,2,2,1,0,0], 
    [0,0,0,0,0,0,2,2,2,2,0,2,2,1,1,0],    
    [0,0,0,0,0,0,0,2,2,2,2,0,0,0,1,0],
    [0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0], 
    [0,0,0,0,0,0,1,1,1,1,1,0,0,0,0,0],];
    
    var LuigiJumpingLeft = [[0,3,3,3,0,0,2,2,2,2,2,0,0,0,0,0],
    [0,3,3,2,2,2,2,2,2,2,2,2,0,0,0,0],  
    [0,1,1,1,0,3,1,3,3,1,1,1,0,0,0,0],   
    [0,1,1,3,3,3,1,3,3,3,1,3,1,0,0,0],  
    [0,1,3,3,3,1,3,3,3,1,1,3,1,0,0,0],   
    [0,0,1,1,1,1,1,3,3,3,3,1,1,0,0,0],   
    [0,0,0,1,3,3,3,3,3,3,3,0,0,0,0,0],   
    [0,0,0,0,1,2,1,1,1,2,1,1,1,1,1,0],   
    [1,0,0,0,2,1,1,1,2,1,1,1,1,1,3,3],    
    [1,0,0,0,3,2,2,3,2,1,1,1,1,3,3,3],   
    [1,1,2,2,2,2,2,2,2,2,1,2,0,0,3,3],   
    [1,1,2,2,2,2,2,2,2,2,2,2,0,1,0,0],  
    [1,1,2,2,2,2,2,2,2,2,2,2,1,1,1,0],  
    [0,0,0,0,0,0,0,2,2,2,2,2,2,1,1,1],
    [0,0,0,0,0,0,0,0,0,2,2,2,2,0,0,1], 
    [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],];  
    
    var Luigi;
    if (char_frame === 1) {
        Luigi = LuigiStandingRight;
    }
    else if (char_frame === 2) {
        Luigi = LuigiRunningRight;
    }
    else if (char_frame === 3) {
        Luigi = LuigiJumpingRight;
    }
    else if (char_frame === 4) {
        Luigi = LuigiStandingLeft;
    }
    else if (char_frame === 5) {
        Luigi = LuigiRunningLeft;
    }
    else if (char_frame === 6) {
        Luigi = LuigiJumpingLeft;
    }

//sets the size of each "pixel"
var LuigiSize = z;
//sets the x and y placement of the sprite, useful if you want to move it around later
var LuigiX = x;
var LuigiY = y;

//Color 0: Transparent
//Color 1: Green
//Color 2: White
//Color 3: Orange
var LuigiColors = [color(0,0,0,1), color(46,138,1), color(255, 255, 255) ,color(237, 199, 142)];

//painting the sprite in two for loops - the outside for loop for the rows,
//the inside for loop for the columns
for (var r = 0; r < Luigi[0].length; r++)
        {
            for (var c = 0; c < Luigi.length; c++)
            {
                noStroke();
                //sets the fill colour according to the colors in the array
                fill(LuigiColors[Luigi[c][r]]);
                //draws the rectangle
                rect((r * LuigiSize) + LuigiX, (c * LuigiSize) + LuigiY,                           LuigiSize,
                    LuigiSize);
            }
        }
};
//draws Luigi

var keyPressed = function(){
    keys[keyCode] = true;
};
//registers a key as pressed

var keyReleased = function() {
    keys[keyCode] = false;
};
//registers a key as released

var drawAnimatedBackground = function(speed) {
        background(0, 0, 0); // 63, 96,150;
        for(var moving1 = -20; moving1 < 400+391; moving1+= 20){
            for(var moving2 = -20; moving2 < 605+96; moving2 += 20){
            fill(255, 0, 0);
            ellipse(moving1-round(menuAnimation/10%20),moving2+round(menuAnimation/10%20),1.3,1.3);
            }
        }
    menuAnimation+=speed; 
    // Speed of moving ellipses on main screen

};
//draws animated background

var enDrawWrd = function(en, x, y, size, color) {
    //controlls color (can be deleted)
    if(color === undefined||color > 63){color=48;}
    fill(palatte[color]);
    noStroke();
    size = size * 8;
    // calc cell size from letter size
    var s = floor(size/8);
    x = x * size;
    y = y * size;
    var code;
    var enLp2 = 0;
    for(var enLp = 0; enLp <= en.length-1; enLp+=1,enLp2+=1.07){
        switch(en.charAt(enLp)){
            case("A"):{code=enLetters[0];break;}
            case("B"):{code=enLetters[1];break;}
            case("C"):{code=enLetters[2];break;}
            case("D"):{code=enLetters[3];break;}
            case("E"):{code=enLetters[4];break;}
            case("F"):{code=enLetters[5];break;}
            case("G"):{code=enLetters[6];break;}
            case("H"):{code=enLetters[7];break;}
            case("I"):{code=enLetters[8];break;}
            case("J"):{code=enLetters[9];break;}
            case("K"):{code=enLetters[10];break;}
            case("L"):{code=enLetters[11];break;}
            case("M"):{code=enLetters[12];break;}
            case("N"):{code=enLetters[13];break;}
            case("O"):{code=enLetters[14];break;}
            case("P"):{code=enLetters[15];break;}
            case("Q"):{code=enLetters[16];break;}
            case("R"):{code=enLetters[17];break;}
            case("S"):{code=enLetters[18];break;}
            case("T"):{code=enLetters[19];break;}
            case("U"):{code=enLetters[20];break;}
            case("V"):{code=enLetters[21];break;}
            case("W"):{code=enLetters[22];break;}
            case("X"):{code=enLetters[23];break;}
            case("Y"):{code=enLetters[24];break;}
            case("Z"):{code=enLetters[25];break;}
            case("-"):{code=enLetters[26];break;}
            case("."):{code=enLetters[27];break;}
            case(","):{code=enLetters[28];break;}
            case("!"):{code=enLetters[29];break;}
            case("'"):{code=enLetters[30];break;}
            case("&"):{code=enLetters[31];break;}
            case("."):{code=enLetters[32];break;}
            case("0"):{code=enLetters[33];break;}
            case("1"):{code=enLetters[34];break;}
            case("2"):{code=enLetters[35];break;}
            case("3"):{code=enLetters[36];break;}
            case("4"):{code=enLetters[37];break;}
            case("5"):{code=enLetters[38];break;}
            case("6"):{code=enLetters[39];break;}
            case("7"):{code=enLetters[40];break;}
            case("8"):{code=enLetters[41];break;}
            case("9"):{code=enLetters[42];break;}
            case(" "):{code=enLetters[43];break;}
            case("|"):{
                switch(en.charAt(enLp+1)){
                    case("c"):{code=enLetters[44];enLp++;break;}
                }
            break;}
            case("?"):{code=enLetters[45];break;}
        }
        if (typeof code === "string" && code.length === 16){
            if (s<1){s=1;}
            // vert loop
            for (var i=0; i<8; i++){
                // get 2-byte hexidemal value
                var seg = parseInt(code.substr(i+i, 2), 16);
                var yy = y+(i*s);
                // horz loop
                for (var xx=x+(s*7*(enLp2+1)); xx>=0*(enLp2+1); xx-=s){
                    if(xx > width){xx=0;yy+=s;}
                    if (seg & 1){
                       rect(xx+-1, yy, s, s);
                    }
                    seg >>= 1;
                }
            }
        }
    }
};
//use this function to draw a string of text

var sceneHelp = function() {
    about = false;
    initEnLetters();
    scene = 0;
    background(0, 0, 0);
    fill(255, 255, 255); // white colour
    rect(25,25,550,550); // white box
    fill(0, 0, 0);
    noStroke();
    rect(47,502,111,50);
    stroke(0, 0, 0);
    fill(0, 0, 0); // black box (HOW TO PLAY)
    rect(217,36,172,43);
    fill(rainbowColor(frameCount*5)); //rainbows
    rect(80,346,40,40);
    enDrawWrd('HOW TO PLAY',9.6, 2.2, 2.9,-1);
    enDrawWrd('BACK',2.36, 21.5,3,15);
    enDrawWrd('X',3.66, 8.1,3,14);
    if (mouseX > 47 && mouseY > 502 && mouseX < 157 && mouseY < 552) {
        enDrawWrd('BACK',2.36, 21.5,3,34);
        mouseClicked = function() {
            if (mouseX > 47 && mouseY > 502 && mouseX < 157 && mouseY < 552) {
                scene = 1;
                playSound(getSound("rpg/metal-clink"));
            }
        };
    }
    boo_frame = 2; //boo facing direction
    draw_boo(78,400,3);
    portal_blue(65,272,2);
    portal_orange(101,272,2);
    strokeWeight(3);
    stroke(0, 0, 0);
    {
    rect(83,95,35,35);
    rect(83,140,35,35);
    rect(83,(140-95)+140,35,35);
    rect(38,((140-95)+140)+((140-95)+140)-140,128,35);
    fill(0, 255, 247);
    arrowX = 63;
    arrowY = -72;
    triangle(arrowX+30,arrowY+241,arrowX+50,arrowY+229,arrowX+30,arrowY+218);
    triangle((arrowX+17)+30,-117+241,(arrowX+18)+10,-117+229,(arrowX+19)+28,-117+218);
    
    } // main control rectangle / shapes
    fill(0, 0, 0);
    {
    var fantasy = createFont("monospace"); // font
    textFont(fantasy,23); // Controls explanation font size
    text("Hold to move left!",135,103,33333,33333);
    text("Hold to move right!",135,147,33333,33333);
    text("Hold to enter portals!",135,193,33333,33333);
    text("Hold to levitate!",180,237,33333,33333);
    textFont(fantasy,20); //Spacebar + X font size
    text("Spacebar",59,239,33333,33333);
    textFont(fantasy,15); // Smaller font size for more space
    text("These send you back to the start. 99% are visible\nwhile others are hidden as traps. Stay away from\nthe blue and rainbows! The white blocks are safe.",144,344,33333,33333);
    text("Boo! Stay away these, they send you back to the\nstart of a level.",144,411,33333,33333);
    text("Entering blue portals allow you to come out of\nother blue portals, but you can't go back. Orange\nportals send you to the next level!",144,281,33333,33333);
    } //text + font (monospace)
  
};
//Scene 0: Help menu

var drawSceneOne = function() {
    scene = 1;
    fill(255, 0, 0);
    if (start === true) {
        widthHeight+=15;
    }
    if (about === true) {
        scene = 0;
    }
    {
    drawAnimatedBackground(3);
    rect(300,184,1,435);
    noStroke();
    fill(255, 0, 255);
    rect(152,67,300,67);
    fill(0, 140, 255);
    rect(54,130,500,67);
    drawWords('LUIGI',220,81,33, 43);
    drawWords('LOST DIMENSIONS',66,144,32, 31);
    rect(200,250,200,60);
    rect(200,346,200,60);
    drawWords('START',223,262,32, 30);
    drawWords('ABOUT',223,357,32, 30);
    fill(255, 255, 255);
    triangle(arrowX+35,arrowY+260,arrowX+84,arrowY+230,arrowX+35,arrowY+203);
        } // on screen elements
    if (mouseX > 200 && mouseY > 248 && mouseX < 399 && mouseY < 309) {
        arrowX = 85;
        arrowY = 47;
        drawWords('START',223,262,32, 42);
        mouseClicked = function() {
            if (scene === 1 && mouseX > 200 && mouseY > 248 && mouseX < 399 && mouseY < 309) {
                if (widthHeight < 3) {
                    playSound(getSound("rpg/battle-spell"));
                }
                        start = true;
            }
        };
    }
    else if (mouseX > 200 && mouseY > 345 && mouseX < 399 && mouseY < 405) {
        arrowX = 85;
        arrowY = 143;
        drawWords('ABOUT',223,357,32, 42);
        mouseClicked = function() {
            if (scene === 1 && mouseX > 200 && mouseY > 345 && mouseX < 399 && mouseY < 405) {
                about = true;
                playSound(getSound("rpg/metal-clink"));
            }
        };
    }
        else {
            arrowX = -102;
            arrowY = -72;
        }
        fill(3, 3, 3);
        ellipse(300,300,widthHeight,widthHeight);
        if (widthHeight > 2000) {
            scene = 2;
        } // circle transition effect
};
//Scene 1: Main menu

var drawSceneTwo = function() {
    scene = 2;
    var widthHeight = 0; // the transition circle is now hidden
    initEnLetters();
    mouseClicked = function() {
        if (mouseClicked && scene === 2) {
            scene = 3;
            playSound(getSound("retro/whistle2"));
        }
    }; 
    background(0, 0, 0);
    fill(255, 0, 0);
    fill(255, 255, 255);
    rect(boxX+32,boxY+434,536,125);
    text_timer++;
    ellipse(300,300,widthHeight,widthHeight);
    if (text_timer > 20) {
        enDrawWrd('.', talkX+2.1, talkY+20.3, 2.9,14);
    }  //.
    if (text_timer > 30) {
        enDrawWrd('.', talkX+2.74, talkY+20.3, 2.9,14);
    }  //.
    if (text_timer > 40) {
        enDrawWrd('.', talkX+3.4, talkY+20.3, 2.9,14);
    }  //.
    if (text_timer > 50) {
        enDrawWrd('Y', talkX+4.05, talkY+20.3, 2.9,14);
    }  //Y
    if (text_timer > 60) {
        enDrawWrd('O', talkX+4.69, talkY+20.3, 2.9,14);
    }  //O
    if (text_timer > 70) {
        enDrawWrd('U', talkX+5.36, talkY+20.3, 2.9,14);
    }  //U
    if (text_timer > 80) {
        enDrawWrd('A', talkX+6.63, talkY+20.3, 2.9,14);
    }  //A
    if (text_timer > 90) {
        enDrawWrd('W', talkX+7.27, talkY+20.3, 2.9,14);
    }  //W
    if (text_timer > 100) {
        enDrawWrd('A', talkX+7.94, talkY+20.3, 2.9,14);
    } //A
    if (text_timer > 110) {
        enDrawWrd('K', talkX+8.58, talkY+20.3, 2.9,14);
    } //K
    if (text_timer > 120) {
        enDrawWrd('E', talkX+9.23, talkY+20.3, 2.9,14);
    } //E
    if (text_timer > 130) {
        enDrawWrd('?', talkX+9.82, talkY+20.3, 2.9,14);
    } //?
    if (text_timer > 210) {
        fill(255, 255, 255);
        rect(boxX+32,boxY+434,536,125);
    } // NEW TEXT BOX
    if (text_timer > 220) {
        enDrawWrd('I', talkX+2.1, talkY+20.3, 2.9,14);
    } //I
    if (text_timer > 230) {
        enDrawWrd('N', talkX+3.4, talkY+20.3, 2.9,14);
    } //N
    if (text_timer > 240) {
        enDrawWrd('E', talkX+4.05, talkY+20.3, 2.9,14);
    } //E
    if (text_timer > 250) {
        enDrawWrd('E', talkX+4.7, talkY+20.3, 2.9,14);
    } //E
    if (text_timer > 260) {
        enDrawWrd('D', talkX+5.35, talkY+20.3, 2.9,14);
    } //D
    if (text_timer > 270) {
            enDrawWrd('Y', talkX+6.64, talkY+20.3, 2.9,14);
        } //Y
    if (text_timer > 280) {
        enDrawWrd('O', talkX+7.28, talkY+20.3, 2.9,14);
    } //O
    if (text_timer > 290) {
        enDrawWrd('U', talkX+7.92, talkY+20.3, 2.9,14);
    } //U
    if (text_timer > 300) {
        enDrawWrd('T', talkX+9.21, talkY+20.3, 2.9,14);
    } //T
    if (text_timer > 310) {
        enDrawWrd('O', talkX+9.81, talkY+20.3, 2.9,14);
    } //O
    if (text_timer > 320) {
        enDrawWrd('L', talkX+11.13, talkY+20.3, 2.9,14);
    } //L
    if (text_timer > 330) {
        enDrawWrd('I', talkX+11.75, talkY+20.3, 2.9,14);
    } //I
    if (text_timer > 340) {
        enDrawWrd('S', talkX+12.40, talkY+20.3, 2.9,14);
    } //S
    if (text_timer > 350) {
        enDrawWrd('T', talkX+13.05, talkY+20.3, 2.9,14);
    } //T
    if (text_timer > 360) {
        enDrawWrd('E', talkX+13.708, talkY+20.3, 2.9,14);
    } //E
    if (text_timer > 370) {
        enDrawWrd('N', talkX+14.36, talkY+20.3, 2.9,14);
    } //N
    if (text_timer > 380) {
        enDrawWrd('C', talkX+15.63, talkY+20.3, 2.9,14);
    } //C
    if (text_timer > 390) {
        enDrawWrd('A', talkX+16.30, talkY+20.3, 2.9,14);
    } //A
    if (text_timer > 400) {
        enDrawWrd('R', talkX+16.95, talkY+20.3, 2.9,14);
    } //R
    if (text_timer > 410) {
        enDrawWrd('E', talkX+17.60, talkY+20.3, 2.9,14);
    } //E
    if (text_timer > 420) {
        enDrawWrd('F', talkX+18.24, talkY+20.3, 2.9,14);
    } //F
    if (text_timer > 430) {
        enDrawWrd('U', talkX+18.86, talkY+20.3, 2.9,14);
    } //U
    if (text_timer > 440) {
        enDrawWrd('L', talkX+19.54, talkY+20.3, 2.9,14);
    } //L
    if (text_timer > 450) {
        enDrawWrd('L', talkX+20.19, talkY+20.3, 2.9,14);
    } //L
    if (text_timer > 460) {
        enDrawWrd('Y', talkX+20.83, talkY+20.3, 2.9,14);
    } //Y
    if (text_timer > 470) {
        enDrawWrd('.', talkX+21.46, talkY+20.3, 2.9,14);
    } //.
    if (text_timer > 550) {
        fill(255, 255, 255);
        rect(boxX+32,boxY+434,536,125);
    } // NEW TEXT BOX
    if (text_timer > 560) {
        enDrawWrd('Y', talkX+2.1, talkY+20.3, 2.9,14);
    } //Y
    if (text_timer > 570) {
        enDrawWrd('O', talkX+2.77, talkY+20.3, 2.9,14);
    } //O
    if (text_timer > 580) {
        enDrawWrd('U', talkX+3.40, talkY+20.3, 2.9,14);
    } //U
    if (text_timer > 590) {
        enDrawWrd('A', talkX+4.68, talkY+20.3, 2.9,14);
    } //A
    if (text_timer > 600) {
        enDrawWrd('R', talkX+5.34, talkY+20.3, 2.9,14);
    } //R
    if (text_timer > 610) {
        enDrawWrd('E', talkX+5.99, talkY+20.3, 2.9,14);
    } //E
    if (text_timer > 620) {
        enDrawWrd('I', talkX+7.27, talkY+20.3, 2.9,14);
    } //I
    if (text_timer > 630) {
        enDrawWrd('N', talkX+7.92, talkY+20.3, 2.9,14);
    } //N
    if (text_timer > 640) {
        enDrawWrd('T', talkX+9.23, talkY+20.3, 2.9,14);
    } //T
    if (text_timer > 650) {
        enDrawWrd('H', talkX+9.81, talkY+20.3, 2.9,14);
    } //H
    if (text_timer > 660) {
        enDrawWrd('E', talkX+10.49, talkY+20.3, 2.9,14);
    } //E
    if (text_timer > 670) {
        enDrawWrd('W', talkX+11.75, talkY+20.3, 2.9,14);
    } //W
    if (text_timer > 680) {
        enDrawWrd('R', talkX+12.41, talkY+20.3, 2.9,14);
    } //R
    if (text_timer > 690) {
        enDrawWrd('O', talkX+13.05, talkY+20.3, 2.9,14);
    } //O
    if (text_timer > 700) {
        enDrawWrd('N', talkX+13.71, talkY+20.3, 2.9,14);
    } //N
    if (text_timer > 710) {
        enDrawWrd('G', talkX+14.34, talkY+20.3, 2.9,14);
    } //G
    if (text_timer > 720) {
        enDrawWrd('D', talkX+15.63, talkY+20.3, 2.9,14);
    } //D
    if (text_timer > 730) {
        enDrawWrd('I', talkX+16.29, talkY+20.3, 2.9,14);
    } //I
    if (text_timer > 740) {
        enDrawWrd('M', talkX+16.95, talkY+20.3, 2.9,14);
    } //M
    if (text_timer > 750) {
        enDrawWrd('E', talkX+17.59, talkY+20.3, 2.9,14);
    } //E
    if (text_timer > 760) {
        enDrawWrd('N', talkX+18.23, talkY+20.3, 2.9,14);
    } //N
    if (text_timer > 770) {
        enDrawWrd('S', talkX+18.87, talkY+20.3, 2.9,14);
    } //S
    if (text_timer > 780) {
        enDrawWrd('I', talkX+19.52, talkY+20.3, 2.9,14);
    } //I
    if (text_timer > 790) {
        enDrawWrd('O', talkX+20.16, talkY+20.3, 2.9,14);
    } //O
    if (text_timer > 800) {
        enDrawWrd('N', talkX+20.80, talkY+20.3, 2.9,14);
    } //N
    if (text_timer > 810) {
        enDrawWrd('.', talkX+21.46, talkY+20.3, 2.9,14);
    } //.
    if (text_timer > 820) {
        enDrawWrd('.', talkX+22.11, talkY+20.3, 2.9,14);
    } //.
    if (text_timer > 830) {
        enDrawWrd('.', talkX+22.74, talkY+20.3, 2.9,14);
    } //.
    if (text_timer > 910) {
        fill(255, 255, 255);
        rect(boxX+32,boxY+434,536,125);
    } // NEW TEXT BOX
    if (text_timer > 920) {
        enDrawWrd('Y', talkX+2.1, talkY+20.3, 2.9,14);
    } //Y
    if (text_timer > 930) {
        enDrawWrd('O', talkX+2.77, talkY+20.3, 2.9,14);
    } //O
    if (text_timer > 940) {
        enDrawWrd('U', talkX+3.40, talkY+20.3, 2.9,14);
    } //U
    if (text_timer > 950) {
        enDrawWrd('A', talkX+4.68, talkY+20.3, 2.9,14);
    } //A
    if (text_timer > 960) {
        enDrawWrd('R', talkX+5.34, talkY+20.3, 2.9,14);
    } //R
    if (text_timer > 970) {
        enDrawWrd('E', talkX+5.99, talkY+20.3, 2.9,14);
    } //E
    if (text_timer > 980) {
        enDrawWrd('T', talkX+7.27, talkY+20.3, 2.9,14);
    } //T
    if (text_timer > 990) {
        enDrawWrd('O', talkX+7.92, talkY+20.3, 2.9,14);
    } //O
    if (text_timer > 1000) {
        enDrawWrd('O', talkX+8.58, talkY+20.3, 2.9,14);
    } //O
    if (text_timer > 1010) {
        enDrawWrd('F', talkX+9.82, talkY+20.3, 2.9,14);
    } //F
    if (text_timer > 1020) {
        enDrawWrd('R', talkX+10.49, talkY+20.3, 2.9,14);
    } //R
    if (text_timer > 1030) {
        enDrawWrd('A', talkX+11.12, talkY+20.3, 2.9,14);
    } //A
    if (text_timer > 1040) {
        enDrawWrd('G', talkX+11.75, talkY+20.3, 2.9,14);
    } //G
    if (text_timer > 1050) {
        enDrawWrd('I', talkX+12.41, talkY+20.3, 2.9,14);
    } //I
    if (text_timer > 1060) {
        enDrawWrd('L', talkX+13.04, talkY+20.3, 2.9,14);
    } //L
    if (text_timer > 1070) {
        enDrawWrd('E', talkX+13.72, talkY+20.3, 2.9,14);
    } //E
    if (text_timer > 1080) {
        enDrawWrd('T', talkX+14.98, talkY+20.3, 2.9,14);
    } //T
    if (text_timer > 1090) {
        enDrawWrd('O', talkX+15.64, talkY+20.3, 2.9,14);
    } //O
    if (text_timer > 1110) {
        enDrawWrd('E', talkX+16.94, talkY+20.3, 2.9,14);
    } //E
    if (text_timer > 1120) {
        enDrawWrd('X', talkX+17.57, talkY+20.3, 2.9,14);
    } //X
    if (text_timer > 1130) {
        enDrawWrd('I', talkX+18.22, talkY+20.3, 2.9,14);
    } //I
    if (text_timer > 1140) {
        enDrawWrd('S', talkX+18.86, talkY+20.3, 2.9,14);
    } //S
    if (text_timer > 1150) {
        enDrawWrd('T', talkX+19.52, talkY+20.3, 2.9,14);
    } //T
    if (text_timer > 1160) {
        enDrawWrd('H', talkX+20.81, talkY+20.3, 2.9,14);
    } //H
    if (text_timer > 1170) {
        enDrawWrd('E', talkX+21.46, talkY+20.3, 2.9,14);
    } //E
    if (text_timer > 1180) {
        enDrawWrd('R', talkX+22.11, talkY+20.3, 2.9,14);
    } //R
    if (text_timer > 1190) {
        enDrawWrd('E', talkX+22.75, talkY+20.3, 2.9,14);
    } //E
    if (text_timer > 1200) {
        enDrawWrd('.', talkX+23.40, talkY+20.3, 2.9,14);
    } //.
    if (text_timer > 1300) {
        enDrawWrd('I', talkX+2.1, talkY+21.8, 2.9,14);
    } //I
    if (text_timer > 1310) {
        enDrawWrd('F', talkX+2.75, talkY+21.8, 2.9,14);
    } //F
    if (text_timer > 1320) {
        enDrawWrd('Y', talkX+4.05, talkY+21.8, 2.9,14);
    } //Y
    if (text_timer > 1330) {
        enDrawWrd('O', talkX+4.70, talkY+21.8, 2.9,14);
    } //O
    if (text_timer > 1340) {
        enDrawWrd('U', talkX+5.35, talkY+21.8, 2.9,14);
    } //U
    if (text_timer > 1350) {
        enDrawWrd('D', talkX+6.62, talkY+21.8, 2.9,14);
    } //D
    if (text_timer > 1360) {
        enDrawWrd('O', talkX+7.27, talkY+21.8, 2.9,14);
    } //O
    if (text_timer > 1370) {
        enDrawWrd('N', talkX+8.56, talkY+21.8, 2.9,14);
    } //N
    if (text_timer > 1380) {
        enDrawWrd('O', talkX+9.24, talkY+21.8, 2.9,14);
    } //O
    if (text_timer > 1390) {
        enDrawWrd('T', talkX+9.81, talkY+21.8, 2.9,14);
    } //T
    if (text_timer > 1400) {
        enDrawWrd('E', talkX+11.11, talkY+21.8, 2.9,14);
    } //E
    if (text_timer > 1410) {
        enDrawWrd('S', talkX+11.76, talkY+21.8, 2.9,14);
    } //S
    if (text_timer > 1420) {
        enDrawWrd('C', talkX+12.42, talkY+21.8, 2.9,14);
    } //C
    if (text_timer > 1430) {
        enDrawWrd('A', talkX+13.04, talkY+21.8, 2.9,14);
    } //A
    if (text_timer > 1440) {
        enDrawWrd('P', talkX+13.69, talkY+21.8, 2.9,14);
    } //P
    if (text_timer > 1450) {
        enDrawWrd('E', talkX+14.34, talkY+21.8, 2.9,14);
    } //E
    if (text_timer > 1460) {
        enDrawWrd('Y', talkX+15.63, talkY+21.8, 2.9,14);
    } //Y
    if (text_timer > 1470) {
        enDrawWrd('O', talkX+16.28, talkY+21.8, 2.9,14);
    } //O
    if (text_timer > 1480) {
        enDrawWrd('U', talkX+16.92, talkY+21.8, 2.9,14);
    } //U
    if (text_timer > 1490) {
        enDrawWrd('W', talkX+18.24, talkY+21.8, 2.9,14);
    } //W
    if (text_timer > 1500) {
        enDrawWrd('I', talkX+18.86, talkY+21.8, 2.9,14);
    } //I
    if (text_timer > 1510) {
        enDrawWrd('L', talkX+19.51, talkY+21.8, 2.9,14);
    } //L
    if (text_timer > 1520) {
        enDrawWrd('L', talkX+20.17, talkY+21.8, 2.9,14);
    } //L
    if (text_timer > 1530) {
        enDrawWrd('D', talkX+21.47, talkY+21.8, 2.9,22);
    } //D
    if (text_timer > 1540) {
        enDrawWrd('I', talkX+22.11, talkY+21.8, 2.9,22);
    } //I
    if (text_timer > 1550) {
        enDrawWrd('E', talkX+22.75, talkY+21.8, 2.9,22);
    } //E
    if (text_timer > 1560) {
        enDrawWrd('!', talkX+23.42, talkY+21.8, 2.9,14);
    } //!
    if (text_timer > 1640) {
        fill(255, 255, 255);
        rect(boxX+32,boxY+434,536,125);
    } // NEW TEXT BOX
    if (text_timer > 1650) {
        enDrawWrd('I', talkX+2.1, talkY+20.3, 2.9,14);
    } //I
    if (text_timer > 1660) {
        enDrawWrd('W', talkX+3.42, talkY+20.3, 2.9,14);
    } //W
    if (text_timer > 1670) {
        enDrawWrd('I', talkX+4.04, talkY+20.3, 2.9,14);
    } //I
    if (text_timer > 1680) {
        enDrawWrd('L', talkX+4.68, talkY+20.3, 2.9,14);
    } //L
    if (text_timer > 1690) {
            enDrawWrd('L', talkX+5.33, talkY+20.3, 2.9,14);
    } //L
    if (text_timer > 1700) {
        enDrawWrd('G', talkX+6.63, talkY+20.3, 2.9,14);
    } //G
    if (text_timer > 1710) {
        enDrawWrd('U', talkX+7.28, talkY+20.3, 2.9,14);
    } //U
    if (text_timer > 1720) {
        enDrawWrd('I', talkX+7.92, talkY+20.3, 2.9,14);
    } //I
    if (text_timer > 1730) {
        enDrawWrd('D', talkX+8.58, talkY+20.3, 2.9,14);
    } //D
    if (text_timer > 1740) {
        enDrawWrd('E', talkX+9.23, talkY+20.3, 2.9,14);
    } //E
    if (text_timer > 1750) {
        enDrawWrd('Y', talkX+10.47, talkY+20.3, 2.9,14);
    } //Y
    if (text_timer > 1760) {
        enDrawWrd('O', talkX+11.10, talkY+20.3, 2.9,14);
    } //O
    if (text_timer > 1770) {
        enDrawWrd('U', talkX+11.75, talkY+20.3, 2.9,14);
    } //U
    if (text_timer > 1780) {
        enDrawWrd('/.', talkX+11.75, talkY+20.3, 2.9,14);
    } //.
    if (text_timer > 1880) {
        enDrawWrd('L', talkX+2.1, talkY+21.8, 2.9,14);
    } //L
    if (text_timer > 1890) {
        enDrawWrd('/E', talkX+2.1, talkY+21.8, 2.9,14);
    } //E
    if (text_timer > 1900) {
        enDrawWrd('//T', talkX+2.1, talkY+21.8, 2.9,14);
    } //T
    if (text_timer > 1910) {
        enDrawWrd('///S', talkX+2.1, talkY+21.8, 2.9,14);
    } //S
    if (text_timer > 1920) {
        enDrawWrd('/////B', talkX+2.1, talkY+21.8, 2.9,14);
    } //B
    if (text_timer > 1920) {
        enDrawWrd('//////E', talkX+2.1, talkY+21.8, 2.9,14);
    } //E
    if (text_timer > 1930) {
            enDrawWrd('///////G', talkX+2.1, talkY+21.8, 2.9,14);
        } //G
    if (text_timer > 1940) {
        enDrawWrd('////////I', talkX+2.1, talkY+21.8, 2.9,14);
    } //I
    if (text_timer > 1950) {
        enDrawWrd('/////////N', talkX+2.1, talkY+21.8, 2.9,14);
    } //N
    if (text_timer > 1960) {
        enDrawWrd('///////////S', talkX+2.1, talkY+21.8, 2.9,14);
    } //S
    if (text_timer > 1970) {
        enDrawWrd('////////////H', talkX+2.1, talkY+21.8, 2.9,14);
    } //H
    if (text_timer > 1980) {
        enDrawWrd('/////////////A', talkX+2.1, talkY+21.8, 2.9,14);
    } //A
    if (text_timer > 1990) {
        enDrawWrd('//////////////L', talkX+2.1, talkY+21.8, 2.9,14);
    } //L
    if (text_timer > 2000) {
        enDrawWrd('///////////////L', talkX+2.1, talkY+21.8, 2.9,14);
    } //L
    if (text_timer > 2010) {
        enDrawWrd('/////////////////W', talkX+2.1, talkY+21.8, 2.9,14);
    } //W
    if (text_timer > 2020) {
        enDrawWrd('//////////////////E', talkX+2.1, talkY+21.8, 2.9,14);
    } //W
    if (text_timer > 2030) {
        enDrawWrd('///////////////////?', talkX+2.1, talkY+21.8, 2.9,14);
    } //W
    if (text_timer > 2150) {
        playSound(getSound("rpg/metal-chime"));
        scene = 3;
        text_timer = 0;
    }
    enDrawWrd('?????', talkX+2.1, talkY+19.8, 2.8,20);
};
//Scene 2: Introduction

var drawSceneThree = function() {
    scene = 3;
    if (scene === 3) {
        initEnLetters();
        background(0, 0, 0);
        {
        fill(1,138,141);
        rect(0,234,251,46);
        fill(255, 255, 255);
        rect(0,0,607,46);
        rect(0,186,607,46);
        rect(0,280,134,49);
        rect(0,524,611,46);
        rect(205,280,46,248);
        rect(241,233,10,47);
        } // objects (blocks)
        {
        drawWords('?',0,462,60,19);
        drawWords('?',147,462,60,19);
        drawWords('?',18,130,60,19);
        } // ? marks
        {
        fill(0, 174, 255);
        portal_blue(471,94,3);
        portal_blue(471,434,3);
        portal_orange(274,434,3);
        drawLuigi(charX,charY+474,3);
        } // portals + Luigi
        if (charX > -5 && charX < 30 && charY < 22 && charY > -30 ) {
            fill(255, 255, 255);
            rect(100,73,400,96);
            drawWords('?????',talkX+111,talkY+80,25,20);
            drawWords('MOVE WITH THE LEFT AND',talkX+111,talkY+108,17,14);
            drawWords('RIGHT ARROW KEYS!',talkX+111,talkY+132,17,14);
        } // ? text
        if (charX > 126 && charX < 186 && charY > -48) {
            fill(255, 255, 255);
            rect(100,73,400,96);
            drawWords('?????',talkX+111,talkY+80,25,20);
            drawWords('HOLD SPACE TO LEVIATE!',talkX+111,talkY+115,17,14);
        }
        // ? text
        if (charX > -8 && charX < 40 && charY < -324 && charY > -380) {     
            talkX = 0;
            talkY = 211;
            fill(255, 255, 255);
            rect(talkX+100,talkY+73,400,128);
            drawWords('?C???',talkX+111,talkY+80,25,20);
            drawWords('STAY AWAY FROM THE BLUE',talkX+111,talkY+108,17,14);
            drawWords('BRICKS! HUMANS LIKE YOU',talkX+111,talkY+132,17,14);
            drawWords('CANT TOUCH THEM :(',talkX+111,talkY+156,17,14);
        }
        if (charX > 443 && charX < 503 && charY < -324 && charY > -380) {
            talkX = 0;
            talkY = 211;
            fill(255, 255, 255);
            rect(talkX+100,talkY+73,400,128);
            drawWords('?C?2?',talkX+111,talkY+80,25,20);
            drawWords('PRESS X TO GO THROUGH',talkX+111,talkY+108,17,14);
            drawWords('BLUE PORTALS. REMEMBER, ',talkX+111,talkY+132,17,14);
            drawWords('THEY ARE ONLY ONE WAY.',talkX+111,talkY+156,17,14);
        }
        if (charX > 247 && charX < 310 && charY < 22 && charY > -30) {
            talkX = 0;
            talkY = 154;
            fill(255, 255, 255);
            rect(talkX+100,talkY+73,400,138);
            drawWords('?CS??',talkX+111,talkY+80,25,20);
            drawWords('PRESS X TO GO THROUGH',talkX+111,talkY+108,17,14);
            drawWords('ORANGE PORTALS. THESE ',talkX+111,talkY+132,17,14);
            drawWords('ALLOW YOU TO GO TO THE',talkX+111,talkY+156,17,14);
                        drawWords('NEXT LEVEL!',talkX+111,talkY+180,17,14);
        }
        if (checkHit(charX+3,charY+474,41,49,0,523,600,1)) {
            jumping = false;
            charY = 0;
        }         // object collision 
        if (checkHit(charX+3,charY+474,41,49,203,283,1,239)) {
            charX = 160;
        }       // object collision 
        if (checkHit(charX+3,charY+474,41,49,0,0,1,600)) {
            charX = -2;
        } 
        // object collision 
        if (checkHit(charX+3,charY+474,41,49,600,0,1,600)) {
            charX = 557;
        } 
        // object collision 
        if (checkHit(charX+3,charY+474,41,49,0,330,125,1)) {
            charY = -143; 
        }
        // object collision 
        if (checkHit(charX+3,charY+474,41,49,135,282,1,45)) {
            charX = 134;
        }
        // object collision 
        if (checkHit(charX+3,charY+474,41,49,144,282,52,1)) {
            charY = -350;
            charX = 20;
            playSound(getSound("retro/boom2"));
        }
        // object collision 
        if (checkHit(charX+3,charY+474,41,49,0,184,600,1)) {
            jumping = false;
            charY = -338;
            charSpeed = 5;
        }
        // object collision 
        else {
            charSpeed = 3;
        } // charSpeed = 3, moves faster if on the floor
        //white floor
        if (checkHit(charX+3,charY+474,41,49,472,99,52,86)) {
            if (keys[88]) {
                charY = 0;
                playSound(getSound("retro/laser4"));
            }
        }
        // portal collision
        if (checkHit(charX+3,charY+474,41,49,247,242,1,287)) {
            charX = 247;
        } // object collision 
        if (checkHit(charX+3,charY+474,41,49,247,230,400,1)) {
            charY = -240;
        } // object collision
        if (checkHit(charX+3,charY+474,41,49,0,44,600,1)) {
            charY = -428;
        } // object collision 
        if (checkHit(charX+3,charY+474,41,49,276,440,52,86)) {
            if (keys[88]) {
                scene = 4;
                playSound(getSound("rpg/door-open"));
            }
        } // portal collision
        if (keys[32]) {
            char_frame = 3;
            charY -= jumpSpeed;
            jumping = true;
            if (direction === 0) {
            char_frame = 6;
        }
            if (direction === 1) {
                char_frame = 3;
        }
        } // Luigi levitates
        if (!keys[32]) {
            charY+=jumpSpeed;
        } // Luigi descends
    }
};
//Scene 3: Tutorial pt. 1

var drawSceneFour = function() {
    scene = 4;
    charSpeed = 1; 
    jumpSpeed = 1;
    background(0, 0, 0);
    drawWords('?',169,55,60,22);
    drawWords('?',63,296,60,19);
    fill(255, 0, 0);
    booY += booSpeed; // boo moves vertically by booSpeed
    boo2X += boo2Speed; // boo2 moves horizontally by boo2Speed
    boo3X -= boo3Speed; // boo3 moves horizontally by boo3Speed
    if (booY > 50) {
        booSpeed = -0.5;
    } // back and forth movements
    if (booY < 0) {
        booSpeed = 0.5;
    } // back and forth movements
    if (boo2X > 132) {
        boo2Speed = -1;
    } // back and forth movements
    if (boo2X < -46) {
        boo2Speed = 1;
    } // back and forth movements
    if (boo3X > 280) {
        boo3Speed = 1.2;
    } // back and forth movements
    if (boo3X < 110) {
        boo3Speed = -1.2;
    } // back and forth movements
    {
    fill(255, 0, 0);
    fill(1,138,141);
    rect(589,23,20,600);
    rect(40,432,282,43);
    rect(318,433,270,41);
    rect(135,295,225,41);
    rect(318,271,42,67);
    fill(255, 255, 255);
    rect(0,125,321,34);
    rect(0,0,600,26);
    rect(0,569,600,34);
    rect(0,0,600,26);
    rect(-1,23,46,600);
    rect(318,23,42,248);
    } // obstacles
    drawLuigi(charX-170,charY+75,3);
    draw_boo(booX+255,booY+31,3); 
    draw_boo(boo2X+407,182,3);
    draw_boo(boo3X+255,314,3);
    portal_blue(64,33,3);
    portal_blue(439,33,3);
    portal_orange(242,185,3);

    if (checkHit(charX-170,charY+75,41,49,65,39,52,86)) {
        if (keys[88]) {
            charX = 610;
            playSound(getSound("retro/laser4"));
        }
    }
    // portal blue
    if (checkHit(charX-170,charY+75,41,49,booX+255,booY+31,50,50)) {
        playSound(getSound("retro/boom2"));
        charX = 308;
        charY = 4;
    } // BOO #1
    if (checkHit(charX-170,charY+75,41,49,boo2X+407,182,(16*3),(16*3))) {
        playSound(getSound("retro/boom2"));
        charX = 308;
        charY = 4;
    } // BOO #2
    if (checkHit(charX-170,charY+75,41,49,589,23,20,600)) {
        playSound(getSound("retro/boom2"));
        charX = 308;
        charY = 4;
    }
    //blue walls

    if (checkHit(charX-170,charY+75,41,49,136,295,225,43)) {
        playSound(getSound("retro/boom2"));
        charX = 308;
        charY = 4;
    }
    //blue walls
    if (checkHit(charX-170,charY+75,41,49,40,432,282,43)) {
        playSound(getSound("retro/boom2"));
        charX = 308;
        charY = 4;
    }
    // blue tiles / wall
    if (checkHit(charX-170,charY+75,41,49,323,433,258,43)) {
        playSound(getSound("retro/boom2"));
        charX = 308;
        charY = 4;
    }
    if (checkHit(charX-170,charY+75,41,49,boo3X+255,314,(16*3),(16*3))) {
        playSound(getSound("retro/boom2"));
        charX = 308;
        charY = 4;
    } // BOO #3
    if (checkHit(charX-170,charY+75,41,49,177,62,41,42)) {
            talkX = 0;
            talkY = 211;
            fill(255, 255, 255);
            rect(talkX+100,talkY+73,400,128);
            drawWords('IC?2?',talkX+111,talkY+80,25,20);
            drawWords('STAY AWAY FROM BOOS!',talkX+111,talkY+108,17,14);
            drawWords('THEY WILL SEND YOU BACK',talkX+111,talkY+132,17,14);
            drawWords('TO THE START.',talkX+111,talkY+156,17,14);
    }
    // ?
    if (checkHit(charX-170,charY+75,41,49,70,303,41,42)) {
            talkX = 0;
            talkY = 0;
            fill(255, 255, 255);
            rect(talkX+100,talkY+73,400,128);
            drawWords('IC?2O',talkX+111,talkY+80,25,20);
            drawWords('A FAST LEARNER I SEE! :)',talkX+111,talkY+108,17,14);
            drawWords('KEEP IT UP, IM',talkX+111,talkY+ 132,17,14);
            drawWords('RUNNING OUT OF TIME! :(',talkX+111,talkY+156,17,6);
    }
    if (checkHit(charX-170,charY+75,41,49,51,125,257,1)) {
        jumping = false;
        charY = 1;
    }
    // floor
    if (checkHit(charX-170,charY+75,41,49,46,36,1,520)) {
        charX = 220;
    }
    // outerleft wall
    if (checkHit(charX-170,charY+75,41,49,58,24,517,1)) {
        charY = -50;
     }
    //uppermost ceiling wall
    if (checkHit(charX-170,charY+75,41,49,51,174,243,1)) {
        charY = 100;
    }
    if (checkHit(charX-170,charY+75,41,49,364,35,1,223)) {
        charX = 535;
    }
    if (checkHit(charX-170,charY+75,41,49,316,181,1,80)) {
        charX = 435;
    }
    if (checkHit(charX-170,charY+75,41,49,242,189,52,86)) {
        if (keys[88]) {
            scene = 5;
            playSound(getSound("rpg/door-open"));
        }
    }
    if (keys[32]) {
        char_frame = 3;
        charY -= jumpSpeed;
        jumping = true;
        if (direction === 0) {
            char_frame = 6;
        }
        if (direction === 1) {
            char_frame = 3;
        }
    } // Luigi levitates
    if (!keys[32]) {
        charY+=jumpSpeed;
    } // Luigi descends
};
//Scene 4: Tutorial pt. 2

var drawSceneFive = function() {
    scene = 5;
    jumpSpeed = 1;
    charSpeed = 1;  
    background(0, 0, 0);
    drawWords('?',38,503,35,35); 
    portal_blue(33,176,2);
    portal_blue(33,42,2);
    portal_orange(525,42,2);
    drawLuigi(charX+36,charY+433,2);
    {
    fill(255, 255, 255);
    rect(20,559,88,20);
    fill(rainbowColor(frameCount*5));
    rect(0,0,627,20);
    rect(0,0,20,600); 
    rect(580,0,20,600); 
    rect(0,580,600,20);
    rect(20,383,480,20); 
    rect(88,491,20,88); 
    rect(88,482,492,20); 
    rect(500,215,20,98); 
    rect(500,215,82,20); 
    rect(348,215,82,20); 
    rect(428,215,20,98); 
    rect(283,215,20,98); 
    rect(250,72,140,5); 
    rect(153,250,140,20); 
    rect(20,250,71,20); 
    rect(20,144,572,10);
    } // objects
    fill(255, 0, 0, 0); // transparent before traps2 = true
    if (traps2 === true) {
        fill(rainbowColor(frameCount*7.5));
    } // trap2 is revealed
    rect(465,253,20,20); // trap2
    if (checkHit(charX+36,charY+433,(41/1.3),(49/1.5),33,178,36,59)) {
        if (keys[88]) {
            charX = 0;
            charY = -380;
            playSound(getSound("retro/laser4"));
        }
    } // portal collision
    if (checkHit(charX+36,charY+433,(41/1.3),(49/1.5),525,42,36,59)) {
        if (keys[88]) {
            scene = 6;
            playSound(getSound("rpg/door-open"));
        }
    } // portal collision
    if (checkHit(charX+36,charY+433,(41/1.3),(49/1.5),20,559,88,20)) {
        jumping = false;
        charY = 93;
    } // object collision
    if (checkHit(charX+36,charY+433,(41/1.3),(49/1.5),0,0,627,20)) {
        charX = 0;
        charY = 93;
        playSound(getSound("retro/boom2"));
    } // object collision
    if (checkHit(charX+36,charY+433,(41/1.3),(49/1.5),0,0,20,600)) {
        charX = 0;
        charY = 93;
        playSound(getSound("retro/boom2"));
    } // object collision
    if (checkHit(charX+36,charY+433,(41/1.3),(49/1.5),580,0,20,600)) {
        charX = 0;
        charY = 93;
        playSound(getSound("retro/boom2"));
    } // object collision
    if (checkHit(charX+36,charY+433,(41/1.3),(49/1.5),0,580,600,20)) {
        charX = 0;
        charY = 93;
        playSound(getSound("retro/boom2"));
    } // object collision
    if (checkHit(charX+36,charY+433,(41/1.3),(49/1.5),88,491,20,88)) {
        charX = 0;
        charY = 93;
        playSound(getSound("retro/boom2"));
    } // collision
    if (checkHit(charX+36,charY+433,(41/1.3),(49/1.5),20,383,480,20)) {
        charX = 0;
        charY = 93;
        playSound(getSound("retro/boom2"));
    } // object collision
    if (checkHit(charX+36,charY+433,(41/1.3),(49/1.5),428,215,20,98)) {
        charX = 0;
        charY = 93;
        playSound(getSound("retro/boom2"));
    } // object collision
    if (checkHit(charX+36,charY+433,(41/1.3),(49/1.5),250,72,140,5)) {
        charX = 0;
        charY = 93;
        playSound(getSound("retro/boom2"));
    } // object collision
    if (checkHit(charX+36,charY+433,(41/1.3),(49/1.5),20,250,71,20)) {
        charX = 0;
        charY = 93;
        playSound(getSound("retro/boom2"));
    } // object collision
    if (checkHit(charX+36,charY+433,(41/1.3),(49/1.5),20,144,572,10)) {
        charX = 0;
        charY = 93;
        playSound(getSound("retro/boom2"));
    } // object collision
    if (checkHit(charX+36,charY+433,(41/1.3),(49/1.5),153,250,140,20)) {
        charX = 0;
        charY = 93;
        playSound(getSound("retro/boom2"));
    } // collision
    if (checkHit(charX+36,charY+433,(41/1.3),(49/1.5),348,215,82,20)) {
        charX = 0;
        charY = 93;
        playSound(getSound("retro/boom2"));
    } // object collision
    if (checkHit(charX+36,charY+433,(41/1.3),(49/1.5),283,215,20,98)) {
        charX = 0;
        charY = 93;
        playSound(getSound("retro/boom2"));
    } // object collision
    if (checkHit(charX+36,charY+433,(41/1.3),(49/1.5),500,215,20,98)) {
        charX = 0;
        charY = 93;
        playSound(getSound("retro/boom2"));
    } // object collision
    if (checkHit(charX+36,charY+433,(41/1.3),(49/1.5),500,215,82,20)) {
        charX = 0;
        charY = 93;
        playSound(getSound("retro/boom2"));
    } // object collision
    if (checkHit(charX+36,charY+433,(41/1.3),(49/1.5),111,250,20,20)) {
        charX = 0;
        charY = 93;
        playSound(getSound("retro/boom2"));
        traps1 = true;
    } // trap collision
    if (checkHit(charX+36,charY+433,(41/1.3),(49/1.5),465,253,20,20)) {
        charX = 0;
        charY = 93;
        playSound(getSound("retro/boom2"));
        traps2 = true;
    } // trap collision
    if (checkHit(charX+36,charY+433,(41/1.3),(49/1.5),88,482,492,20)) {
        charX = 0;
        charY = 93;
        playSound(getSound("retro/boom2"));
    } // object collision
    if (checkHit(charX+36,charY+433,(41/1.3),(49/1.5),38,503,35,35)) {
            talkX = 0;
            talkY = 0;
            fill(255, 255, 255);
            rect(talkX+100,talkY+73,400,319);
            drawWords('ICS2O',talkX+111,talkY+80,25,20);
            drawWords('I CANNOT COMMUNICATE',talkX+111,talkY+108,17,14);
            drawWords('ANY LONGER... I MUST',talkX+111,talkY+132,17,14);
            drawWords('RETURN TO MY CREATOR!',talkX+111,talkY+156,17,14);
            drawWords('MY FINAL ADVICE',talkX+111,talkY+180,17,14);
            drawWords('IS TO AVOID TOUCHING',talkX+111,talkY+204,17,14);
            drawWords('THESE WEIRD WALLS. YOU',talkX+111,talkY+228,17,14);
            drawWords('MUST HARNESS YOUR',talkX+111,talkY+252,17,14);
            drawWords('LEVITATION ABILITY TO',talkX+111,talkY+274,17,14);
            drawWords('GET THROUGH THE MAZES!',talkX+111,talkY+296,17,14);
            drawWords('GOOD LUCK, MARIOS BRO :)',talkX+111,talkY+320,17,14);
            drawWords(' - ICS20',talkX+101,talkY+344,15,17);
            fill(255, 0, 0);
    } // object collision
    if (keys[32]) {
        char_frame = 3;
        charY -= jumpSpeed;
        jumping = true;
        if (direction === 0) {
            char_frame = 6;
        }
        if (direction === 1) {
            char_frame = 3;
        }
    } // Luigi levitates
    if (!keys[32]) {
        charY+=jumpSpeed;
    }  // Luigi descends
};
//Scene 5: Level 1

var drawSceneSix = function() {
    scene = 6;
    charSpeed = 1;
    jumpSpeed = 1;
    background(0, 0, 0);
    fill(255, 0, 0);
    var f = createFont("segoe print");
    textFont(f);
    fill(255, 255, 255);
    portal_blue(27,200,2);
    portal_blue(27,110,2);
    portal_blue(157,200,2);
    portal_blue(260,29,2);
    portal_orange(315,315,2);
    drawLuigi(charX+-434,charY+396,2);
    draw_boo(boo4X+539,241,2);
    draw_boo(412,boo5Y+241,2);
    {
    fill(255, 255, 255); 
    rect(20,81,153,20); 
    fill(rainbowColor(frameCount*5)); // rainbow!!!!!
    rect(0,0,627,20); 
    rect(0,0,20,600); 
    rect(580,0,20,600); 
    rect(0,580,600,20); 
    rect(18,83,155,20); 
    rect(224,20,20,158); 
    rect(130,178,114,20); 
    rect(15,178,71,20); 
    rect(66,178,20,90); 
    rect(130,178,20,90); 
    rect(198,196,20,160); 
    rect(16,336,199,20);
    rect(381,361,199,20); 
    rect(511,136,20,100); 
    rect(244,125,287,20); 
    rect(352,84,20,43);
    rect(454,279,57,20); 
    rect(454,143,20,137);
    rect(381,290,20,75); 
    rect(381,144,20,75);
    rect(218,197,173,22);
    rect(267,304,20,80);
    rect(88,444,438,20);
    rect(88,530,20,50);
    rect(165,464,20,50);
    rect(242 + 88,464,20,50);
    rect(242 + (88*3),464,20,50);
    rect(242,530,20,50); 
    rect(242 + (88*2),530,20,50);
    rect(267,284,134,20);
    } // objects (blocks)
    boo4X += boo4Speed; // boo4 moves horizontally by boo4Speed
    boo5Y += boo5Speed; // boo5 moves vertically by boo5Speed
    if (boo4X > 0) {
        boo4Speed = -0.8;
    } // back and forth movement
    if (boo4X < -61) {
        boo4Speed = 0.8;
    } // back and forth movement
    if (boo5Y > 90) {
        boo5Speed = -1.9;
    } // back and forth movement
    if (boo5Y < -95) {
        boo5Speed = 1.9;
    } // back and forth movement
    fill(255, 0, 0, 0); // transparent before traps3 = true
    if (traps3 === true) {
        fill(rainbowColor(frameCount*7.5));
    } // trap3 is revealed
    rect(34,248,20,20); // trap3
    fill(255, 0, 0, 0); // transparent before traps4 = true
    if (traps4 === true) {
        fill(rainbowColor(frameCount*7.5));
    } // trap4 is revealed
    rect(40,132,20,20); // trap4
    fill(255, 0, 0, 0); // transparent before traps4 = true
    if (traps5 === true) {
        fill(rainbowColor(frameCount*7.5));
    } // trap5 is revealed
    rect(267,403,20,20); // trap4
    if (checkHit(charX+-434,charY+396,(41/1.3),(49/1.5),34,248,20,20)) {
        charX = 487;
        charY = -347;
        playSound(getSound("retro/boom2"));
        traps3 = true;
        } // trap collision
    if (checkHit(charX+-434,charY+396,(41/1.3),(49/1.5),40,132,20,20)) {
        charX = 487;
        charY = -347;
        playSound(getSound("retro/boom2"));
        traps4 = true;
        } // trap collision
    if (checkHit(charX+-434,charY+396,(41/1.3),(49/1.5),267,403,20,20)) {
        charX = 487;
        charY = -347;
        playSound(getSound("retro/boom2"));
        traps5 = true;
        } // trap collision
    if (checkHit(charX+-434,charY+396,(41/1.3),(49/1.5),20,81,153,20)) {
        jumping = false;
        charY = -348;
    } // object collision
    if (checkHit(charX+-434,charY+396,(41/1.3),(49/1.5),0,0,627,20)) {
        charX = 487;
        charY = -347;
        playSound(getSound("retro/boom2"));
    } // object collision
    if (checkHit(charX+-434,charY+396,(41/1.3),(49/1.5),0,0,20,600)) {
        charX = 487;
        charY = -347;
        playSound(getSound("retro/boom2"));
    } // object collision
    if (checkHit(charX+-434,charY+396,(41/1.3),(49/1.5),580,0,20,600)) {
        charX = 487;
        charY = -347;
        playSound(getSound("retro/boom2"));
    } // object collision
    if (checkHit(charX+-434,charY+396,(41/1.3),(49/1.5),0,580,600,20)) {
        charX = 487;
        charY = -347;
        playSound(getSound("retro/boom2"));
    } // object collision
    if (checkHit(charX+-434,charY+396,(41/1.3),(49/1.5),18,83,155,20)) {
        charX = 487;
        charY = -347;
        playSound(getSound("retro/boom2"));
    } // object collision
    if (checkHit(charX+-434,charY+396,(41/1.3),(49/1.5),224,20,20,158)) {
        charX = 487;
        charY = -347;
        playSound(getSound("retro/boom2"));
    } // object collision
    if (checkHit(charX+-434,charY+396,(41/1.3),(49/1.5),130,178,114,20)) {
        charX = 487;
        charY = -347;
        playSound(getSound("retro/boom2"));
    } // object collision
    if (checkHit(charX+-434,charY+396,(41/1.3),(49/1.5),66,178,20,90)) {
        charX = 487;
        charY = -347;
        playSound(getSound("retro/boom2"));
    } // object collision
    if (checkHit(charX+-434,charY+396,(41/1.3),(49/1.5),15,178,71,20)) {
        charX = 487;
        charY = -347;
        playSound(getSound("retro/boom2"));
    } // object collision
    if (checkHit(charX+-434,charY+396,(41/1.3),(49/1.5),130,178,20,90)) {
        charX = 487;
        charY = -347;
        playSound(getSound("retro/boom2"));
    } // object collision
    if (checkHit(charX+-434,charY+396,(41/1.3),(49/1.5),198,196,20,160)) {
        charX = 487;
        charY = -347;
        playSound(getSound("retro/boom2"));
    } // object collision
    if (checkHit(charX+-434,charY+396,(41/1.3),(49/1.5),16,336,199,20)) {
        charX = 487;
        charY = -347;
        playSound(getSound("retro/boom2"));
    } // object collision
    if (checkHit(charX+-434,charY+396,(41/1.3),(49/1.5),381,361,199,20)) {
        charX = 487;
        charY = -347;
        playSound(getSound("retro/boom2"));
    } // object collision
    if (checkHit(charX+-434,charY+396,(41/1.3),(49/1.5),511,136,20,100)) {
        charX = 487;
        charY = -347;
        playSound(getSound("retro/boom2"));
    } // object collision
    if (checkHit(charX+-434,charY+396,(41/1.3),(49/1.5),352,84,20,43)) {
        charX = 487;
        charY = -347;
        playSound(getSound("retro/boom2"));
    } // object collision
    if (checkHit(charX+-434,charY+396,(41/1.3),(49/1.5),454,279,57,20)) {
        charX = 487;
        charY = -347;
        playSound(getSound("retro/boom2"));
    } // object collision
    if (checkHit(charX+-434,charY+396,(41/1.3),(49/1.5),454,143,20,137)) {
        charX = 487;
        charY = -347;
        playSound(getSound("retro/boom2"));
    } // object collision
    if (checkHit(charX+-434,charY+396,(41/1.3),(49/1.5),381,290,20,75)) {
        charX = 487;
        charY = -347;
        playSound(getSound("retro/boom2"));
    } // object collision
    if (checkHit(charX+-434,charY+396,(41/1.3),(49/1.5),381,144,20,75)) {
        charX = 487;
        charY = -347;
        playSound(getSound("retro/boom2"));
    } // object collision
    if (checkHit(charX+-434,charY+396,(41/1.3),(49/1.5),218,197,173,22)) {
        charX = 487;
        charY = -347;
        playSound(getSound("retro/boom2"));
    } // object collision
    if (checkHit(charX+-434,charY+396,(41/1.3),(49/1.5),267,304,20,80)) {
        charX = 487;
        charY = -347;
        playSound(getSound("retro/boom2"));
    } // object collision
    if (checkHit(charX+-434,charY+396,(41/1.3),(49/1.5),88,444,438,20)) {
        charX = 487;
        charY = -347;
        playSound(getSound("retro/boom2"));
    } // object collision
    if (checkHit(charX+-434,charY+396,(41/1.3),(49/1.5),88,530,20,50)) {
        charX = 487;
        charY = -347;
        playSound(getSound("retro/boom2"));
    } // object collision
    if (checkHit(charX+-434,charY+396,(41/1.3),(49/1.5),165,464,20,50)) {
        charX = 487;
        charY = -347;
        playSound(getSound("retro/boom2"));
    } // object collision
    if (checkHit(charX+-434,charY+396,(41/1.3),(49/1.5),242 + 88,464,20,50)) {
        charX = 487;
        charY = -347;
        playSound(getSound("retro/boom2"));
    } // object collision
    if (checkHit(charX+-434,charY+396,(41/1.3),(49/1.5),242 + (88*3),464,20,50)) {
        charX = 487;
        charY = -347;
        playSound(getSound("retro/boom2"));
    } // object collision
    if (checkHit(charX+-434,charY+396,(41/1.3),(49/1.5),242,530,20,50)) {
        charX = 487;
        charY = -347;
        playSound(getSound("retro/boom2"));
    } // object collision
    if (checkHit(charX+-434,charY+396,(41/1.3),(49/1.5),242 + (88*2),530,20,50)) {
        charX = 487;
        charY = -347;
        playSound(getSound("retro/boom2"));
    } // object collision
    if (checkHit(charX+-434,charY+396,(41/1.3),(49/1.5),267,284,134,20)) {
        charX = 487;
        charY = -347;
        playSound(getSound("retro/boom2"));
    } // object collision
    if (checkHit(charX+-434,charY+396 ,(41/1.3),(49/1.5),boo4X+542.3,244.35,50/2,50/2)) {
        charX = 487;
        charY = -347;
        playSound(getSound("retro/boom2"));
    } // object collision
    if (checkHit(charX+-434,charY+396 ,(41/1.3),(49/1.5),412,boo5Y+241,50/2,50/2)) {
        charX = 487;
        charY = -347;
        playSound(getSound("retro/boom2"));
    } // object collision
    if (checkHit(charX+-434,charY+396,(41/1.3),(49/1.5),157,200,36,59)) {
        if (keys[88]) {
            charX = 695;
            charY = -348;
            playSound(getSound("retro/laser4"));
        }
    } // portal collision 
    if (checkHit(charX+-434,charY+396,(41/1.3),(49/1.5),315,315,36,59)) {
        if (keys[88]) {
            scene = 7;
            playSound(getSound("rpg/door-open"));
        }
    } // portal collision
    if (keys[32]) {
        char_frame = 3;
        charY -= jumpSpeed;
        jumping = true;
        if (direction === 0) {
            char_frame = 6;
        }
    
        if (direction === 1) {
        char_frame = 3;
        }
    } // Luigi levitates
    if (!keys[32]) {
        charY+=jumpSpeed;
    } // Luigi descends

};
//Scene 6: Level 2

var drawSceneSeven = function() {
    scene = 7;
    background(0, 0, 0);

    {
    draw_boo(boo6X+470,297,2);
    portal_blue(311,42,2);
    portal_blue(200,42,2);
    portal_blue(424,42,2);
    portal_blue(33,42,2);
    portal_orange(525,42,2);
    drawLuigi(charX+-716,charY+631,2);
    } // Luigi, boo, portals
    {
    fill(rainbowColor(frameCount*5));
    rect(0,225,97,68);
    fill(rainbowColor(frameCount*15));
    rect(84,225,85,68);
    fill(rainbowColor(frameCount*25));
    rect(157,225,80,68);
    fill(rainbowColor(frameCount*35));
    rect(228,225,80,68);
    } // flickering rainbow squares
    {
    fill(255, 0, 0, 0); // transparent before traps5 = true
    if (traps5 === true) {
    fill(rainbowColor(frameCount*7.5));
    } // trap5 is revealed
    rect(164,69,20,20); // trap5
    } // traps
    {
    fill(255, 255, 255);
    rect(0,579,601,20);
    fill(rainbowColor(frameCount*2.5));
    rect(83,501,20,78); // 
    rect(83,213,20,210);
    rect(227,213,20,210);
    rect(0,213,396,20);
    rect(159,476,160,20);
    rect(0,293,303,20);
    rect(155,395,20,184);
    rect(155,213,20,100);
    rect(304,395,92,20);
    rect(377,214,20,70);
    rect(377,345,20,70);
    rect(397,345,201,20);
    rect(397,264,59,20);
    rect(512,264,77,20);
    rect(377,16,20,122);
    rect(155+(72*2),395,20,184);
    rect(155+(72*2),213,20,100);
    rect(0,0,601,20);
    rect(0,0,20,579);
    rect(580,0,20,579);
    rect(397,118,200,20);
    rect(0,118,80,20);
    rect(145,118,256,20);
    rect(260,18,20,102);
    } // objects (the obstacles)
    boo6X -= boo6Speed; // boo6 moves horizontally by boo6Speed
    if (boo6X < -151) {
        boo6Speed = -1.4;
        boo_frame = 2;
    } // back and forth movement
    if (boo6X > 80) {
        boo6Speed = 1.4;
        boo_frame = 1;
    } // back and forth movement
    if (checkHit(charX+-716,charY+631,(41/1.3),(49/1.5),0,579,601,20)) {
        charY = -85;
        jumping = false;
    } // object collision
    if (checkHit(charX+-716,charY+631,(41/1.3),(49/1.5),83,501,20,78)) {
        charX = 740;
        charY = -85;
        playSound(getSound("retro/boom2"));
    } // object collision
    if (checkHit(charX+-716,charY+631,(41/1.3),(49/1.5),145,118,256,20)) {
        charX = 740;
        charY = -85;
        playSound(getSound("retro/boom2"));
    } // object collision
    if (checkHit(charX+-716,charY+631,(41/1.3),(49/1.5),83,213,20,210)) {
        charX = 740;
        charY = -85;
        playSound(getSound("retro/boom2"));
    } // object collision
    if (checkHit(charX+-716,charY+631,(41/1.3),(49/1.5),0,118,80,20)) {
        charX = 740;
        charY = -85;
        playSound(getSound("retro/boom2"));
    } // object collision
    if (checkHit(charX+-716,charY+631,(41/1.3),(49/1.5),0,213,396,20)) {
        charX = 740;
        charY = -85;
        playSound(getSound("retro/boom2"));
    } // object collision
    if (checkHit(charX+-716,charY+631,(41/1.3),(49/1.5),159,476,160,20)) {
        charX = 740;
        charY = -85;
        playSound(getSound("retro/boom2"));
    } // object collision
    if (checkHit(charX+-716,charY+631,(41/1.3),(49/1.5),0,293,303,20)) {
        charX = 740;
        charY = -85;
        playSound(getSound("retro/boom2"));
    } // object collision
    if (checkHit(charX+-716,charY+631,(41/1.3),(49/1.5),155,395,20,184)) {
        charX = 740;
        charY = -85;
        playSound(getSound("retro/boom2"));
    } // object collision
    if (checkHit(charX+-716,charY+631,(41/1.3),(49/1.5),155,213,20,100)) {
        charX = 740;
        charY = -85;
        playSound(getSound("retro/boom2"));
    } // object collision
    if (checkHit(charX+-716,charY+631,(41/1.3),(49/1.5),304,395,92,20)) {
        charX = 740;
        charY = -85;
        playSound(getSound("retro/boom2"));
    } // object collision
    if (checkHit(charX+-716,charY+631,(41/1.3),(49/1.5),377,214,20,70)) {
        charX = 740;
        charY = -85;
        playSound(getSound("retro/boom2"));
    } // object collision
    if (checkHit(charX+-716,charY+631,(41/1.3),(49/1.5),377,345,20,70)) {
        charX = 740;
        charY = -85;
        playSound(getSound("retro/boom2"));
    } // object collision
    if (checkHit(charX+-716,charY+631,(41/1.3),(49/1.5),397,345,201,20)) {
        charX = 740;
        charY = -85;
        playSound(getSound("retro/boom2"));
    } // object collision
    if (checkHit(charX+-716,charY+631,(41/1.3),(49/1.5),397,264,59,20)) {
        charX = 740;
        charY = -85;
        playSound(getSound("retro/boom2"));
    } // object collision
    if (checkHit(charX+-716,charY+631,(41/1.3),(49/1.5),512,264,77,20)) {
        charX = 740;
        charY = -85;
        playSound(getSound("retro/boom2"));
    } // object collision
    if (checkHit(charX+-716,charY+631,(41/1.3),(49/1.5),377,16,20,122)) {
        charX = 740;
        charY = -85;
        playSound(getSound("retro/boom2"));
    } // object collision
    if (checkHit(charX+-716,charY+631,(41/1.3),(49/1.5),155+(72*2),395,20,184)) {
        charX = 740;
        charY = -85;
        playSound(getSound("retro/boom2"));
    } // object collision
    if (checkHit(charX+-716,charY+631,(41/1.3),(49/1.5),155+(72*2),213,20,100)) {
        charX = 740;
        charY = -85;
        playSound(getSound("retro/boom2"));
    } // object collision
    if (checkHit(charX+-716,charY+631,(41/1.3),(49/1.5),0,0,601,20)) {
        charX = 740;
        charY = -85;
        playSound(getSound("retro/boom2"));
    } // object collision
    if (checkHit(charX+-716,charY+631,(41/1.3),(49/1.5),0,0,20,579)) {
        charX = 740;
        charY = -85;
        playSound(getSound("retro/boom2"));
    } // object collision
    if (checkHit(charX+-716,charY+631,(41/1.3),(49/1.5),580,0,20,579)) {
        charX = 740;
        charY = -85;
        playSound(getSound("retro/boom2"));
    } // object collision
    if (checkHit(charX+-716,charY+631,(41/1.3),(49/1.5),397,118,200,20)) {
        charX = 740;
        charY = -85;
        playSound(getSound("retro/boom2"));
    } // object collision
    if (checkHit(charX+-716,charY+631,(41/1.3),(49/1.5),227,213,20,210)) {
        charX = 740;
        charY = -85;
        playSound(getSound("retro/boom2"));
    } // object collision
    if (checkHit(charX+-716,charY+631,(41/1.3),(49/1.5),260,18,20,102)) {
        charX = 740;
        charY = -85;
        playSound(getSound("retro/boom2"));
    } // object collision
    if (checkHit(charX+-716,charY+631,(41/1.3),(49/1.5),boo6X+473,300,50/2,50/2)) {
        charX = 740;
        charY = -85;
        playSound(getSound("retro/boom2"));
    } // boo collision
    if (checkHit(charX+-716,charY+631,(41/1.3),(49/1.5),32,44,36,59)) {
        if (keys[88]) {
            charX = 1143;
            charY = -590;
            playSound(getSound("retro/laser4"));
        }

    } // portal collision
    if (checkHit(charX+-716,charY+631,(41/1.3),(49/1.5),525,44,36,59)) {
        if (keys[88]) {
            scene = 8;
            playSound(getSound("rpg/door-open"));
        }

    } // portal collision
    if (checkHit(charX+-716,charY+631,(41/1.3),(49/1.5),164,69,20,20)) {
        charX = 740;
        charY = -85;
        playSound(getSound("retro/boom2"));
        traps5 = true;
    } // trap collision
    if (keys[32]) {
        char_frame = 3;
        charY -= jumpSpeed;
        jumping = true;
        if (direction === 0) {
            char_frame = 6;
        }
    
        if (direction === 1) {
            char_frame = 3;
        }
    } // Luigi levitates
    if (!keys[32]) {
        charY+=jumpSpeed;
    } // Luigi descends
};
//Scene 7: Level 3

var drawSceneEight = function() {
    scene = 8;
    jumpSpeed = 1;
    charSpeed = 1;  
    background(rainbowColor(frameCount*11.5));
    {
    fill(rainbowColor(frameCount*8.5));
    rect(0,0,627,20);
    rect(0,579,600,20);
    rect(0,0,20,600);
    rect(580,0,20,600);
    rect((255)-62,20,20,150);
    rect((155)-62,150,81,20);
    rect((229)-62,150,100,20);
    rect((155)-62,89,20,61);
    rect((206)-62,170,20,66);
    rect((309)-62,170,20,20);
    rect((269)-62,261,60,20);
    rect((262)-55,281,20,35);
    rect((249)-(62),296,20,20);
    rect((77)-(62),296,126,20);
    rect((275)-(62),80,135,20);
    rect((157)-(62),375,135,20);
    rect((157)-(62),454,135,20);
    rect((216)-(62),454,20,44);
    rect((216)-(62),562,20,56);
    rect((98)-(29),216,83,20);
    rect((182)-(29),376,20,87);
    rect((252)-(29),538,20,87);
    rect((252)-(29),538,60,20);
    rect((312)-(29),498,20,60);
    rect((312)-(29),374,60,20);
    rect((396)-(106),208,60,20);
    rect((442)-(122),271,60,20);
    rect((483)-(122),342,60,20);
    rect((483)-(122),427,60,20);
    rect((483)-(21),83,60,422); 
    rect((284)-(21),83,200,20);
    }
    portal_orange(225,25,1.5);
    drawLuigi(charLastLvlX+135,charLastLvlY+64,2);
    if (keys[32]) {
    char_frame = 3;
    charLastLvlY -= jumpSpeed;
    jumping = true;
    if (direction === 0) {
        char_frame = 6;
    }
    
    if (direction === 1) {
        char_frame = 3;
        
    }
    }
    if (!keys[32]) {
    charLastLvlY+=jumpSpeed;
    }
    if (keys[LEFT]) {
        direction = 0;
        timer++;
        char_frame = 4;
        charLastLvlX -= charSpeed;
        if (timer > 20) {
            char_frame = 5;
            timer++;
        }
        if (timer > 40 && char_frame === 5) {
            timer = 0; 
            char_frame = 4;
        }
        if (jumping === true) {
            char_frame = 6;
        }
    }
    if (keys[RIGHT]) {
        direction = 1;
        timer++;
        char_frame = 1;
        charLastLvlX += charSpeed;
        if (timer > 20) {
            char_frame = 2;
            timer++;
        }
        if (timer > 40 && char_frame === 2) {
            timer = 0;
            char_frame = 1;
        }
        if (jumping === true) {
            char_frame = 3;
        }
    }
    if (checkHit(charLastLvlX+135,charLastLvlY+64,(41/1.3),(49/1.5),0,0,627,20)) {
        charLastLvlX = 0;
        charLastLvlY = 0;
        playSound(getSound("retro/laser2"));
    } // object collision
    if (checkHit(charLastLvlX+135,charLastLvlY+64,(41/1.3),(49/1.5),0,579,600,20)) {
        charLastLvlX = 0;
        charLastLvlY = 0;
        playSound(getSound("retro/laser2"));
    } // object collision
    if (checkHit(charLastLvlX+135,charLastLvlY+64,(41/1.3),(49/1.5),0,0,20,600)) {
        charLastLvlX = 0;
        charLastLvlY = 0;
        playSound(getSound("retro/laser2"));
    } // object collision
    if (checkHit(charLastLvlX+135,charLastLvlY+64,(41/1.3),(49/1.5),580,0,20,600)) {
        charLastLvlX = 0;
        charLastLvlY = 0;
        playSound(getSound("retro/laser2"));
    } // object collision
    if (checkHit(charLastLvlX+135,charLastLvlY+64,(41/1.3),(49/1.5),(255)-62,20,20,150)) {
        charLastLvlX = 0;
        charLastLvlY = 0;
        playSound(getSound("retro/laser2"));
    } // object collision
    if (checkHit(charLastLvlX+135,charLastLvlY+64,(41/1.3),(49/1.5),(155)-62,150,81,20)) {
        charLastLvlX = 0;
        charLastLvlY = 0;
        playSound(getSound("retro/laser2"));
    } // object collision
    if (checkHit(charLastLvlX+135,charLastLvlY+64,(41/1.3),(49/1.5),(229)-62,150,100,20)) {
        charLastLvlX = 0;
        charLastLvlY = 0;
        playSound(getSound("retro/laser2"));
    } // object collision
    if (checkHit(charLastLvlX+135,charLastLvlY+64,(41/1.3),(49/1.5),(155)-62,89,20,61)) {
        charLastLvlX = 0;
        charLastLvlY = 0;
        playSound(getSound("retro/laser2"));
    } // object collision
    if (checkHit(charLastLvlX+135,charLastLvlY+64,(41/1.3),(49/1.5),(206)-62,170,20,66)) {
        charLastLvlX = 0;
        charLastLvlY = 0;
        playSound(getSound("retro/laser2"));
    } // object collision
    if (checkHit(charLastLvlX+135,charLastLvlY+64,(41/1.3),(49/1.5),(309)-62,170,20,20)) {
        charLastLvlX = 0;
        charLastLvlY = 0;
        playSound(getSound("retro/laser2"));
    } // object collision
    if (checkHit(charLastLvlX+135,charLastLvlY+64,(41/1.3),(49/1.5),(269)-62,261,60,20)) {
        charLastLvlX = 0;
        charLastLvlY = 0;
        playSound(getSound("retro/laser2"));
    } // object collision
    if (checkHit(charLastLvlX+135,charLastLvlY+64,(41/1.3),(49/1.5),(262)-55,281,20,35)) {
        charLastLvlX = 0;
        charLastLvlY = 0;
        playSound(getSound("retro/laser2"));
    } // object collision
    if (checkHit(charLastLvlX+135,charLastLvlY+64,(41/1.3),(49/1.5),(249)-(62),296,20,20)) {
        charLastLvlX = 0;
        charLastLvlY = 0;
        playSound(getSound("retro/laser2"));
    } // object collision
    if (checkHit(charLastLvlX+135,charLastLvlY+64,(41/1.3),(49/1.5),(275)-(62),80,135,20)) {
        charLastLvlX = 0;
        charLastLvlY = 0;
        playSound(getSound("retro/laser2"));
    } // object collision
    if (checkHit(charLastLvlX+135,charLastLvlY+64,(41/1.3),(49/1.5),(157)-(62),375,135,20)) {
        charLastLvlX = 0;
        charLastLvlY = 0;
        playSound(getSound("retro/laser2"));
    } // object collision
    if (checkHit(charLastLvlX+135,charLastLvlY+64,(41/1.3),(49/1.5),(157)-(62),454,135,20)) {
        charLastLvlX = 0;
        charLastLvlY = 0;
        playSound(getSound("retro/laser2"));
    } // object collision
    if (checkHit(charLastLvlX+135,charLastLvlY+64,(41/1.3),(49/1.5),(216)-(62),454,20,44)) {
        charLastLvlX = 0;
        charLastLvlY = 0;
        playSound(getSound("retro/laser2"));
    } // object collision
    if (checkHit(charLastLvlX+135,charLastLvlY+64,(41/1.3),(49/1.5),(98)-(29),216,83,20)) {
        charLastLvlX = 0;
        charLastLvlY = 0;
        playSound(getSound("retro/laser2"));
    } // object collision
    if (checkHit(charLastLvlX+135,charLastLvlY+64,(41/1.3),(49/1.5),(252)-(29),538,60,20)) {
        charLastLvlX = 0;
        charLastLvlY = 0;
        playSound(getSound("retro/laser2"));
    } // object collision
    if (checkHit(charLastLvlX+135,charLastLvlY+64,(41/1.3),(49/1.5),(312)-(29),498,20,60)) {
        charLastLvlX = 0;
        charLastLvlY = 0;
        playSound(getSound("retro/laser2"));
    } // object collision
    if (checkHit(charLastLvlX+135,charLastLvlY+64,(41/1.3),(49/1.5),(312)-(29),374,60,20)) {
        charLastLvlX = 0;
        charLastLvlY = 0;
        playSound(getSound("retro/laser2"));
    } // object collision
    if (checkHit(charLastLvlX+135,charLastLvlY+64,(41/1.3),(49/1.5),(396)-(106),208,60,20)) {
        charLastLvlX = 0;
        charLastLvlY = 0;
        playSound(getSound("retro/laser2"));
    } // object collision
    if (checkHit(charLastLvlX+135,charLastLvlY+64,(41/1.3),(49/1.5),(442)-(122),271,60,20)) {
        charLastLvlX = 0;
        charLastLvlY = 0;
        playSound(getSound("retro/laser2"));
    } // object collision
    if (checkHit(charLastLvlX+135,charLastLvlY+64,(41/1.3),(49/1.5),(483)-(122),342,60,20)) {
        charLastLvlX = 0;
        charLastLvlY = 0;
        playSound(getSound("retro/laser2"));
    } // object collision
    if (checkHit(charLastLvlX+135,charLastLvlY+64,(41/1.3),(49/1.5),0,0,0,0)) {
        charLastLvlX = 0;
        charLastLvlY = 0;
        playSound(getSound("retro/laser2"));
    } // object collision
    if (checkHit(charLastLvlX+135,charLastLvlY+64,(41/1.3),(49/1.5),(483)-(122),427,60,20)) {
        charLastLvlX = 0;
        charLastLvlY = 0;
        playSound(getSound("retro/laser2"));
    } // object collision
    if (checkHit(charLastLvlX+135,charLastLvlY+64,(41/1.3),(49/1.5),(483)-(21),83,60,422)) {
        charLastLvlX = 0;
        charLastLvlY = 0;
        playSound(getSound("retro/laser2"));
    } // object collision
    if (checkHit(charLastLvlX+135,charLastLvlY+64,(41/1.3),(49/1.5),(284)-(21),83,200,20)) {
        charLastLvlX = 0;
        charLastLvlY = 0;
        playSound(getSound("retro/laser2"));
    } // object collision
    if (checkHit(charLastLvlX+135,charLastLvlY+64,(41/1.3),(49/1.5),226,30,24,39)) {
        if (keys[88]) {
            scene = 9;
        }
        playSound(getSound("rpg/hit-clop"));
    } // object collision
    
    
    

    if (checkHit(charLastLvlX+135,charLastLvlY+64,(41/1.3),(49/1.5),247,214,20,20)) {
        charLastLvlX = 0;
        charLastLvlY = 0;
        traps = true;
        playSound(getSound("retro/laser2"));
    } // trap collision);
    fill(255, 0,0, 0);
    if (traps === true) {
        fill(rainbowColor(frameCount*5));
    }
    rect(247,214,20,20);
    
};
//Scene 8: Level 4

var drawSceneNine = function() {
    scene = 9;
    background(0, 0, 0);
    textSize(33);
    fill(255, 255, 255);
    text('great job, you won! :D',147,52,351,84);
    text('you are a pro',197,117,900,317);
    text('now let someone else play',95,178,900,317);
   text('you show off :)',200,482,900,317);
};
//yOU WIN!

draw = function() {
    if (scene === 1) {  
        drawSceneOne();
    }
    if (scene === 0) {  
        sceneHelp();
    }
    if (scene === 2) {
        drawSceneTwo();
    }
    if (scene === 3) {
        drawSceneThree();
    }
    if (scene === 4) {
        drawSceneFour();
    }
    if (scene === 5) {
        drawSceneFive();
    }
    if (scene === 6) {
        drawSceneSix();
    }
    if (scene === 7) {
        drawSceneSeven();
    }
    if (scene === 8) {
        drawSceneEight();
    }
    if (scene === 9) {
        drawSceneNine();
    }
    if (jumping === false) {
        if (direction === 0) {
            char_frame = 4;
        }
        if (direction === 1) {
            char_frame = 1;
        }
    }
    if (keys[LEFT]) {
        direction = 0;
        timer++;
        char_frame = 4;
        charX -= charSpeed;
        if (timer > 20) {
            char_frame = 5;
            timer++;
        }
        if (timer > 40 && char_frame === 5) {
            timer = 0; 
            char_frame = 4;
        }
        if (jumping === true) {
            char_frame = 6;
        }
    }
    if (keys[RIGHT]) {
        direction = 1;
        timer++;
        char_frame = 1;
        charX += charSpeed;
        if (timer > 20) {
            char_frame = 2;
            timer++;
        }
        if (timer > 40 && char_frame === 2) {
            timer = 0;
            char_frame = 1;
        }
        if (jumping === true) {
            char_frame = 3;
        }
    }
};
