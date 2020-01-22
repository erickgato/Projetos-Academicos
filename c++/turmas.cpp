/*
	Name: Erick de souza Gato
	Copyright: Tec. desenvolvimento de sistemas
	Author: Erick de souza Gato
	Date: 14/06/19 13:31
	Description: construa um algoritimo que receba atraves de vetor tres turmas de 5 alunos cada
	e copie usando a funçao copia de tres disciplinas quaisquer e atribua a qualquer uma das turmas,utilize o laço de repetição;
*/
#include<stdio.h>
#include<stdlib.h>
#include<locale.h>
#include<string.h>

int main(){
	setlocale(LC_ALL,"portuguese");
	char  turma1[5][20],turma2[5][20],turma3[5][20],mat_turma[3][30],materias[3][30];
	int x;
	for(x=1;x<=5;x++){
		printf("Digite o nome do %dº aluno da turma 1: ",x);
		gets(turma1[x]);
		
	}
	for(x=1;x<=5;x++){
		printf("Digite o nome do %dº aluno da turma 2: ",x);
		gets(turma2[x]);
		
	}
	for(x=1;x<=5;x++){
		printf("Digite o nome do %dº aluno da turma 3: ",x);
		gets(turma3[x]);
		
	}
	for(x=1;x<=3;x++){
	printf("Digite o nome da %xª materia: ",x);
	gets(materias[x]);
}
	strcpy(mat_turma[1],materias[1]);
	strcpy(mat_turma[2],materias[2]);
	strcpy(mat_turma[3],materias[3]);
printf( "    turma 1   ");
	for(x=1;x<=5;x++){
printf("\no aluno  %s ficará com a materia %s",turma1[x],mat_turma[1]);
	}
	printf("\n\n");
	printf("    turma 2      ");
	for(x=1;x<=5;x++){
printf("\no aluno %s ficará com a materia %s",turma2[x],mat_turma[2]);
}
printf("\n\n"); 
       printf("     turma 3        ");
for(x=1;x<=5;x++){
	printf("\no aluno %s ficará com a materia %s",turma3[x],mat_turma[3]);
	
}
printf("\n\n");
}
