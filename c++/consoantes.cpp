/*
	Name: Erick de Souza Gato
	Copyright:TEC. desenvolvimento de sistemas
	Author: Erick de Souza Gato
	Date: 18/06/19 13:30
	Description: 002:faça um programa que receba uma frase calcule e mostre a quantidade
	de consoantes da frase digitada
	consoantes maiusculas e minusculas
*/
#include<stdio.h>
#include<stdlib.h>
#include<locale.h>
#include<string.h>
#include<ctype.h>
int main(){
setlocale(LC_ALL,"portuguese");
	char frase[100],copia[100];
	int x,tamanho,cont_con,consoantes;
	printf("_________________________________________________________"); 
	printf("\n\n");
	printf("\nDigite uma frase: ");
	gets(frase); 
	tamanho=strlen(frase);
	strcpy(copia,frase);
	strlwr(copia);
 	for(x=0;x<tamanho;x++){
		if(x==0){ 
			cont_con = 0; 
		}
		if(copia[x] == 'a'|| copia[x] == 'e'||  
	copia[x] == 'i'|| copia[x] == 'o'|| copia[x] == 'u' || copia[x] == ' '){ 
	//cosoantes  B, C, D, F, G, J, K, L, M, N, P, Q, R, S, T, V, W, X, Z
	
	      cont_con=cont_con+1;
	  }
	}
	consoantes = tamanho-cont_con;
	printf("\nO tamanho da frase '%s'\né de: %d ",frase,tamanho);
	printf("\nA quantidade de consoantes nesta frase é de: %d\n",consoantes);
	printf("\n________________________________________________________\n");
	system("pause");   //Comando para travar a tela até que receba um valor de entrada;
	return 0;

}
