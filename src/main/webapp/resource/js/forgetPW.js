
    
// 可调参数
var BACKGROUND_COLOR = "gery";   // 背景颜色
var POINT_NUM = 200;                        // 星星数目
var POINT_COLOR = "rgba(255,255,255,0.7)";  // 点的颜色 改为随机生成
var LINE_LENGTH = 2000;                    // 点之间连线长度(的平方)




var cvs=document.querySelector("#canvas");
cvs.width = window.outerWidth;
cvs.height = window.outerHeight;
cvs.style.cssText = "\
 position:fixed;\
 top:0px;\
 left:0px;\
 z-index:1;\
 opacity:1;\
background-image:url(../resource/image/forgetPW.jpg);\
background-size: cover;\
 ";

var ctx = cvs.getContext("2d");

var startTime = new Date().getTime();

//随机数函数
function randomColor(){
	var r=this.randomInt(0,255);
	var g=this.randomInt(0,255);
	var b=this.randomInt(0,255);
	return "rgb("+r+","+g+","+b+")"
}
function randomInt(min, max) {
 return Math.floor((max - min + 1) * Math.random() + min);
}

function randomFloat(min, max) {
 return (max - min) * Math.random() + min;
}

//构造点类
function Point() {
 this.x = randomFloat(0, cvs.width);
 this.y = randomFloat(0, cvs.height);

 var speed = randomFloat(0.3, 1.5);
 var angle = randomFloat(0, 2 * Math.PI);

 this.dx = Math.sin(angle) * speed;
 this.dy = Math.cos(angle) * speed;

 this.r = randomFloat(1.0,3.0);

 this.color = randomColor();
}

Point.prototype.move = function () {
 this.x += this.dx;
 if (this.x < 0) {
     this.x = 0;
     this.dx = -this.dx;
 } else if (this.x > cvs.width) {
     this.x = cvs.width;
     this.dx = -this.dx;
 }
 this.y += this.dy;
 if (this.y < 0) {
     this.y = 0;
     this.dy = -this.dy;
 } else if (this.y > cvs.height) {
     this.y = cvs.height;
     this.dy = -this.dy;
 }
}

Point.prototype.draw = function () {
 ctx.fillStyle = this.color;
 ctx.beginPath();
 ctx.arc(this.x, this.y, this.r, 0, Math.PI * 2);
 ctx.closePath();
 ctx.fill();
}

var points = [];

function initPoints(num) {
 for (var i = 0; i < num; ++i) {
     points.push(new Point());
 }
}

var p0 = new Point(); //鼠标
p0.dx = p0.dy = 0;
var degree = 2.5;
document.onmousemove = function (ev) {
 p0.x = ev.clientX;
 p0.y = ev.clientY;
}
document.onmousedown = function (ev) {
 degree = 5.0;
 p0.x = ev.clientX;
 p0.y = ev.clientY;
}
document.onmouseup = function (ev) {
 degree = 2.5;
 p0.x = ev.clientX;
 p0.y = ev.clientY;
}
window.onmouseout = function () {
 p0.x = null;
 p0.y = null;
}

function drawLine(p1, p2, deg) {
 var dx = p1.x - p2.x;
 var dy = p1.y - p2.y;
 var dis2 = dx * dx + dy * dy;
 if (dis2 < 2 * LINE_LENGTH) {
     if (dis2 > LINE_LENGTH) {
         if (p1 === p0) {
             p2.x += dx * 0.03;
             p2.y += dy * 0.03;
         } else return;
     }
     var t = (1.05 - dis2 / LINE_LENGTH) * 0.2 * deg;
     ctx.strokeStyle ="white";
     ctx.beginPath();
     ctx.lineWidth = 0.1;
     ctx.moveTo(p1.x, p1.y);
     ctx.lineTo(p2.x, p2.y);
     ctx.closePath();
     ctx.stroke();
 }
 return;
}

//绘制每一帧
function drawFrame() {
 cvs.width = window.innerWidth;
 cvs.height = window.innerHeight;
 //ctx.fillStyle = BACKGROUND_COLOR;
 //ctx.fillRect(0, 0, cvs.width, cvs.height);

 var arr = (p0.x == null ? points : [p0].concat(points));
 for (var i = 0; i < arr.length; ++i) {
     for (var j = i + 1; j < arr.length; ++j) {
         drawLine(arr[i], arr[j], 1.0);
     }
     arr[i].draw();
     arr[i].move();
 }

 window.requestAnimationFrame(drawFrame);
}
initPoints(POINT_NUM);
drawFrame();