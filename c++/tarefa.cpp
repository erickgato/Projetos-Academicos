/*
	Name: Erick de souza gato
	Copyright: Tecnico em desenvolvimento de sistemas 
	Author: Erick de Souza gato
	Date: 16/05/19 23:19
	Description: foi feita uma estatistica em 5 cidades brasileiras para coletar dados sobre acidentes de transito . foram obtidos os seguintes dados: 
a: codigo da cidade ;
b|: numero de veiculos de passeio;
c: numero de acidentes de trasito com vitmas;
deseja se saber: 
a; QUAL � O MAIOR e qual � o menor indice de acidentes de transito e a que cidades pertercem;
b: qual � a media de veiculos nas cinco cidades juntas  
c: qual �  a media de acidentes de transito nas cidades com menos de 2000 veiculos de passeio.
variaveis necessarias: 
*/

#include<stdio.h>
#include<stdlib.h>
#include<locale.h>





int main (){
setlocale(LC_ALL,"portuguese");
printf("__________________________bem vindo___________________________________________");
int tot_veic;
float total;
//declarando variaveis do tipo inteiro
int x,acidente,cont2,media,menor,men_city,cidades,cont1;
cont1=0;
cont2=0;
media=0;
menor=0;
men_city=0;
total=0;
//todas as contadoras devem ser postas antes do la�o de repeti��o 
//pois
//ser�o valores atribuidos ou seja que n�o se duplicam ou repetem
for (x=0;x<5;x++){
	printf("\nDigite o nome da cidade %d: ",x);
	scanf("%d",&cidades);
	printf("\ndigite o numero de veiculos de passeio: ");
	scanf("%d",&tot_veic);
	printf("\ndigite o numero de acidentes da cidade %d: ",x);
	scanf("%d",&acidente);
	if (acidente>cont2){
		//caso aconte�a da variavel acidente ser maior que a contadora 1 ent�o...;
		cont1=cidades;
		//ent�o contadora 1 recebe o valor digitado na variavel cidade que ser� definida pelo maior numero de acidentes (comando abaixo);
		cont2=acidente;
		//armazene na contadora 2 o maior valor de acidentes,definido no comando se;
		media=(tot_veic+media);
		//atribui o valor da media com opera��es matematicas
		media=total;
		//valor total de veiculos ser� atribuido em sua variavel ap�s efetuar a opera��o matematica do total;
		//sendo cada valor de cada das cidades somado a media;
	}
	else if (acidente<cont2){
		//caso o valor de acidentes seja menor que o valor ja atribuido na variavel contadora2 ent�o inicie a condi��o;
		cont1=cont1;
		//caso est� condi��o aconte�a ent�o minha primeira variavel contadora n�o tera valor alterado;
		cont2=cont2;
		//caso est� condi��o aconte�a ent�o a segunda variavel contadora n�o ter� valor alterado;
		media=(tot_veic+media);
		//atribui o valor de media somando o numero digitado no total 
		media=total;
		//valor total de veiculos ser� atribuido em sua variavel ap�s efetuar a opera��o matematica do total;
		//sendo cada valor de cada das cidades somado a media;
		//repetindo a variavel nas duas condi�oes
		if (acidente<menor){
			//se acidente for menor  que a variavel contadora ent�o;
			//cuidado pois esta condi��o apenas sera lida e executada se a condi��o de else if for completa;
			menor=acidente;
			//substitua o valor da varivel por acidente
			//ou seja
			//variavel contadora nesta condi��o ser� igual ao valor digitado pelo usuario em acidente;
			//*********caso est� codi�ao( proposta pelo if(se)) aconte�a ent�o
		//armazene o valor digitado em acidentes na variavel contadora (menor)
		men_city=cidades;
		//a varivel menor cidade ser� preencida com o dado digitado no comando escreva(PRINTF)CIDADE;
		}
		else if (acidente>menor){
			//se acidente for maior que a contadora ent�o..
			menor=acidente;
			//caso seja maior atribua o valor da variavel 
			men_city=cidades;
			//atribua o valor da menor cidade caso aconte�a 
		}
	}
}
total=media/5;
//variavel para armavenar o valor da media em uma contadora
//todas as respostas devem ser postas fora do la�o de repeti��o pois s�o impressoes unicas
printf("a cidade com maior numero de acidentes �  cidade %d com %d acidentes\n",cont1,cont2);
//escreva o valor das variaveis contadora 1, 2 
//contadora 1 com valores de cidade 
//contadora 2 com valores de acidentes 
printf("\no menor acidente foi de %d na cidade %d\n",menor,men_city);
//escreva o valor das variaveis menor,menor_city;
//menor equipado com o valor da menor taxa de acidentes 
//men_city com o valor da cidade com menores acidentes;
printf("\na media total � de %f",media);
return 0;
}

