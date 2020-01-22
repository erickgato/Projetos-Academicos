<?php
ob_start();
require_once 'fpdf/fpdf.php';
$pdf = new FPDF('P','mm','A4');
$pdf->AddPage('P','A4',0);
$pdf->SetFont('arial','',11);

//cabeçalho
$pdf->SetTextColor(42, 142, 172);
$pdf->SetXY(16,17);
$nome_empresa = "Nome da Companhia";
$endereco = "Rua albino alves 365,057-280";
$tel = "(41)33875890";
$email = "companhia@gmail.com";
$pdf->cell(12,5,$nome_empresa,0,2);
$pdf->cell(12,5,$endereco,0,2);
$pdf->cell(12,5,$tel,0,2);
$pdf->cell(12,5,$email,0,2);
$pdf->Image('logo.png',125,10,70,30,'PNG'); //não achei a logo

//bloco azul
$pdf->SetFont('arial','',14);
$pdf->SetFillColor(42, 142, 172);
$pdf->ln(11);
$pdf->setX(16);
$pdf->cell(180,35,'',0,0,'R','TRUE');
$pdf->SetTextColor(255,255,255);
$pdf->SetDrawColor(255,255,255);
$pdf->setlinewidth(0.3);
$pdf->SetXY(25,50);
$pdf->cell(28,5,'Fatura Para:','B',1);

//Dados do cliente
$nome = "John Doe";
$endereco_cliente  = "796 Silver Harbour,";
$cep = "TX 79273, US";
$email_cliente = "jhon@exemplo.com";

$pdf->ln(3);
$pdf->SetX(24);
$pdf->SetFont('arial','',10);
$pdf->cell(12,5,$nome,0,2);
$pdf->cell(12,5,$endereco_cliente,0,2);
$pdf->cell(12,5,$cep,0,2);
$pdf->cell(12,5,$email_cliente,0,2);

//lado direito do retangulo azul
$pdf->SetXY(138,50);
$numero_compra = "55033645";
$pdf->SetFont('arial','',14);
$pdf->cell(12,8,'FATURA DA COMPRA',0,2);
$pdf->SetX(156);
$pdf->cell(12,1,"FAT-$numero_compra",0,1);

$pdf->SetFont('arial','',10);
$pdf->SetXY(135,70);
$data_val = "28 Fev ,2019";
$data_ven = "28 mai ,2019";
$pdf->cell(12,5,"Data da Fatura:",0,2);
$pdf->cell(12,5,"Data de Vencimento: ",0,0);
$pdf->SetXY(169,70);
$pdf->cell(12,5,"$data_val",0,2);
$pdf->cell(12,5,"$data_ven",0,0);

//nota do produto
$pdf->SetFont('arial','',10);
$pdf->SetFillColor(189, 185, 185);
$pdf->ln(22);
$pdf->setX(16);
$pdf->cell(85,6,utf8_decode('Descrição'),0,0,'C','TRUE');

$pdf->SetXY(102,97);
$pdf->cell(18,6,'QTD',0,0,'C','TRUE');

$pdf->SetXY(121,97);
$pdf->cell(18,6,'ICMS',0,0,'C','TRUE');

$pdf->SetXY(140,97);
$pdf->cell(18,6,utf8_decode('PREÇO'),0,0,'C','TRUE');

$pdf->SetXY(159,97);
$pdf->cell(18,6,'Desconto',0,0,'C','TRUE');

$pdf->SetXY(178,97);
$pdf->cell(18,6,'TOTAL',0,0,'C','TRUE');

$pdf->SetFillColor(243, 243, 243);
$pdf->SetTextColor(135, 137, 140);

