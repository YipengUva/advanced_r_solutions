#include <Rcpp.h>
// [[Rcpp::plugins("cpp11")]]
using namespace Rcpp;


// [[Rcpp::export]]
bool allC(LogicalVector x){
  bool out = true;
  
  int n = x.size();
  
  int n_false = 0;
  for(int i = 0; i < n; ++i){
    if(!x[i])
      n_false += 1;
  }
  
  if(n_false > 0)
    out = false;
  
  return out;
}

// [[Rcpp::export]]
NumericVector cumprodC(NumericVector x){
  int n = x.size();
  
  NumericVector out(n);
  out(0) = x(0);
  
  for(int i = 1; i < n; ++i){
    out(i) = x(i) * out(i-1);
  }
  
  return out;
}

// [[Rcpp::export]]
NumericVector cumminC(NumericVector x){
  int n = x.size();
  
  NumericVector out = clone(x);

  for(int i = 1; i < n; ++i){
    if(out(i) > out(i-1))
      out(i) = out(i-1);
    }
  
  return out;
}

// [[Rcpp::export]]
NumericVector cummaxC(NumericVector x){
  int n = x.size();
  
  NumericVector out = clone(x);
  
  for(int i = 1; i < n; ++i){
    if(out(i) < out(i-1))
      out(i) = out(i-1);
  }
  
  return out;
}

// [[Rcpp::export]]
NumericVector diffC(NumericVector x,
                    int lag){
  NumericVector out;
  
  int n = x.size();
  
  for(int i = 0; i < n; ++i){
    if(i+lag < n){
      out.push_back(x(i+lag) - x(i));
    }
  }
  
  return out;
}

// [[Rcpp::export]]
NumericVector rangeC(NumericVector x){
  double x_min = x(0), x_max = x(0);
  
  int n = x.size();
  
  for(int i = 1; i < n; ++i){
    if(x(i) > x_max)
      x_max = x(i);
    
    if(x(i) < x_min)
      x_min = x(i);
  }
  
  return NumericVector::create(x_min, x_max);
}

// [[Rcpp::export]]
double varC(NumericVector x){
  int n = x.size();
  
  if(n <= 1)
    throw "the length is less than 1.";
  
  // compute mean
  double total = 0;
  for(auto &x_ele : x){
    total += x_ele;
  }
  double x_mean = total / n;
  
  // compute ssq
  double ssq = 0;
  for(auto &x_ele : x){
    ssq += pow(x_ele - x_mean, 2);
  }
  
  return ssq / (n-1);
}






