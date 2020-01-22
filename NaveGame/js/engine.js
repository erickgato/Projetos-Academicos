/*
********************************************************************************
*            Name: Nave Game                                                    *
*            Author: Erick de Souza Gato                                        *                                      
*            Copyright: Jogo não comercial, criado para Experiências acadêmicas *
*            Description: Engine do Nave Game                                   *
*                                                                               *
********************************************************************************
*/
function Aleatorio(min, max) {
      min = Math.ceil(min);
      max = Math.floor(max);
      return Math.floor(Math.random() * (max - min)) + min;
}
//#region principal ||  Main
let moveEsquerda = false,movedireita = false,
          movecima = false ,moveBaixo = false,pulo = false,velocidade = 6,fase = 1;
          var image;
          const maxpulos = 12;
          var canvas = document.querySelector("canvas");
          var ctx = canvas.getContext("2d");
          canvas.width = window.innerWidth - 20
          canvas.height = window.innerHeight - 20
		  //window.innerHeight - 20
 
          let firstTime = {
            fase1: true,
            fase2: true,
            fase3: TextTrackCue
          }
          const estados = {
            inicio: true,
            morte: false,
            jogando: false,
            condicao: function(){
              if(this.inicio){
                this.morte = false
                this.jogando = false
              }
              else if(this.morte){
                this.jogando = false
                ;
              }
              
            }
          }
     //#endregion
     
    //#region CenarioPorFase   || StageControl
    //Cenario em efeito paralax
    let resetaxcenario = (indice,aceleracao) => {
      cenario.xlayer[indice] -= aceleracao
      if(cenario.xlayer[indice] < -canvas.width) cenario.xlayer[indice] = 0
    }
    let Descamada = (indice,h) => {
      ctx.drawImage(cenario.layer[indice],cenario.xlayer[indice],canvas.height - h,canvas.width,h); 
      ctx.drawImage(cenario.layer[indice],cenario.xlayer[indice] + canvas.width,canvas.height - h,canvas.width,h)
    }
         let cenario = {
          layer: [],
          xlayer: [0,0,0,0,0,0,0],
          frame: 0,
          fase:function(){
            switch (fase) {
              case 1:
                if(firstTime.fase1){
                for(let i=1;i<=7; i++ ){
                  this.layer[i] = new Image();
                  var imagem = this.layer[i];
                  imagem.src = "images/Fases/PNG/platformer_background_4/Layers/"+i + ".png";
                }
                objchao.h = 75
              }
                break;
              case 2:
                if(firstTime.fase2){
                  delay = 1;
                  velocidade += 5
                  obstaculos.objetos = []
                  firstTime.fase2 = false
                }
                break;
                 /*
              case 3:
                this.imagem.src = 'images/Fases/fase3.jpg'
                objchao.h = 134
                velocidade = 17
                if(firstTime.fase3){
                  obstaculos.objetos = []
                  player.x = 0
                  firstTime.fase3 = false
                  }
                break;
                */
            }
          },
          atualiza:function(){
           resetaxcenario(6,velocidade - 5)
           resetaxcenario(5,velocidade - 4)
           resetaxcenario(4,velocidade - 3)
           resetaxcenario(3,velocidade - 2)
           resetaxcenario(2,velocidade - 1)
           resetaxcenario(1,velocidade )

          },
          gera:function(){
            /* camadas Tem que ser em ordem decresciva das camadas maiores 7 .. 1 efeito Parallax */
              //7 fundo
            ctx.drawImage(this.layer[7],0,0,canvas.width,canvas.height); 
            //6 montanhas
            Descamada(6,600)
            //5 colinas
            Descamada(5,540)
            //4 nuvens
            Descamada(4,680)
            //3 Castelo
            Descamada(3,600)
            //2 Arvores
            Descamada(2,600)
            //1 Chão
            Descamada(1,500)
          }
        }
//#endregion