//Definindo informações do produto 
$qtd = array(1,1,1,1);
$icms = array("50","$ 5000","$ 0.0","$ 0.0");
$preco = array(100,100,100,100);
$desc = array("50","$ 5000","$ 0.0","$ 20 000");
$total = array(75,100,100,80);
$produto = array("AMD Athlon X2DC-7450","PDC-ES300","LG 18.5'WLCD"
,"HP LaserJet (Citroën)");
$descri = array("2.4GHz/1GB/160GB/SMP-DVD/VB","2.6GHz/1GB/320GB/SMP-DVD/FDD/VB","Teste multilíngue suportado nesta seção adicionando
descrição personalizada do produto aqui","Ceci est une description de test pour le produit HP LaserJet 5200");
$cont = 0;
$pdf->SetFont('arial','',8);
for ($y=104; $y <= 146 ; $y=$y+11) 
	{
        
        $pdf->SetTextColor(135, 137, 140);
        $pdf->SetXY(16,$y);
  	   	$pdf->cell(85,5,utf8_decode("$produto[$cont]"),0,1,'L','TRUE');
  	   	$pdf->SetXY(16,($y+5));
  	   	$pdf->multicell(85,3,utf8_decode("$descri[$cont]"),0,1,'L','TRUE');

  		$pdf->SetXY(102,$y);
  	   	$pdf->cell(18,10,"$qtd[$cont]",'B',1,'C','TRUE');

	 	$pdf->SetXY(121,$y);
	  	$pdf->cell(18,10,"$icms[$cont]",'B',1,'C','TRUE');

	  	$pdf->SetXY(140,$y);
	  	$pdf->cell(18,10,"$preco[$cont]",'B',1,'C','TRUE');

	  	$pdf->SetXY(159,$y);
	  	$pdf->cell(18,10,"$desc[$cont]",'B',1,'C','TRUE');

	  	$pdf->SetTextColor(85, 168, 199);
	  	$pdf->SetXY(178,$y);
	  	$pdf->cell(18,10,"$total[$cont]",'B',1,'C','TRUE');
	  	$cont++;
	}

//Definindo preço total
$texto_dir = array("Sub total","ICMS 10%","Disconto 10%","Envio","Grand Total");
$valores = array(355.0,35.50,39.05,100.0,451.45);
$cont = 0;
$pdf->SetTextColor(255, 255, 255);
$pdf->SetFont('arial','B',8);
for ($y=145; $y <= 170 ; $y=$y+6) {

$pdf->SetXY(140,$y);
$pdf->SetFillColor(42, 142, 172);
$pdf->cell(38,5,"$texto_dir[$cont]",'B',1,'R','TRUE');
	if($cont == 3){
		$pdf->SetTextColor(152, 36, 33);
		$pdf->SetXY(179,$y);
		$pdf->cell(18,5,"$ $valores[$cont] ",'B',1,'C','TRUE');
		$cont++;
		$pdf->SetTextColor(255, 255, 255);
	}
	else {
		$pdf->SetXY(179,$y);
		$pdf->cell(18,5,"$ $valores[$cont] ",'B',1,'C','TRUE');
		$cont++;
	}
									}
//Mensagem de Agradecimento
$pdf->SetFont('arial','',13);
$pdf->SetTextColor(42, 142, 172);
$pdf->SetXY(20,180);
$pdf->cell(20,10,"Obrigado!",0);

//Avisos
$pdf->SetXY(20,196);
$pdf->SetTextColor(65, 65, 65);
$pdf->SetFont('arial','',12);
$pdf->cell(20,3,"AVISO:",0,2);
$pdf->SetFont('arial','',10);
$pdf->cell(20,10,utf8_decode("Uma cobrança financeira de 1,5% será feita sobre os saldos não pagos após 30 dias."),0,1);

//Rodapé
$pdf->SetFont('arial','B',9);
$pdf->SetXY(20,260);
$pdf->SetDrawColor(65,65,65);
$pdf->SetTextColor(65, 65, 65);
$pdf->cell(175,3,'','B',2);
$pdf->ln(1);
$pdf->SetX(20);
$pdf->cell(13,3,utf8_decode("Compre este script de ErickGato "),'',0);
$pdf->SetX(90);
$pdf->cell(13,3,utf8_decode("PHP PDF Biblioteca de fatura  "),'',0);
$pdf->SetX(180);
$pdf->cell(13,3,utf8_decode("Pag N°1. "),'',0);

//THE END 
$pdf->Output();
?>
