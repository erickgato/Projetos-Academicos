let menu = () => {
    ctx.fillStyle = "red"
    ctx.fillRect(canvas.width /2 - 75,canvas.height/2 - 66,200,06);
    ctx.font = "40px Arcade"
              ctx.fillStyle = "white"
              ctx.fillText("Iniciar (Enter)",canvas.width /2 - 75,canvas.height/2 - 70,300);
              ctx.fillText("Personagens--",canvas.width /2 - 75,canvas.height/2  ,300);
              ctx.fillStyle = "red"
             ctx.fillRect(canvas.width /2 - 195,canvas.height/2 + 5,500,200);
             mostraPersonagens();
            
                
}
function mostraPersonagens(){
 //#region Dino
    var imagemDino = new Image()
    imagemDino.src ='images/dino/png/Idle (1).png'
    ctx.fillStyle = "rgba(255,255,255,0.0)"
    ctx.fillRect(canvas.width /2 - 195,canvas.height/2 + 5,60,60);
    ctx.drawImage(imagemDino,canvas.width /2 - 195,canvas.height/2 + 5,60,60)
    ctx.fillStyle = "white"
    ctx.fillText("1",canvas.width /2 - 190,canvas.height/2 + 90  ,300);
 //#endregion Kakashi
 
 //#region 

}