function fraseNoCenario(frase,largura,altura){
    ctx.font = "40px Arcade  "
    let x = 0;
    var movimentafrase = setInterval(() => {
        ctx.fillRect(0,x,largura,altura)
        ctx.fillText(frase,x,0,400);
        x++;
        if(x >= canvas.width){
            clearInterval(movimentafrase);
        }
    }, 100);
   
}

function Botao(x,y,w,h,cor = "red",ctx){
this.x = x;
this.y = y;
this.w = w;
this.h = h;
this.cor = cor;
this.render = function(){
    ctx.fillstyle = this.cor
   ctx.fillRect(this.x,this.y,this.w,this.h);    
 }  
}
function click (evt) {

var rectNav = game.canvas.getBoundingClientRect();
var pos = {
    x: evt.clientX - rectNav.left,
    y: evt.clientY - rectNav.top
 }; 

    if(pos.x>bt.x && pos.x<(bt.x+bt.w) && pos.y>bt.y && pos.y<(bt.y+bt.h)) {
    alert("click")};    

};  


