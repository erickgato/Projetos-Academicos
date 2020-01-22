var dinossauro = () => {
 //Atribuir Movimentaçao do dinossauro
 var limiteImagens = {
    correndo: 8,
    parado: 10,
    pulando:12,
    morto: 8
  }
  for(let i=1;i<= limiteImagens.correndo ;i++){
    player.personagem.correndo.push(
      'images/dino/png/Run ('+i +').png'
    )
  }
//10
  for(let i=1;i<= limiteImagens.parado;i++){
    player.personagem.parado.push(
     'images/dino/png/Idle ('+i +').png'
    )
  }
//12

  for(let i=1;i<=limiteImagens.pulando;i++){
    player.personagem.pulando.push(
        'images/dino/png/Jump ('+i +').png'
    )
  }
  
  for(let i=1;i<= limiteImagens.morto;i++){
    player.personagem.morto.push(
        'images/dino/png/Dead ('+i +').png'
    )
  }
}
var kakashi = () => {
    //Atribuir Movimentaçao do dinossauro
     
     for(let i=1;i<= limiteImagens.correndo ;i++){
       player.personagem.correndo.push(
         'images/dino/png/Run ('+i +').png'
       )
     }
   //10
     for(let i=1;i<= limiteImagens.parado;i++){
       player.personagem.parado.push(
        'images/dino/png/Idle ('+i +').png'
       )
     }
   //12
   
     for(let i=1;i<=limiteImagens.pulando;i++){
       player.personagem.pulando.push(
           'images/dino/png/Jump ('+i +').png'
       )
     }
     
     for(let i=1;i<= limiteImagens.morto;i++){
       player.personagem.morto.push(
           'images/dino/png/Dead ('+i +').png'
       )
     }
   }
    
 