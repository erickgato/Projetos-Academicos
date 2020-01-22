/*
	Name:Erick de souza gato
	Copyright: tecnico em desenvolvimento de sistemas 
	Author: erick 
	Date: 15/05/19 14:58
	Description: Uma pequena loja de artesanato possui apenas um vendedor e comercializa dez tipos de objetos. O vendedor recebe, mensalmente, salário de R$ 545,00, acrescido de 5% do valor total de suas vendas.
O valor unitário dos objetos deve ser informado e armazenado em um vetor;
A quantidade vendida de cada peça deve ficar em outro vetor, mas na mesma posição. 
Crie um programa que receba os preços e as quantidades vendidas, armazenando-os em seus respectivos vetores (ambos com tamanho dez).
Depois, determine e mostre:
Um relatório contendo: quantidade vendida, valor unitário e valor total de cada objeto. Ao final, deverão ser mostrados o valor geral das vendas e o valor da comissão que será paga ao vendedor; 
E o valor do objeto mais vendido e sua posição no vetor (não se preocupe com empates).
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
	printf("\npreço do produto %d: ",i+1);
	scanf("%f",&preco[10]);
tudo[10]=quantidade[10] [20]*preco[10][100];
	printf("a quantidade vendida foi de %f",tudo[i]);
}
system("pause");
return 0; 
}

