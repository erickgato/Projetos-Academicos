#include<stdio.h>
#include<stdlib.h>
#include<locale.h>
int main()
{
	setlocale(LC_ALL,"portuguese");
	float  conta,saque,deposito,trasf,poupanca,valor1;
	int escolha,escolha2,x;
	//declara variaveis inteiras e float 
	printf("digite seu salario: ");
	//imprime uma mensagem na tela 
	scanf("%f",&conta);
	//escaneia o valor digitado pelo usuario
for (x=0;x<100;x++){
	//abtre um laco de repeticao, para a variavel x=0 so termine quando x for maior que 100
	printf("escolha uma das opçoes \n1/saque\n2/deposito\n3/trasferencia\n4/poupanca: ");
	scanf("%d",&escolha);
	switch (escolha){
		//escaneia a variavel escolha para case 
		case (1):
			//caso o valor digitado seja 1 entao faça..,
		printf("quanto deseja retirar de sua conta: ");
		scanf("%f",&saque);
	 saque=conta-saque;
	 printf("o valor de sua conta bancaria é de: %f ",saque);
	 break;
	 //pare o comando ou seja fim do 1 caso 
	 case (2):
	 printf("quanto deseja depositar:");
	 scanf("%f",&deposito);
	 deposito=deposito+conta;
	 // o valor da variavel deposito é o proprio menos a conta
	 printf("sua conta bancaria atualmente está com o valor de %f ",deposito);
	 break;
	 case (3):
	 printf("digite o valor a ser trasferido: ");
	 scanf("%f",&trasf);
	 trasf=conta-trasf;
	 //variavel trasf é atribuida a 
	 printf("o valor de sua conta bancaria é de %f ",trasf);
	case (4):
    	printf("digite o valor ir para poupança: ");
    	scanf("%f",poupanca);
    	valor1=(12*poupanca)/100;
    	poupanca=conta-poupanca + valor1;
    	
    	printf("sua poupança esta com o valor de %f",poupanca);
	}
	}
system("pause");
//trava a tela ate que seja digitado 
return 0;
//fecha o programa
}
//fecha o escopo 
