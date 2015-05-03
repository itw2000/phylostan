data{
	int N;
	int K;
	nex <- matrix[N,K];
	vector[4] alpha;
	vector[4] beta;
	real lambda;
}
paramaters{
	t ~ uniform(0,1); \\Tree
	theta ~ dirichlet(alpha); \\Substitution prior
	branch ~ exponential(lambda); \\Branch length	
}
model{
	for(n in 1:N){
     	       for(k in 1:K){
	       	     

	       }
	       }
}