//#region Personagem || player
        let player = {
            x:10,
            y:0,
            width: 100,
            height: 130,
            forcapulo: 24,
            qtdPulos: 0,
            score: 0,
            record: 0,
            personagem:{
              correndo:[],
              parado:[],
              pulando:[],
              morto:[]
            },
            image: new Image(this.width,this.height),
            calculoContagens: function(){
              if(this.score > this.record) this.record = this.score
              if(this.score == 0 ) fase = 1
              if(this.score == 10) fase = 2
              if(this.score == 30) fase = 3
            },
             desenhaPlayer:function(){
              ctx.fillStyle = "rgba(255,255,255,0.0)"
              ctx.fillRect(this.x,this.y,this.width,this.height)
            }
        }

//#endregion

//#region CamadaSpritesPersonagem
          var limiteImagens = {
          correndo: 8,
          parado: 10,
          pulando:12,
          morto: 8
        }
     dinossauro()
//#endregion

//#region Chão || Floor
        const objchao = {
            x: 0,
            h: 0,
            y: 0 ,
            cor: 'rgba(255, 255, 255, 0.0)',
            mostra: function(){
              this.y = canvas.height - this.h
              ctx.fillStyle = this.cor
              ctx.fillRect(this.x,this.y,canvas.width,this.h)
            }
        }
//#endregion

//#region  Obstaculo || Obstacles
        let obstaculos = {
          objetos: [],
          frame: 0,
          texturas:[],
          imagem: new Image(),
          cria: function(){
            this.objetos.push({
              h: Aleatorio(10,200),
              w: Aleatorio(40,120),
              x: canvas.width - 40,
              txt: this.texturas[Aleatorio(0,9)] 
            })
			if(player.score > 10) this.frame = Aleatorio(40,80)
			else this.frame = Aleatorio(70,100)
          },
          mostra: function(){
      
            if(this.frame == 0 ) this.cria()
            else this.frame --;
             let tam = this.objetos.length
             let elemento = this.objetos[0];
            for(let indice = 0; indice < tam; indice ++  ){
                elemento = this.objetos[indice]
                this.imagem.src = elemento.txt
                ctx.drawImage(this.imagem,elemento.x,objchao.y - elemento.h - 24,elemento.w,elemento.h)
            }
          },
          atualiza: function(){
            this.mostra();
            let tam = this.objetos.length
            let elemento = this.objetos[0];
            for(let indice = 0; indice < tam; indice ++ ){
              elemento = this.objetos[indice]
              elemento.x -= velocidade
              
                //Cada Elemento possui uma condição de colisão
                 if(player.x < elemento.x + elemento.w  &&
                    player.x + player.width >= (elemento.x +30)&&
                    player.y + player.height >= objchao.y - elemento.h)
                {
                  estados.inicio = false
                  estados.jogando = false
                  estados.morte = true
                }
                
                if(elemento.x <= 30 )
                {
                  this.objetos.splice(indice, 1);
                  player.score++;
                  tam --;
                  indice --;
                }
              
            }
          }
        }
        //Add Textura 
        //Este metodo só funciona por que as imagens estão numeradas 1,2,3,4.png
        for(let i=1;i <= 10; i ++){
          obstaculos.texturas.push(
            'images/texturas/'+i +'.png'
          )
        }
//#endregion

//#region Mundo || World
        const fisica = {
           gravidade: 2.5,
           velocidade: 0,
           calculo:function(){
           this.velocidade += this.gravidade;
           player.y += this.velocidade;
           }
        }
        const limites = () => {
          if(player.y > objchao.y - player.height ){
            player.y = objchao.y - player.height;
            player.qtdPulos = 0;
          //  velocidade = 0;
        }
          if(player.y < 0 ) {
            player.y = 0;
          }
          if(player.x < 0 ){
            player.x = 0;
          }
          if(player.x >= canvas.width - player.width){
            player.x = canvas.width - player.width
          }
        
        }
      
//#endregion

//chamando metodo Recursivo
       Draw();
