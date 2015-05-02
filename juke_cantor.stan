data{
	int N;
	int K;
	nex <- matrix[N,K];
	vector[4] alpha;
	vector[4] beta;
	real lambda;
}
paramaters{
	theta ~ dirichlet(alpha); \\Substitution prior
	freq ~ dirichlet(beta); \\State freq prior
	branch ~ exponential(lambda);
	topology ~ uniform(0,1)
	shape ~ uniform(0,1)
	
}
model{
	for(n in 1:N){
     	       for(k in 1:K){
	       	     

	       }
	       }
}
