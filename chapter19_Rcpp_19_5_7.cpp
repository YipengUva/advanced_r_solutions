#include <Rcpp.h>
// [[Rcpp::plugins("cpp11")]]
using namespace Rcpp;


// [[Rcpp::export]]
double medianC(NumericVector x){
  int n = x.size();
  
  std::partial_sort(x.begin(), x.begin() + (n/2 + 1), x.end());
  
  if(n % 2 == 1){
    return x[(n/2)];
  }else{
    return 0.5*(x[n/2] + x[n/2 -1]);
  }
}

// [[Rcpp::export]]
bool inC(int v,
         IntegerVector x){
  std::unordered_set<int> seen;
  int n = x.size();
  bool out = true;
  
  for(int i = 0; i < n; ++i){
    seen.insert(x[i]);
  }
  
  if(seen.find(v) == seen.end())
    out = false;
  
  return out;
}
