<?php
function formFont($pdf,$nome,$tamanho)
{
  $pdf->SetFont($nome,('B'),$tamanho);
}
ob_start();
require_once 'fpdf/fpdf.php';
$pdf = new FPDF('P','mm','A4');
$pdf->AddPage('P','A4',0);
/////////////////////////////////////
formFont($pdf,'arial',25);
$pdf->SetXY(0,0);
$pdf->SetFillColor(34, 130, 171);
$pdf->cell(300,36,'',1,0,'R','TRUE');
$pdf->SetTextColor(255,255,255);
$pdf->setXY(11,13);
$pdf->cell(50,20,utf8_decode('Descrição'),0,0,'R');
$pdf->setX(160);
formFont($pdf,'courier',30);
$pdf->cell(40,20,'Brand');
$pdf->setX(89);
formFont($pdf,'arial',8);
$pdf->cell(9,7,'www.youtube.com',0,2);
$pdf->cell(9,7,'www.seila.com',0,2);
$pdf->cell(9,7,'www.voce.com',0);
//////////////////////////////////////
$pdf->ln(30);
$pdf->setX(20);
formFont($pdf,'arial',10);
$pdf->cell(50,9,'Caixa A',0,0,'C','TRUE');
$pdf->setX(75);
formFont($pdf,'Arial',20);
$pdf->SetTextColor(99, 112, 117);
$pdf->cell(15,12,'item 001',0,0,'L');
$pdf->ln(10);
formFont($pdf,'Times',10);
$pdf->setX(79);
$texto1="At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis
praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias
excepturi sint occaecati cupiditate non provident.";
$pdf->MultiCell(129,6.5,utf8_decode($texto1),0,'J');
$pdf->setX(79);
$marcadores = "°But I must explain to you how all this
° mistaken idea of denouncing pleasure
° and praising pain was born and I will give you a complete
° account of the system.
";
$pdf->MultiCell(129,6.5,utf8_decode($marcadores),0,'J');
$pdf->SetDrawColor(99, 112, 117);
$pdf->SetLineWidth(2);
$pdf->Line(46, 67, 46, 148);
$pdf->image('lampada.png',31,75,30,29,'PNG');
$pdf->setX(20);
formFont($pdf,'arial',10);
$pdf->SetTextColor(255,255,255);
$pdf->cell(50,9,'Caixa B',0,0,'C','TRUE');
$pdf->SetTextColor(99, 112, 117);
$pdf->setX(76);
formFont($pdf,'Arial',20);
$pdf->cell(15,12,'item 002',0,0,'L');
formFont($pdf,'Times',10);
$pdf->setXY(60,130);
$texto2 = 'At vero eos et accusamus et iusto odio dignissimos ducimus
qui blanditiis.';
$pdf->MultiCell(129,6.5,utf8_decode($texto2),0,'J');
$pdf->setX(62);
$pdf->SetTextColor(255,255,255);
formFont($pdf,'arial',11);
$pdf->cell(140,8,'OUTRO',0,2,'L','TRUE');
formFont($pdf,'times',9);
$pdf->SetTextColor(99, 112, 117);
$pdf->SetX(80);
for ($i=1; $i <= 5 ; $i++) {
  $pdf->cell(9,7,'item'.$i,0,2);
}
$pdf->SetXY(140,151);
for ($i=6; $i <= 10 ; $i++) {
  $pdf->cell(9,7,'item'.$i,0,2);
}
$pdf->image('retecencias.png',31,145,30,29,'PNG');
$pdf->Line(46, 171, 46, 297);
$pdf->ln(4);
formFont($pdf,'arial',10);
$pdf->SetTextColor(255,255,255);
$pdf->setX(22);
$pdf->cell(50,9,'Luctus Maurius',0,0,'C','TRUE');
$pdf->setX(76);
$pdf->SetTextColor(99, 112, 117);
formFont($pdf,'Arial',20);
$pdf->image('code.png',31,230,30,29,'PNG');
$pdf->cell(15,12,'item 003',0,0,'L');
formFont($pdf,'Times',10);
$pdf->SetXY(70,207);
$texto3 = "But I must explain to you how all this mistaken idea of denouncing
pleasure and praising pain was born and I will give you a complete account of
the system, and expound the actual teachings of the great explorer of the truth,
the master-builder of human happiness. No one rejects, dislikes, or avoids
pleasure itself, because it is pleasure.";
$pdf->MultiCell(129,6.5,utf8_decode($texto3),0,'J');
$pdf->setX(70);
$texto4 = "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur Excepteur sint occaecat cupidatat non proident. ";
$pdf->MultiCell(129,6.5,utf8_decode($texto4),0,'J');
$pdf->setX(65);
$pdf->SetLineWidth(1);
$pdf->cell(120,20,'',1,0,'R');
//$pdf->image('icone.png',31,140,30,29,'PNG');
$pdf->setX(80);
$pdf->cell(9,7,'lorem ipslum',0,0);
$pdf->setX(120);
$pdf->cell(9,7,'sed do eiusmod tempor',0,2);
$pdf->setX(80);
$pdf->cell(9,7,'dolor simet sit ',0,0);
$pdf->setX(120);
$pdf->cell(9,7,'Duis aute irure dolor',0,0);
$pdf->output();
?>
