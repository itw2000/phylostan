data{
	int N; //Number of taxa
	int K; //Number of sites
	matrix[N,K] nex; //matrix of aligned sequences
	simplex[4] alpha;
	real lambda; //branch length prior parameter
}

parameters{
	real tree; //Tree probability
	simplex[4] theta; //Substitution freq
	matrix[N,K] branch; //Branch length
}
model{
	matrix[N,K] node;

//Prior distributions
	theta ~ dirichlet(alpha);
	tree ~ beta(1,1);

	for(k in 1:K){
	      for(n in 1:N){
	      	branch[n,k] ~ exponential(lambda); //Branch prior
	      	node[n,k] <- branch[n,k] * nex[n,k];
		}
	 }

}
