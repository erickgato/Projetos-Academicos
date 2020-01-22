<?php
//criando função para automatizar processo de formatação de fonte
function formFont($pdf,$nome,$tamanho)
{
  $pdf->SetFont($nome,(''),$tamanho);
}
//circulos
//iniciando o objeto
ob_start();
//requerindo uma vez a solicitação de pagina
require_once 'fpdf/form.php';
//inportando os parametro
$pdf = new PDF_graph('P','mm','A4');
//criando a pagina
$pdf->AddPage('P','A4',0);
/////////////////////////
$pdf->setfont('arial','B',30);

$pdf->SetFillColor(151,81,151);
$pdf->SetXY(0,0);
$pdf->rect(0,0,65,298,'F');
$pdf->SetTextColor(255,255,255);
$pdf->SetXY(0,30);
$text = "Segmentos de
mercado";
$pdf->multicell(54,10,$text,0,0);

formFont($pdf,'arial',14);
$pdf->SetTextColor(199, 189, 199);
$pdf->SetXY(30,60);
$pdf->cell(44,7,utf8_decode('Relatorio do'),0 ,1);
$pdf->SetX(30);
$pdf->cell(34,7,utf8_decode('Perfil De'),0,1);
$pdf->SetX(30);
$pdf->cell(34,7,utf8_decode('Consumidor'),0,1);

$pdf->setXY(85,12);
$pdf->SetTextColor(0, 0, 0);
$pdf->setfont('arial','I',14);
$pdf->cell(10,19,'Idade dos grupos de consumidor',0,0);
$pdf->Ln();

//Numeros laterais,Idades
//há um padrão, a adição de 5 no valor base
formFont($pdf,'Arial',10);
$pdf->setY(50);
for ($x=12; $x <=17 ; $x++)   //são 6 colunas com numeros
   {
      $pdf->setX(80);
      if($x==12){       //x estara no seu valor incial, assim atribuindo os valores
          $y = $x+5;
          $string = "$x - $y";
          $pdf->cell(12,8,$string,0,1);
    }
    else{
          $c = $y+1;
          $y = $y + 5;
          $string = "$c - $y";
          $pdf->cell(12,8,$string,0,1);


        }
}

//criando linhas na vertical
$porcentagem = array('0%','10%','20%','30%','40%','');
$cont = 0;
$pdf->SetDrawColor(212,204,205);
for ( $x=100 ; $x < 200  ; $x=$x+20)
    {
        $pdf->Line($x,50,$x,97.6);
        $pdf->SetX($x);
        $pdf->cell(12,8,"$porcentagem[$cont]");
        $cont ++;

      }
$pdf->setlinewidth(3);
//fim das 5 linhas verticais


/*
$pdf->SetDrawColor(111,253,168);
$pdf->setlinewidth(3);
$pdf->Line(101,52,170,52);

$pdf->SetDrawColor(255,187,209);
$pdf->Line(101,55.2,170,55.2);

$pdf->SetDrawColor(111,253,168);
$pdf->Line(101,61,170,61);

$pdf->SetDrawColor(255,187,209);
$pdf->Line(101,64.2,170,64.2);
*/
// automatizando graficos com valores
//passados por parametro
$men = array(); $fem = array();
$men[0] = 13;  $fem[0] = 11;
$men[1] = 20;  $fem[1] = 23;
$men[2] = 35;  $fem[2] = 43;
$men[3] = 70;  $fem[3] = 76;
$men[4] = 50;  $fem[4] = 43;
$men[5] = 40;  $fem[5] = 36;

//criando linhas na horizontal
$cont = 0;
for ($y=52; $y <= 98; $y=$y+8)
  {
        $men[$cont] = $men[$cont] + 100;
        $fem[$cont] = $fem[$cont] + 100;
        $pdf->SetDrawColor(220,89,96);
        $pdf->Line(101.3,$y,$men[$cont],$y);
        $pdf->SetDrawColor(120,23,104);
        $pdf->Line(101.3,($y+3.5),$fem[$cont],($y+3.5));
        $cont++;
  }
