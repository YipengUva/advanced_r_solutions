#include <Rcpp.h>
// [[Rcpp::plugins("cpp11")]]
using namespace Rcpp;


// [[Rcpp::export]]
LogicalVector allC(LogicalVector x, bool na_rm){
  LogicalVector out = LogicalVector::create(true);
  
  int n = x.size();
  LogicalVector x_na = is_na(x);
  
  int n_false = 0;
  for(int i = 0; i < n; ++i){
    if(!x[i] && !x_na[i])
      n_false += 1;
  }
  
  if(n_false > 0 && na_rm)
    out = false;
  
  if(!na_rm)
    out = NA_LOGICAL;
  
  return out;
}

// [[Rcpp::export]]
NumericVector cumprodC(NumericVector x,
                       bool na_rm = false){
  LogicalVector x_na = is_na(x);
  
  // na_rm == FALSE
  if((!na_rm) && is_true(Rcpp::any(x_na)))
    return NumericVector::create(NA_REAL);
  
  NumericVector x_new;
  
  if(!is_true( Rcpp::any(x_na) )){
    x_new = clone(x);
  }else{
    int n = x.size();
    for(int i = 0; i < n; ++i){
      if( !NumericVector::is_na(x[i]) )
        x_new.push_back(x(i));
    }
  }

  int n = x_new.size();
  NumericVector out(n);
  out(0) = x_new(0);
  
  for(int i = 1; i < n; ++i){
    out(i) = x_new(i) * out(i-1);
  }
  
  return out;
}

// [[Rcpp::export]]
NumericVector cumminC(NumericVector x,
                      bool na_rm = false){
  LogicalVector x_na = is_na(x);
  
  // na_rm == FALSE
  if((!na_rm) && is_true(Rcpp::any(x_na)))
    return NumericVector::create(NA_REAL);
  
  NumericVector x_new;
  
  if(!is_true( Rcpp::any(x_na) )){
    x_new = clone(x);
  }else{
    int n = x.size();
    for(int i = 0; i < n; ++i){
      if( !NumericVector::is_na(x[i]) )
        x_new.push_back(x(i));
    }
  }
  
  int n = x_new.size();
  
  NumericVector out = clone(x_new);

  for(int i = 1; i < n; ++i){
    if(out(i) > out(i-1))
      out(i) = out(i-1);
    }
  
  return out;
}

// [[Rcpp::export]]
NumericVector cummaxC(NumericVector x,
                      bool na_rm = false){
  LogicalVector x_na = is_na(x);
  
  // na_rm == FALSE
  if((!na_rm) && is_true(Rcpp::any(x_na)))
    return NumericVector::create(NA_REAL);
  
  NumericVector x_new;
  
  if(!is_true( Rcpp::any(x_na) )){
    x_new = clone(x);
  }else{
    int n = x.size();
    for(int i = 0; i < n; ++i){
      if( !NumericVector::is_na(x[i]) )
        x_new.push_back(x(i));
    }
  }

  int n = x_new.size();
  
  NumericVector out = clone(x_new);
  
  for(int i = 1; i < n; ++i){
    if(out(i) < out(i-1))
      out(i) = out(i-1);
  }
  
  return out;
}

// [[Rcpp::export]]
NumericVector diffC(NumericVector x,
                    int lag,
                    bool na_rm = false){
  LogicalVector x_na = is_na(x);
  
  // na_rm == FALSE
  if((!na_rm) && is_true(Rcpp::any(x_na)))
    return NumericVector::create(NA_REAL);
  
  NumericVector x_new;
  
  if(!is_true( Rcpp::any(x_na) )){
    x_new = clone(x);
  }else{
    int n = x.size();
    for(int i = 0; i < n; ++i){
      if( !NumericVector::is_na(x[i]) )
        x_new.push_back(x(i));
    }
  }
  
  NumericVector out;
  
  int n = x_new.size();
  
  for(int i = 0; i < n; ++i){
    if(i+lag < n){
      out.push_back(x_new(i+lag) - x_new(i));
    }
  }
  
  return out;
}

// [[Rcpp::export]]
NumericVector rangeC(NumericVector x,
                     bool na_rm = false){
  LogicalVector x_na = is_na(x);
  
  // na_rm == FALSE
  if((!na_rm) && is_true(Rcpp::any(x_na)))
    return NumericVector::create(NA_REAL);
  
  NumericVector x_new;
  
  if(!is_true( Rcpp::any(x_na) )){
    x_new = clone(x);
  }else{
    int n = x.size();
    for(int i = 0; i < n; ++i){
      if( !NumericVector::is_na(x[i]) )
        x_new.push_back(x(i));
    }
  }
  
  double x_min = x_new(0), x_max = x_new(0);
  
  int n = x_new.size();
  
  for(int i = 1; i < n; ++i){
    if(x_new(i) > x_max)
      x_max = x_new(i);
    
    if(x_new(i) < x_min)
      x_min = x_new(i);
  }
  
  return NumericVector::create(x_min, x_max);
}

// [[Rcpp::export]]
double varC(NumericVector x,
            bool na_rm = false){
  LogicalVector x_na = is_na(x);
  
  // na_rm == FALSE
  if((!na_rm) && is_true(Rcpp::any(x_na)))
    return NAN;
  
  NumericVector x_new;
  
  if(!is_true( Rcpp::any(x_na) )){
    x_new = clone(x);
  }else{
    int n = x.size();
    for(int i = 0; i < n; ++i){
      if( !NumericVector::is_na(x[i]) )
        x_new.push_back(x(i));
    }
  }
  
  
  int n = x_new.size();
  
  if(n <= 1)
    throw "the length is less than 1.";
  
  // compute mean
  double total = 0;
  for(auto &x_ele : x_new){
    total += x_ele;
  }
  double x_mean = total / n;
  
  // compute ssq
  double ssq = 0;
  for(auto &x_ele : x_new){
    ssq += pow(x_ele - x_mean, 2);
  }
  
  return ssq / (n-1);
}






