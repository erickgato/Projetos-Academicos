#include<stdlib.h>
#include<stdio.h>
#include<locale.h>
#include<string.h>
int main (void){
	setlocale(LC_ALL,"portuguese");
	float idade[5],cont_media,media;
	char sexo [5][2],cor_cabelo[5][2],cor_olhos[5][2],cont_meninas=0,maior_idade=0;
	int x,y,z;
	for(x=1;x<=5;x++){
		printf("\n__________________________________Dados_da_%dª_pessoa_______________________________________",x);
		printf("\ndigite a idade da pessoa %d: ",x);
		scanf("%f%*c",&idade[x]);
		if(idade[x]>maior_idade){
			maior_idade=idade[x];
		}
		printf("\ndigite o sexo dessa pessoa (M=masculino // F=feminino): ");
		scanf("%s%*c",&sexo[x]);
		printf("\ndigite a cor do cabelo desta pessoa ( l=louros // p=pretos // c=castanhos): ");
		scanf("%s%*c",&cor_cabelo[x]);
		printf("\ndigite a cor dos olhos desta pessoa (a-azuis // c=castanhos):  ");
		scanf("%s%*c",&cor_olhos[x]);
		if((strcmp(cor_olhos[x],"c")==0) && (strcmp(cor_cabelo[x],"p")==0)){
		cont_media=cont_media+idade[x];
		
	}
	if((strcmp(sexo[x],"f")==0) && (strcmp(cor_cabelo[x],"l")==0) && (strcmp(cor_olhos[x],"a")==0) && (idade[x]>18) && (idade[x<=35])){
		//faz comparação de strings que sejam diferentes de 0,letras;
		cont_meninas=cont_meninas+1;
	}
		printf("---------------------------------------------------------------------------");
		printf("\n\n");
	} 
	media=cont_media/5;
	 printf("a media de idade das pessoas com olhos castanhos e cabelo preto é de: %.0f ",media);
	 printf("\nA quantidade de meninas com cabelos loiros olhos azuis e idade entre 18 e 35 são: %d ",cont_meninas);
	 printf("\nA maior idade entre os habitantes é de : %d",maior_idade);
}
