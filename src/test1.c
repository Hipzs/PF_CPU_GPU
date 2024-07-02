
#include <stdio.h>
#include <stdlib.h> 


#define COUCOU() printf("Hello world");


// typedef struct PF PFa;
struct Particle{
	int nb_particle;
	int nb_games;

} Pf;


int main2(int argc, char *argv[])
{   
	
	printf("nb count : %d\n",argc);
	int tableau[argc];
	char *p;
	printf("tab = %p\n",tableau);
		int i=1;


	for (;i<argc;i++){
		tableau[i] = strtol(argv[i],&p,10);
		printf("HUm  : %d\n",tableau[i]);
		//printf("nb count : %s\n",argv[i]);
	}
	tableau[7]  =69;

	for (int j=1;j<5+i;j++){
		printf("PT = %p   , int = %i \n",tableau+j,*(tableau+j));
	}


	COUCOU();



	// PF plop = {5,6};

	// printf("\n%i\n",plop.nb_games	);

	return 0;
}	