//fim das linhas
//legendas embaixo do grafico
$pdf->setY(108);
$pdf->SetDrawColor(220,89,96); 
$pdf->circle(130,110,1);
$pdf->setX(135);
$pdf->cell(5,5,'homens');
$pdf->SetDrawColor(120,23,104);
$pdf->setX(165);
$pdf->cell(5,5,'mulheres');
$pdf->circle(160,110,1);




//fim
$pdf->SetXY(77,70);
$pdf->cell(8,8,utf8_decode('º'));
$pdf->setlinewidth(0.3);
$pdf->SetDrawColor(0,0,0);
$pdf->Line(78,73.3,72,73.3);
$pdf->Line(72,73.3,72,120);
$pdf->SetXY(70.5,117.2);
$pdf->cell(8,8,utf8_decode('º'));

$pdf->SetXY(74,117.2);
$pdf->cell(8,8,utf8_decode('Os principais consumidores  são homens e mulheres entre 23-32.'));
$pdf->setFont('arial','','15');
$pdf->setXY(70,123);
$pdf->cell(8,10,utf8_decode('Estilo de vida e comportamento do consumidor principal'));


$pdf->SetFillColor(248,248,248);
$pdf->SetXY(65.1,134);
$pdf->cell(140,142,'',0,0,'R','TRUE');
$pdf->ln(1);

$pdf->setFont('times','B','14');
$pdf->SetDrawColor(142,142,142);
$texto = " consumidores entre 23 e 17 anos
têm uma renda média anual de US $ 49.000.";
$pdf->setX(65.2);
$pdf->multicell(140,5,utf8_decode($texto),0,0,'R');
$pdf->Image('image/pessoa.png',70,133,13,13,'PNG');
$pdf->setFont('times','','14');

$pdf->SetX(67);
$pdf->cell(10,10,utf8_decode('53% Moram com os pais'),0,2);
$pdf->cell(10,10,utf8_decode('24% Vivem sozinhos sem um parceiro ou dependente'),0,2);
$pdf->cell(10,10,utf8_decode('42% Alugam espaço vital em vez de possuir propriedade'),0,2);
$pdf->cell(10,10,utf8_decode('36% Reivindicam se preocupar com questões sociais'),0,2);
$pdf->cell(10,10,utf8_decode('12% afirmam ser muito social ou politicamente ativo/preocupados'),0,2);
$pdf->cell(10,10,utf8_decode('15% estão cursando pós-graduação'),0,2);

$texto = " consumidores entre 28 e 32 anos
têm uma renda média anual de US $ 62.000.";
$pdf->setX(65.2);
$pdf->setFont('times','B','14');
$pdf->multicell(140,5.3,utf8_decode($texto),0,0,'R');
$pdf->Image('image/pessoa.png',70,204,13,13,'PNG');
$pdf->setFont('times','','14');

$pdf->SetX(67);
$pdf->cell(10,10,utf8_decode('53% Moram em casa com os pais'),0,1);
$pdf->SetX(67);
$pdf->cell(10,10,utf8_decode('24% Vivem com um parceiro ou dependentes'),0,1);
$pdf->SetX(67);
$pdf->cell(10,10,utf8_decode('42% Alugam espaço vital em vez de possuir propriedade'),0,1);
$pdf->SetX(67);
$pdf->cell(10,10,utf8_decode('36% Reivindicam se preocupar com questões sociais'),0,1);
$pdf->SetX(67);
$pdf->cell(10,10,utf8_decode('12% afirmam ser muito social ou politicamente ativo/preocupados'),0,1);
$pdf->SetX(67);
$pdf->cell(10,10,utf8_decode('15% estão cursando pós-graduação'),0,0);
$pdf->Image('image/Livro.png',16,97,35,35,'PNG');
$pdf->Image('image/pessoa2.png',15,160,35,35,'PNG');
$pdf->Image('image/Bolsa.png',15,220,35,35,'PNG');

$pdf->Output();
?>