//#region Camada de Inputs
        let autenticaMovimento = () => {
        window.addEventListener("keydown",TeclaPressionada);
        window.addEventListener("keyup",TeclaSolta);

        function TeclaPressionada(e) {
            let tecla = e.key;
            tecla = tecla.toLowerCase() 
            if((tecla == 'a') || (tecla == 'arrowleft'))  moveEsquerda = true
            if((tecla == 'w') || (tecla == 'arrowup'))    movecima = true
            if((tecla == 's') || (tecla == 'arrowdown'))  moveBaixo = true
            if(tecla == " " )                             pulo = true
            if(tecla == "enter"){
              estados.morte = false
              estados.inicio = false
              estados.jogando = true
            }
            if(tecla == "escape" ){
              estados.jogando = false
              estados.morte = false
              estados.inicio = true
            }
        }

        function TeclaSolta(e) {
            let tecla = e.key;
            tecla = tecla.toLowerCase();
            if((tecla == 'a') || (tecla == 'arrowleft'))   moveEsquerda = false;
            if((tecla == 'w') || (tecla  == 'arrowup'))  movecima = false
            if((tecla == 's') || (tecla == 'arrowdown')) moveBaixo = false;
            if(tecla == " ")   pulo = false
            
        }
        }
        var btnplay = new Image();
        btnplay.src = 'images/gameover.png'
        let frame = 0;
        let delay = 0;
        const geraDelay = (obj) => {
          if(delay == 0){
            obj.image.src = obj.personagem.correndo[frame]
            frame ++
            delay = 2;
          }
          else delay--;
        }
        autenticaMovimento();
//#endregion

//#region Movimentação || Movement
        function movimento(){
             if(movedireita){
              player.x += 0.5;
              if(frame >= limiteImagens.correndo) frame = 0
              geraDelay(player);  
              ctx.drawImage(player.image,player.x,player.y,player.width,player.height)
                       }  
             if(moveEsquerda){ 
              movedireita = false;   
              player.x -= 5
              if(frame >= limiteImagens.correndo) frame = 0
              geraDelay(player);
              ctx.drawImage(player.image,player.x,player.y - 20,player.width,player.height)
             }
             if(movecima) player.y -= 10
             if(moveBaixo) player.y += 10
             if(pulo) {
                if(player.qtdPulos < maxpulos){
                    if(frame >= limiteImagens.pulando) frame = 0
                    fisica.velocidade =- player.forcapulo;
                    player.qtdPulos++;
                    geraDelay(player);
              //      ctx.fillRect(player.x,player.y - 20,player.width,player.height)
                    ctx.drawImage(player.image,player.x,player.y - 20,player.width,player.height)
                
                }

          }
      
          //se estiver parado
            if(moveEsquerda == false && movedireita == false
              && pulo == false){
                movedireita = true;
            }
        }

        //#endregion

//#region Vivo,morto ou inicio || Alive,Dead or start
         function detectaEstado(){
              if(estados.inicio){
                menu();
            }
            else if(estados.jogando){
              player.desenhaPlayer();
              movimento()
              cenario.atualiza();
              obstaculos.atualiza();
              ctx.font = "60px Arcade"
              ctx.fillStyle = "red"
              ctx.fillText(player.score,canvas.width - 70,canvas.height/4 - 100,340);
            }
            else if(estados.morte){
              player.image.src = player.personagem.morto[0]
              ctx.drawImage(player.image,player.x,player.y,player.width,player.height)
              ctx.font = "70px Arcade"
              ctx.fillStyle = "red"
              ctx.fillText("You   Lose !!",canvas.width /2 - 110,canvas.height/2 + 40,340);
              ctx.fillStyle = "#A5201F"
              ctx.fillText("Seu Record: " + player.record,canvas.width/2 - 540,canvas.height - 530,300);
              player.score = 0;
              obstaculos.objetos = [];
              player.x = 0;
              cancelAnimationFrame(Draw);
            }
         }

//#endregion

//#region Chamar frames || Call Frames
        function render () {
              ctx.clearRect(0,0,canvas.width,canvas.height);
              cenario.fase();
              cenario.gera();
              player.calculoContagens();
              detectaEstado();   
              objchao.mostra()
              fisica.calculo();
              limites();
        }
        function sleep(milliseconds) {
          var start = new Date().getTime();
          for (var i = 0; i < 1e7; i++) {
            if ((new Date().getTime() - start) > milliseconds){
              break;
            }
          }
        }
        function Draw(){
            requestAnimationFrame(Draw)
            estados.condicao();
            render()
           // sleep(6)
        }
        
//#endregion