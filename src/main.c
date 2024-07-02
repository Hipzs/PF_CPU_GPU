
#include <stdlib.h>
#include <stdio.h>
#define NB_PARTICLES 10
#define NB_STATE 6

struct Particle{
	double state[NB_STATE];

};
typedef struct Particle Particle;




void print_Particle(Particle * particle){
	
	for(int j=0;j<NB_STATE;j++){
		printf("%f ", particle->state[j]);
	}
	printf("\n");
};

Particle init_particle(){
	
	double state[NB_STATE] = {0};
	Particle particle = {{state[NB_STATE]}};
	return particle;
}


struct ParticleFilter{
	Particle particles[NB_PARTICLES]; 
};


void print_PF(struct ParticleFilter * pf	){

	printf("Nb particle = %d, Nb state = %d, \n", NB_PARTICLES,NB_STATE);

	for(int i=0;i<NB_PARTICLES;i++){
		print_Particle(&(pf->particles[i]));
	}

}

void init_pf(struct ParticleFilter * pf){

	for(int i=1;i<NB_PARTICLES;i++){
		pf->particles[i]= init_particle();
	}
}


int main(void){

 	struct ParticleFilter *pf = malloc(sizeof(struct ParticleFilter ));

	init_pf(pf);
    // FILE* random = fopen("/dev/urandom", "rb");
    // if (!random || fread(&pf, sizeof(pf), 1, random) != 1) {
    //     fputs("Failed to generate random data", stderr);
    //     return -1;
	// }
    // fclose(random);

	print_PF(pf);

	printf("size of pf ? %ld\n",sizeof(*pf));
    // printf("foo.d = %d\n", pf.nb_particles);
}


