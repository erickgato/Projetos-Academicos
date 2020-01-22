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
a; QUAL É O MAIOR e qual é o menor indice de acidentes de transito e a que cidades pertercem;
b: qual é a media de veiculos nas cinco cidades juntas  
c: qual é  a media de acidentes de transito nas cidades com menos de 2000 veiculos de passeio.
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
//todas as contadoras devem ser postas antes do laço de repetição 
//pois
//serão valores atribuidos ou seja que não se duplicam ou repetem
for (x=0;x<5;x++){
	printf("\nDigite o nome da cidade %d: ",x);
	scanf("%d",&cidades);
	printf("\ndigite o numero de veiculos de passeio: ");
	scanf("%d",&tot_veic);
	printf("\ndigite o numero de acidentes da cidade %d: ",x);
	scanf("%d",&acidente);
	if (acidente>cont2){
		//caso aconteça da variavel acidente ser maior que a contadora 1 então...;
		cont1=cidades;
		//então contadora 1 recebe o valor digitado na variavel cidade que será definida pelo maior numero de acidentes (comando abaixo);
		cont2=acidente;
		//armazene na contadora 2 o maior valor de acidentes,definido no comando se;
		media=(tot_veic+media);
		//atribui o valor da media com operações matematicas
		media=total;
		//valor total de veiculos será atribuido em sua variavel após efetuar a operação matematica do total;
		//sendo cada valor de cada das cidades somado a media;
	}
	else if (acidente<cont2){
		//caso o valor de acidentes seja menor que o valor ja atribuido na variavel contadora2 então inicie a condição;
		cont1=cont1;
		//caso está condição aconteça então minha primeira variavel contadora não tera valor alterado;
		cont2=cont2;
		//caso está condição aconteça então a segunda variavel contadora não terá valor alterado;
		media=(tot_veic+media);
		//atribui o valor de media somando o numero digitado no total 
		media=total;
		//valor total de veiculos será atribuido em sua variavel após efetuar a operação matematica do total;
		//sendo cada valor de cada das cidades somado a media;
		//repetindo a variavel nas duas condiçoes
		if (acidente<menor){
			//se acidente for menor  que a variavel contadora então;
			//cuidado pois esta condição apenas sera lida e executada se a condição de else if for completa;
			menor=acidente;
			//substitua o valor da varivel por acidente
			//ou seja
			//variavel contadora nesta condição será igual ao valor digitado pelo usuario em acidente;
			//*********caso está codiçao( proposta pelo if(se)) aconteça então
		//armazene o valor digitado em acidentes na variavel contadora (menor)
		men_city=cidades;
		//a varivel menor cidade será preencida com o dado digitado no comando escreva(PRINTF)CIDADE;
		}
		else if (acidente>menor){
			//se acidente for maior que a contadora então..
			menor=acidente;
			//caso seja maior atribua o valor da variavel 
			men_city=cidades;
			//atribua o valor da menor cidade caso aconteça 
		}
	}
}
total=media/5;
//variavel para armavenar o valor da media em uma contadora
//todas as respostas devem ser postas fora do laço de repetição pois são impressoes unicas
printf("a cidade com maior numero de acidentes é  cidade %d com %d acidentes\n",cont1,cont2);
//escreva o valor das variaveis contadora 1, 2 
//contadora 1 com valores de cidade 
//contadora 2 com valores de acidentes 
printf("\no menor acidente foi de %d na cidade %d\n",menor,men_city);
//escreva o valor das variaveis menor,menor_city;
//menor equipado com o valor da menor taxa de acidentes 
//men_city com o valor da cidade com menores acidentes;
printf("\na media total é de %f",media);
return 0;
}

