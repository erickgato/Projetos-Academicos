#include<stdlib.h>
#include<stdio.h>
#include<locale.h>
#include<math.h>
float r,x,b;
int decisao;
void soma(){
	printf("\ndigite o numero: ");
	scanf("%f",&r);
	printf("\ndigite mais um numero: ");
	scanf("%f",&b);
	x=r+b;
	printf("\nsoma =%.0f\n",x);
}
void sub(){
	printf("\ndigite o numero: ");
	scanf("%f",&r);
	printf("\ndigite mais um numero: ");
	scanf("%f",&b);
	x=r-b;
	printf("\nsubtração =%.0f\n",x);
}
void div(){
	printf("\ndigite o numero: ");
	scanf("%f",&r);
	printf("\ndigite mais um numero: ");
	scanf("%f",&b);
	x=r/b;
	printf("\ndivisão =%.0f\n",x);
}
void mult(){
	
	printf("\ndigite o numero: ");
	scanf("%f",&r);
	printf("\ndigite mais um numero: ");
	scanf("%f",&b);
	x=r*b;
	printf("\nmultiplicação =%.0f\n",x);
}
int main (){
	system("color 2");
	setlocale(LC_ALL,"portuguese");
	printf("olá digite \n1/soma\n2/subtração\n3/multiplicação\n4/divisão\n");
	scanf("%d",&decisao);
	switch(decisao){
		case 1:
			soma();
			break;
		case 2:
			sub();
			break;
		case 3:
			mult();
			break;
		case 4:
			div();
			break;
	}
	system("pause");
	return 0;
}

