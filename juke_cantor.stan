data{
	int N; //Number of taxa
	int K; //Number of sites
	matrix[N,K] nex; //matrix of aligned sequences
	vector[4] alpha; //stationary frequencies
	real lambda; //branch length prior parameter
}

paramaters{
	real t; //Tree
	vector theta; //Substitution prior
	vector[N] branch; //Branch length
}
model{
	matrix[N,K] node;
	//Prior distributions
	branch ~ exponential(lambda); 
	theta ~ dirichlet(alpha);
	t ~ beta(1,1);

	for(k in 1:K){
	      for(n in 1:N){
	      	node[N,K] <- theta * nex[n,k]
		}
	 }

}
