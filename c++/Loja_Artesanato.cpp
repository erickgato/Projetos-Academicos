/*
	Name:Erick de souza gato
	Copyright: tecnico em desenvolvimento de sistemas 
	Author: erick 
	Date: 15/05/19 14:58
	Description: Uma pequena loja de artesanato possui apenas um vendedor e comercializa dez tipos de objetos. O vendedor recebe, mensalmente, sal�rio de R$ 545,00, acrescido de 5% do valor total de suas vendas.
O valor unit�rio dos objetos deve ser informado e armazenado em um vetor;
A quantidade vendida de cada pe�a deve ficar em outro vetor, mas na mesma posi��o. 
Crie um programa que receba os pre�os e as quantidades vendidas, armazenando-os em seus respectivos vetores (ambos com tamanho dez).
Depois, determine e mostre:
Um relat�rio contendo: quantidade vendida, valor unit�rio e valor total de cada objeto. Ao final, dever�o ser mostrados o valor geral das vendas e o valor da comiss�o que ser� paga ao vendedor; 
E o valor do objeto mais vendido e sua posi��o no vetor (n�o se preocupe com empates).
*/

#include<stdlib.h>
#include<stdio.h>
#include<math.h>
#include<locale.h>



int main (){ 
setlocale(LC_ALL,"portuguese");
float preco[10][20],quantidade[10][100],tudo[10];
int i=0;
for (i=0;i<10;i++){
	printf("\ndigite a quantidade do produto %d: ",i+1);
	scanf("%d",&quantidade[10]);
	printf("\npre�o do produto %d: ",i+1);
	scanf("%f",&preco[10]);
tudo[10]=quantidade[10] [20]*preco[10][100];
	printf("a quantidade vendida foi de %f",tudo[i]);
}
system("pause");
return 0; 
}

