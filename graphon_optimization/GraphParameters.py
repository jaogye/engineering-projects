"""
Created on Sun Jan  3 14:19:26 2021

@author: Juan Alvarado
"""

"""
This program computes a maximum entropy  of  amalgamated stepfunctions constrained by 
 subgraph densities 

 The vector of m stepfunctions have two representations:
 1] A list of Matrices-Vector  [M_1, ...,M_r,P] representation  
    where the entry r is the number of relations and M_i a symmetric matrix mxm
    and Q is the  partition vector
    
# 2] One dimension vector representation: It is denoted by X and it is a vector 
formed  by M_i converted to one-dimension representation using P_i = mat2vec [W_]
and concated all into [P_1,...,P_r, P[m-1]] where P[m-1] are m-1 first entries of P
and P minus the last entry of P since all entries of Q are positive and sum 1

of P is  the vectorization of an upper triangle matrices W and Q is the vector weights of the partition
# To convert the vectorization of the upper triangle matrix into a symmetric matrix W, use  W = vec2mat [P] and to convert a symmetric matrix into the vectorization use 
# P = mat2vec [W]

# To go from one representation to other we use [M] = getMatPar [X]  

#  n = posn(u,v] and [u][v] = posuv[n] are auxiliary functions to map from upper matrix entries to vector entries

# There are 3 amalgamated graphs all of them have 2 edges :

# The edges in amalgamated graphs are represented as follow [p:i,j] where p is layer and ij is the edge of layer p
# triangle3path whose representation is [1:i,j], [2:j,k], [1:k,i], [2:i,j], [2:j,k], [1:k,l]
# doubleedge whose representation is [1:i,j] [2:i,j]
# 2star1edge whose representation is [1:i,j] [1:i,k] [2:i,j]

# The simple graphs as: triangle, 4cycle, 2star, 3star, 4clique, edge can be considered amalgamated graphs whose complementay layer is the graph with no edges
# Thus these graphs are associated with the corresponding layer id
 
 # Basic functions 
 # --------------------------------------------------------------------------- 
 # To transform the position on the matrix into the position in the vector
"""

import numpy as np
from math import log, floor, sqrt
from random import random
import copy
from scipy.special import logit

r=1;  # Number of amalgmated stepfunctions
m=2;  # Number of stepss

def posn(u,v):
  if u > v:
     temp = u 
     u = v
     v = temp
  n= floor(v*(v+1)/2 + u )
  return n 
 

# To transform the position on the vector into the position in the matrix
def posuv(n):   
    if (n==2):
        u=1; v=1         
    else:
       v= floor((sqrt(1+8*(n))-1)/2) 
       if (v==0):
           u=0
       else:    
          u=( n % floor(v*(v+1)/2) )
    return u,v

 
# Transformation from a vector 1x[n[n-1]/2] to a symmetric matrix nxn
def vec2mat(V):    
    global m
    M = []
    for layer in range(r):         
        M.append( np.zeros( (m,m) )  )
        offset = floor( layer*m*(m+1)/2 )
        for i in range(m):
           for j in range(i,m):
              M[layer][i][j] = V[ offset+ posn(i,j) ]
           M[layer][j][i] = M[layer][i][j]     
    offset = offset+ posn(i,j) + 1
    p = np.zeros( (m,1) )  
    tot = 0
    for i in range(m-1):         
        p[i] =  V[ offset + i ]
        tot = tot + p[i]
    p[m-1] = 1 - tot    
    return (M,p)
 
 
# This function transforms a list L of r symmetric matrix mxm  plus 
# a probability vector of size m into a vector 1x[r*m*[m-1]/2 + m-1]
def mat2vec(L):
    global m,r
    if (len(L[0])==r): 
        vec_size = floor(r*( m*(m+1)/2 ) + m-1) 
    else:
        raise Exception("Invalid M:list of matrices") 
    V = np.zeros(( vec_size,1))
    k=0
    for layer in range(r):
      for i in range(m):
       for j in range(i,m):         
         V[k] = L[0][layer][i][j]
         k = k + 1
     # If there is a probability vector
    if len(L) > 1: 
       for i in range(m-1):
          V[k] = L[1][i]
          k = k + 1          
    return V

  
# Kronecker's delta
def delta(i,j):
   d=0
   if (i==j):
      d=1
   return d 
 

# Graph Parameter interfase
class graphp:  
  name = "" 
  def __init__( self):    
      self.name = "" 
  # This method computes the value of the density function
  def density(self, L):
    raise Exception('Invalid method')  
  # This method computes the gradient vector of the density function
  def gradient(self, L):    
    raise Exception('Invalid method') 
  # This method computes the W second partial derivatives of the density function
  def hq(self, L):
    raise Exception('Invalid method') 
  # This method computes the p second partial derivatives of the density function
  def hp(self, L):
    raise Exception('Invalid method') 
  # This method computes the mixed (W,p) second partial derivatives of the density function
  def hm(self, L):
    raise Exception('Invalid method')  
  # This method computes the hessian matrix of the density function
  def hessian(self, L):
      A = self.hq(L)
      B = self.hp(L)
      C = self.hm(L)  
      m = len(B)
      H1 = np.concatenate((A, C), axis=1)
      H2 = np.concatenate( (C.transpose() ,B), axis=1)
      H = np.concatenate((H1, H2), axis=0)
      H0 = covhessian(m, H) 
      return H0


class onelayeredge(graphp): 
  layer = 0  
  def __init__( self, layer):    
      self.name = "edge" 
      self.layer = layer
  #  Compute edge density       
  def density(self, L):
    M = L[0]
    P = L[1]
    A = M[self.layer]  
    d = 0; 
    for i in range(m):
      for j in range(i,m):
          d = d + (2-delta(i,j))*A[i][j] * P[i] * P[j]; 
    return d 
  def gradient(self, L):
    M = L[0]
    P = L[1]
    A =M[self.layer] 
    GW = np.array( [ np.zeros((m,m)) for i in range(r) ] )
    for i in range(m):
       for j in range(m):
          GW[self.layer][i][j] = P[i]*P[j]*(2-delta(i,j)); 
          GW[self.layer][j][i] = GW[self.layer][i][j];        
    
    G0 = np.zeros((m,1)) 
    for i in range(m):
       G0[i] = 2*degree(A,P,i)
    GQ = covgradient(G0)     
    return mat2vec( (GW,GQ) )
  # Edge subgrap density considering Q as a constant parameter    
  def gradientQ(self, L):
    P = L[1]
    GW = [ np.zeros((m, m)) for i in range(r) ] 
    for i in range(m):
     for j in range(i,m):
         GW[self.layer][i][j] = (2-delta(i,j))*P[i]*P[j]; 
         GW[self.layer][j][i] = GW[self.layer][i][j];        
    return GW
 # It computes the Hessian sub-matrix of edge subgraph density for W parameters 
  def hq(self, L):
    n = floor(r*m*(m+1)/2 )
    H = np.zeros((n,n))
    return H
  
 # It computes the Hessian sub-matrix of edge subgraph density for p parameters 
  def hp(self, L):
    M = L[0]
    A = M[self.layer]  
    H = np.zeros((m, m));  
    for i in range(m):
     for j in range(i,m):
         H[i][j] = 2*A[i][j];
         H[j][i] = H[i][j] ; 
    return H
  
 # It Computes the Hessian matrix of edge density  for the partition 
  def hm(self, L):
    M = L[0]
    P = L[1]
    m2 = floor( r*( m*(m+1)/2 ) )
    H = np.zeros((m2,m))
    for i in range(m):
      for j in range(i,m):
        ij = posn(i,j);
        for k in range(m):
            H[ij][k] = (2-delta(i,j))*(P[i]*delta(j,k)+P[j]*delta(i,k) ); 
    return H



class onelayertriangle(graphp):
  layer = 0  
  def __init__( self, layer):    
      self.name = "triangle" 
      self.layer = layer
  def density(self, L):
     M = L[0]
     P = L[1]
     A = M[ self.layer] 
     m=len(A);
     d = 0; 
     for x1  in range(m):
       for x2  in range(m):
          for x3  in range(m):
              d = d + A[x1][x2] * A[x2][x3] * A[x3][x1] * P[x1] * P[x2] * P[x3];    
     return d 
  def gradient(self, L):
      M = L[0]
      P = L[1]      
      A = M[self.layer] 
      m =len(A)
      GW = np.array( [ np.zeros((m,m)) for z in range(r) ]  ) 
      for i in range(m):
        for j in range(m):
          GW[self.layer][i][j] = 3*P[i]*P[j]*(2-delta(i,j)) * qdegree(A,P,i,j)
          GW[self.layer][j][i] = GW[self.layer][i][j]
      G0 = np.zeros((m,1)) 
      for i in range(m):
          G0[i] = 3*ttrianglec1(A,P,i)
      GQ = covgradient(G0) 
      return mat2vec( (GW,GQ) )
 # Triangles subgraph density considering Q as a constant parameter
  def gradientQ(self, L):
    M = L[0]
    P = L[1]
    A = M[self.layer] 
    GW = np.zeros((m, m)); 
    for i in range(m):
        for j in range(i,m):
          GW[i][j] = 3*(2-delta(i,j)) * t2starc2(A,P,i,j)*P[i]*P[j] 
          GW[j][i] = GW[i][j]
    return GW
 #  It computes the Hessian of triangle subgraph density        
  def hq(self, L):
      M = L[0]
      P = L[1]      
      A =M[self.layer]  
      n = floor(r*m*(m+1)/2 )
      H =  np.zeros((n, n)); 
      for i in range(m):
         for j in range(i,m):
           ij = posn(i,j) 
           for k in range(m):
             for l in range(k,m):
                kl = posn(k,l) 
                H[ij][kl] = P[l]*A[j][l]*delta(i,k)+(1-delta(k,l))*P[k]*A[j][k]*delta(i,l) + P[l]*A[i][l]*delta(j,k)+(1-delta(k,l))*P[k]*A[i][k]*delta(j,l)  ;
                H[ij][kl] = 3*(2-delta(i,j))*P[i]*P[j]*H[ij][kl]; 
                H[kl][ij] = H[ij][kl];
      return H
# It computes the Hessian of Partititon of triangle subgraph density   
  def hp(self, L):
   M = L[0]
   P = L[1]   
   A =M[self.layer]  
   m=len(A); 
   H = np.zeros((m, m));  
   for i in range(m):
    for j in range(m):
       H[i][j]= 6*A[i][j]*qdegree(A,P,i,j) ;   
       H[j][i]= H[i][j];
   return H
 # It Computes the Hessian matrix of triangle density  for the partition  
  def hm(self, L):
   M = L[0]
   P = L[1]
   A = M[self.layer]  
   m2 = floor(r*m*(m+1)/2 )
   H = np.zeros((m2,m))
   for i in range(m):
    for j in range(i,m):
       ij = posn(i,j);
       for k in range(m):
           H[ij][k] = 3*(2-delta(i,j))*((delta(i,k)*P[j]+delta(j,k)*P[i])*qdegree(A,P,i,j) + P[i]*P[j]*A[i][k]*A[j][k]);    
   return H




class onelayerpath3(graphp):
  layer = 0  
  def __init__( self,  layer):    
      self.name = "path4" 
      self.layer = layer
  # 3-paths    
  def density(self, L):
    M = L[0]
    P = L[1]
    A = M[self.layer]  
    m=len(A)
    d = 0; 
    for x1 in range(m):
      for x2 in range(m):
        for x3 in range(m):
         for x4 in range(m):
           d = d + A[x1][x2] * A[x2][x3] * A[x3][x4] * P[x1] * P[x2] * P[x3] * P[x4]
    return d 
  def gradient(self, L):
    M = L[0]
    P = L[1]
    A = M[self.layer]  
    global m
    GW = np.array( [ np.zeros((m,m)) for i in range(r) ] ) 
    for i in range(m):
      for j in range(m):
        GW[self.layer][i][j] = (2-delta(i,j))*(degree2paths(A,P,i)+degree(A,P,i)*degree(A,P,j)+degree2paths(A,P,j) )
        GW[self.layer][i][j] = P[i]*P[j]*GW[self.layer][i][j]; 
        GW[self.layer][j][i] = GW[self.layer][i][j];        
    G0 = np.zeros((m,1)) 
    for i in range(m):
       G0[i] = 2*(degree3paths(A,P,i)+t3pathc1(A,P,i) ) ;     
    GQ = covgradient(G0)  
    return mat2vec( (GW,GQ) ) 
  # Gradient of 3-paths subgraph density 
  def gradientQ(self, L):
    M = L[0]
    P = L[1] 
    A = M[self.layer] 
    global m 
    GW = [ np.zeros((m, m)) for i in range(r)]
    for i in range(m):
       for j in range(i,m):
           GW[self.layer][i][j] = (2-delta(i,j))*P[i]*P[j]*(degree2paths(A,P,i) + degree(A,P,i)*degree(A,P,j)+degree2paths(A,P,j))
           GW[self.layer][j][i] = GW[self.layer][i][j]
    return GW
 #  It computes the Hessian of 3-path subgraph density   
  def hq(self, L):
    M = L[0]
    P = L[1]
    A = M[self.layer]  
    n = floor(r*m*(m+1)/2 )
    H = np.zeros((n,n))
    for i in range(m):
      for j in range(m):
        ij = posn(i,j) 
        for k in range(m):
          for l in range(m):
             kl = posn(k,l)
             H[ij][kl] = P[k]*P[l]*(A[i][k]+A[j][k]+(1-delta(k,l))*(A[i][l]+A[j][l])  );
             H[ij][kl] = H[ij][kl]+ P[l]*degree(A,P,l)*(delta(i,k)+delta(j,k)) +( 1-delta(k,l) )*P[k]*degree(A,P,k) * (delta(i,l)+delta(j,l));
             H[ij][kl] = H[ij][kl]+ degree(A,P,j)*(delta(i,k)*P[l] + (1-delta(k,l))*delta(i,l)*P[k]) +degree(A,P,i)*(delta(j,k)*P[l]+ (1-delta(k,l))*delta(j,l)*P[k]); 
             H[ij][kl] = (2-delta(i,j))*P[i]*P[j]*H[ij][kl];
             H[kl][ij] = H[ij][kl];
    return H
 # It computes the hessian of 3-paths subgraph density  
  def hp(self, L):
    M = L[0]
    P = L[1]   
    A = M[self.layer]  
    m = len(A); 
    H = np.zeros((m, m));  
    for i in range(m):
        for j in range(m):
            H[i][j]=2*(A[i][j]*(degree2paths(A,P,i) + degree2paths(A,P,j) + degree(A,P,i)*degree(A,P,j)) +t3pathc2(A,P,i,j)+t3pathc(A,P,i,j)+t3pathc2(A,P,j,i) )
            H[j][i]= H[i][j]
    return H
# It Computes the Hessian matrix of 3-path density  for the partition  
  def hm(self, L):
    M = L[0]
    P = L[1]   
    global m 
    A = M[self.layer]  
    m2 = floor(r*m*(m+1)/2 )
 
    H = np.zeros((m2,m))
    for i in range(m):
     for j in range(i,m):
        ij = posn(i,j);
        for k in range(m):
            H[ij][k] = (2-delta(i,j))*( (P[i]*delta(j,k)+P[j]*delta(i,k))*
                                    (degree2paths(A,P,i)+degree(A,P,i)*degree(A,P,j)+degree2paths(A,P,j)) 
           + P[i]*P[j]*( (A[i][k]+A[j][k])*degree(A,P,k) + qdegree(A,P,i,k) + qdegree(A,P,j,k) +A[j][k]*degree(A,P,i) + A[i][k]*degree(A,P,j)    ));
    return H
 


    
class onelayerstark(graphp):
  layer = 0  
  n = 0
  def __init__( self,  layer,k):  
      self.name = "star" + str(k) 
      self.layer = layer
      self.n = k
  # k-star       
  def density(self, L):
    M = L[0]
    P = L[1]         
    A = M[self.layer]  
    m=len(A);
    d = 0; 
    for i in range(m):
        d = d + P[i]*degree(A,P,i)**self.n; 
    return d 
 #  It gives the gradient of k-star subgraph density gradients  
  def gradient(self, L):
    M = L[0]
    P = L[1]   
    A = M[self.layer] 
    m=len(A);
    GW = np.array( [ np.zeros((m,m)) for z in range(r) ]  )
    for i in range(m):
       for j in range(i,m):
         GW[self.layer][i][j] = self.n*P[i]*P[j]*(degree(A,P,i)**(self.n-1)+(1-delta(i,j))*degree(A,P,j)**(self.n-1)) ; 
         GW[self.layer][j][i] = GW[self.layer][i][j];        
    G0 = np.zeros((m,1)) 
    for i in range(m):
      G0[i] = 0;
      for k in range(m):
         G0[i] = G0[i]  + self.n*A[i][k]*P[k]*degree(A,P,k)**(self.n-1);  
      G0[i] = G0[i] + degree(A,P,i)**self.n; 
    # Gradient conversion to consider the constraint \sum_i P[[i]] = 1     
    GQ = covgradient(G0)  
    return mat2vec( (GW,GQ) ) 
  # k star subgraph density gradients considering Q as a constant parameter
  def gkstarQ(self,L):
    M = L[0]
    P = L[1]   
    A = M[self.layer]  
    m=len(A);
    G = np.zeros((m, m)); 
    for i in range(m):
       for j in range(i,m):
           G[i][j] = self.n*degree(A,P,i)**(self.n-1)+(1-delta(i,j))*degree(A,P,j)**(self.n-1)*P[i]*P[j]; 
           G[j][i] = G[i][j];        
    G2 = mat2vec(G); 
    return G2
  # It computes the Hessian of k-star subgraph density   
  def hq(self, L):
    M = L[0]
    P = L[1]   
    A = M[self.layer]  
    n2 = floor(r*m*(m+1)/2 )
    H = np.zeros((n2,n2))
    for i in range(m):
     for j in range(i,m):
       ij = posn(i,j)
       for k in range(m):
        for l in range(k,m):
          kl = posn(k,l)
          H[ij][kl] = (1-delta(i,j))*degree(A,P,j)**(self.n-2)*ddegree(P,j,l,k)
 # H[ij][kl] = (1-delta(i,j))*degree(A,P,j]**[n-2]*[P[k]*delta(j,l]+(1-delta(k,l))*delta(j,k)*P[l]];
          H[ij][kl] = H[ij][kl] +     degree(A,P,i)**(self.n-2)*ddegree(P,i,l,k)
 #        H[ij][kl] = H[ij][kl] +     degree(A,P,i]**[n-2]*[P[k]*delta(i,l]+(1-delta(k,l))*delta(i,k)*P[l]];
          H[ij][kl] = self.n*(self.n-1)*P[i]*P[j]*H[ij][kl];
          H[kl][ij] = H[ij][kl];
    return H
 # It computes the hessian of k-star subgraph density
  def hp(self, L):
    M = L[0]
    P = L[1]
    A = M[self.layer]  
    m=len(A); 
    H = np.zeros((m, m));  
    for i in range(m):
       for j in range(m):
          d = 0 
          for k in range(m):
             d = d + P[k]*A[i][k]*A[j][k]*degree(A,P,k)**(self.n-2);
          H[i][j] = self.n*A[i][j]*( degree(A,P,i)**(self.n-1) + degree(A,P,j)**(self.n-1))+ self.n*(self.n-1)*d  ; 
          H[j][i]= H[i][j];
    return H     
# It Computes the Hessian matrix of k-star density  forv the partition   
  def hm(self, L):
    M = L[0]
    P = L[1]
    A = M[self.layer]  
    m2 = floor(r*m*(m+1)/2 )
    H = np.zeros((m2,m))
    for i in range(m):
      for j in range(i,m):
         ij = posn(i,j);
         for s in range(m):
             H[ij,s] = self.n * (P[i]*delta(j,s)+P[j]*delta(i,s))  * (degree(A,P,i)**(self.n-1) 
             + (1-delta(i,j))*degree(A,P,j)**(self.n-1) ); 
             H[ij,s] = H[ij,s] + self.n*(self.n-1)*P[i]*P[j]*(A[i][s]*degree(A,P,i)**(self.n-2) 
                         + (1-delta(i,j))*A[j,s]*degree(A,P,j)**(self.n-2)  ) 
    return H
 



class onelayercycle4(graphp): 
  layer = 0  
  def __init__( self,  layer):    
      self.name = "cycle4" 
      self.layer = layer
  # 4-Cycle
  def density(self, L):
    M = L[0]
    P = L[1]
    A = M[self.layer]  
    d = 0; 
    for x1 in range(m):
     for x2 in range(m):
      for x3 in range(m):
       for x4 in range(m):
         d = d + A[x1][x2] * A[x2][x3] * A[x3][x4] * A[x4][x1] * P[x1] * P[x2] * P[x3] * P[x4];
    return d 
  # It gives the gradient of 4-cycle subgraph density   
  def gradient(self, L):
    M = L[0]
    P = L[1]
    A = M[self.layer] 
    GW = np.array( [ np.zeros((m,m)) for z in range(r) ]  )
    for i in range(m):
       for j in range(m):
         GW[self.layer][i][j] = 4*(2-delta(i,j))*t3pathc(A,P,i,j)
         GW[self.layer][i][j] = P[i]*P[j]*GW[self.layer][i][j]; 
         GW[self.layer][j][i] = GW[self.layer][i][j];            
    G0 = np.zeros((m,1)) 
    for i in range(m):
        G0[i] = 4*t4cyclec1(A,P,i)
    GQ = covgradient(G0) 
    return mat2vec( (GW,GQ) )
  # 4 cycle subgraph density considering Q as a constant parameter  
  def gradientQ(self, L):
    M = L[0]
    P = L[1]
    global m 
    A = M[self.layer]  
    GW = np.zeros((m, m)); 
    for i in range(m):
       for j in range(m):
           GW[i][j] = 4*(2-delta(i,j))*t3pathc(A,P,i,j)*P[i]*P[j];
           GW[j][i] = GW[i][j];        
    return GW
 # It computes the Hessian of triangle subgraph density   
  def hq(self, L):
    M = L[0]
    P = L[1]
    global m 
    A = M[self.layer]  
    n2 = floor(r*m*(m+1)/2 )
    H = np.zeros((n2,n2)) 
    for i in range(m):
       for j in range(i,m):
         ij = posn(i,j) 
         for k in range(m):
           for l in range(k,m):
             kl = posn(k,l) 
             H[ij][kl] = P[k]*P[l]*( A[i][k]*A[j][l]+(1-delta(k,l))*A[i][l]*A[j][k] )  ;
             H[ij][kl] = H[ij][kl] + delta(j,k)*P[l]*qdegree(A,P,l,i) + (1-delta(k,l))*delta(j,l)*P[k]*qdegree(A,P,k,i) ;
             H[ij][kl] = H[ij][kl] + delta(i,k)*P[l]*qdegree(A,P,l,j) + (1-delta(k,l))*delta(i,l)*P[k]*qdegree(A,P,k,j) ;
             H[ij][kl] = 4*(2-delta(i,j))*P[i]*P[j]*H[ij][kl];
             H[kl][ij] = H[ij][kl];
    return H
 # It computes the hessian of 4-Cycle  subgraph density 
  def hp(self, L):
    M = L[0]
    P = L[1]
    global m 
    A = M[self.layer]  
    m=len(A); 
    H = np.zeros((m, m));   
    for i in range(m):
       for j in range(m):
         H[i][j]=4*(2*A[i][j]*t3pathc(A,P,i,j)+t4cyclec(A,P,i,j));
         H[j][i]= H[i][j];
    return H     
  # It Computes the Hessian matrix of 4-cycle density  for the partition  
  def hm(self, L):
   M = L[0]
   P = L[1]
   global m 
   A = M[self.layer]  
   m2 = floor(r*m*(m+1)/2 )
   H = np.zeros((m2,m))
   for i in range(m):
    for j in range(i,m):
       ij = posn(i,j);
       for k in range(m):
           H[ij][k] = 4*(2-delta(i,j))*( (P[i]*delta(j,k)+P[j]*delta(i,k))*t3pathc(A,P,i,j) 
           + P[i]*P[j]*( A[i][k]*qdegree(A,P,j,k) + A[j][k]*qdegree(A,P,i,k)  )); 
   return H




    
class onelayerclique4(graphp):
  layer = 0  
  def __init__( self, layer):    
      self.name = "clique4" 
      self.layer = layer
  # 4-Clique subgraph density     
  def density(self, L):
    M = L[0]
    P = L[1]
    global m 
    A = M[self.layer]  
    d = 0; 
    for x1 in range(m):
     for x2  in range(m):
      for x3 in range(m):
       for x4 in range(m):
        d = d + A[x1, x2] * A[x1][x3] * A[x1][x4] * A[x2][x3] * A[x2][x4] * A[x3][x4] * P[x1] * P[x2] * P[x3] * P[x4] ;    
    return d  
# 4 clique subgraph density   
  def gradient(self, L):
    M = L[0]
    P = L[1]
    global m 
    A = M[self.layer]  
    GW = np.array( [ np.zeros((m,m)) for i in range(r) ]  )
    for i in range(m):
      for j in range(i,m):
         GW[self.layer][i][j] = 6*(2-delta(i,j))*t4cliquec(A,P,i,j)
         GW[self.layer][i][j] = P[i]*P[j]*GW[self.layer][i][j]; 
         GW[self.layer][j][i] = GW[self.layer][i][j] 
    G0 = np.zeros((m,1)) 
    for i in range(m):
       G0[i] = 4*t4cliquec1(A,P,i) 
    # Gradient conversion to consider the constraint \sum_i P[[i]] = 1     
    GQ = covgradient(G0)     
    return mat2vec( (GW,GQ) )
  # It gives the gradient of 4-clique subgraph density considering Q as a constant parameter  
  def gradientQ(self, L):
    M = L[0]
    P = L[1]
    global m
    A = M[self.layer] 
    GW = np.zeros((m, m)); 
    for i in range(m):
      for j in range(m):
         GW[i][j] = 6*(2-delta(i,j))*t4cliquec(A,P,i,j)*P[i]*P[j];
         GW[j][i] = GW[i][j];        
    return GW
 # It computes the  Hessian of 4-clique subgraph density 
  def hq(self, L):
    M = L[0]
    P = L[1]
    global m 
    A = M[self.layer]  
    n2 = floor(r*m*(m+1)/2 )
    H = np.zeros((n2,n2)) 
    for i in range(m):
      for j in range(i,m):
        ij = posn(i,j) 
        for k in range(m):
         for l in range(k,m):
            kl = posn(k,l) 
            H[ij][kl] = P[k]*P[l]*(2-delta(k,l))*A[i][l]*A[j][l]*A[i][k]*A[j][k] ;       
            H[ij][kl] = H[ij][kl] + 2*( (delta(i,k)*A[j][l]+ delta(j,k)*
            A[i][l])*P[l]*t3starc3(A,P,i,j,l) + (1-delta(k,l))*(delta(i,l)*A[j][k]+delta(j,l)*A[i][k])*P[k]*t3starc3(A,P,i,j,k) );
            H[ij][kl] = 6*(2-delta(i,j))*P[i]*P[j]*H[ij][kl];
            H[kl][ij] = H[ij][kl];
    return H
# It computes the hessian of 4-Clique subgraph density 
  def hp(self, L):
    M = L[0]
    P = L[1]
    global m 
    A = M[self.layer]  
    H = np.zeros((m, m));  
    for i in range(m):
      for j in range(m):
         H[i][j]=12*A[i][j]*t4cliquec(A,P,i,j);
         H[j][i]= H[i][j];
    return H    
# It Computes the Hessian matrix of 4-clique density  for the partition  
  def hm(self, L):
    M = L[0]
    P = L[1]
    global m 
    A = M[self.layer]   
    m2 = floor(r*m*(m+1)/2 )     
    H = np.zeros((m2,m))
    for i in range(m):
      for j in range(i,m):
         ij = posn(i,j);
         for k in range(m):
           H[ij][k] = 6*(2-delta(i,j))*( [P[i]*delta(j,k)+P[j]*delta(i,k)]*t4cliquec(A,P,i,j) + 2*P[i]*P[j]*A[i][k]*A[j][k]*t3starc3(A,P,i,j,k) ); 
    return H





class ratefunction(graphp):
  def __init__( self):    
      self.name = "ratefunction" 
# Compute graphon raterfunction    
  def density(self,L): 
    M = L[0]
    P = L[1]
    d = 0 
    for layer in range(r):
      A = M[layer]
      for i in range(m):
         for j in range(m):
             if (A[i][j] > 0 and A[i][j] < 1):
                d = d + (2-delta(i,j))*P[i]*P[j]*(A[i][j]*
                    log(A[i][j]) + (1-A[i][j])*log(1-A[i][j]) ) 
      return d 
  # Compute ratefunction gradient
  def gradient(self, L):
    M = L[0]
    P = L[1]
    GW = self.gradientQ(L) ; 
    G=np.zeros((m,1))    
    for k in range(m):
       for j in range(m):
         for layer in range(r):
           G[k][0] = G[k][0] + 2*P[j]*I0(M[layer][k][j]) ;      
    # Gradient conversion to consider the constraint \sum_i P[[i]] = 1     
    GQ = covgradient(G)     
    return mat2vec( (GW,GQ) )
  # Compute ratefunction gradient considering Q as a constant parameter  
  def gradientQ(self, L):
     M = L[0]
     P = L[1]
     GW = np.array( [ np.zeros((m,m)) for i in range(r) ] )
     for layer in range(r):
      for i in range(m):
        for j in range(i,m):
         GW[layer][i][j] = (2-delta(i,j))*logit(M[layer][i][j])*P[i]*P[j]; 
         GW[layer][j][i] = GW[layer][i][j];      
     return GW
  def hq(self, L):
    M = L[0]
    P = L[1]
    m2 = floor(r*m*(m+1)/2 )
    H = np.zeros((m2 ,m2 ))
    for layer in range(r):
        A = M[layer]
        for ij in range(m2):
           i,j = posuv(ij) 
           H[ij,ij] = (2-delta(i,j))*P[i]*P[j] / (A[i][j]*(1-A[i][j])) 
    return H
  # Compute the Hessian matrix of ratefunction(M] for the partition
  def hp(self, L):
    M = L[0]
    P = L[1]
    H = np.zeros((m,m)); 
    for layer in range(r):
       A = M[layer]
       for i in range( m ):
           for j in range(i, m ):
               H[i][j] = 2*I0(A[i][j]);
               H[j][i] = H[i][j];
    return H
  def hm(self, L):
    M = L[0]
    P = L[1]
    global m
    m2 = floor(r*m*(m+1)/2 )
    H = np.zeros((m2 ,m))
    for layer in range(r):
       A = M[layer]
       for i in range( m ):
         for j in range( i, m ):
            ij= posn(i,j) 
            for k in range(i, m ):
              H[ij][k] = (2-delta(i,j))*(  P[i]*delta(k,j) + P[j]*delta(k,i) )*logit(A[i][j]);
    return H
 

class doubleedge(graphp):
  def __init__( self):    
      self.name = "doubleedge"       
  def density(self, M):
    d = 0 ;
    if (r < 2):
        return d 
    A1 = M[0]
    A2 = M[1]
    Q = M[2]
    for x1 in range(m):
      for x2 in range(m):
        d = d + A1[x1][x2] * A2[x1][x2] * P[x1] * P[x2];
    return d 
  def gradient(self, L):
    M = L[0]
    P = L[1]
    G = [ np.zeros((m,m)) for i in range(r) ]
    return G
  def gradientQ(self, L):
    M = L[0]
    P = L[1]
    G2 = np.zeros((m, m)); 
    return G2
  def hq(self, L):
    M = L[0]
    P = L[1]      
    n = floor(r*m*(m+1)/2 )
    H12 = np.zeros((n,n))
    for i in range(m):
       for j in range(i,m):
        ij = posn(i,j) ;
        for k in range(m):
         for l in range(k,m):
          kl = posn(k,l) ;
          H12[ij][kl] = P[i]*P[j]* (2-delta(i,j))* (delta(i,k)*delta(j,l) + (1-delta(k,l))*delta(i,l)*delta(j,k) ) ;             
          H12[kl][ij] = H12[ij][kl]          
    H1 = np.concatenate((np.zeros((n,n)), H12), axis=1)
    H2 = np.concatenate((H12.T, np.zeros((n,n)) ), axis=1)
    H = np.concatenate((H1, H2), axis=0)
    H0 = covhessian(m, H) 
    return H0
  def hp(self, L):
     return -1 
  def hm(self, L):
     return -1 

def I0(x):
 d = x*log(x) + (1-x)*log(1-x) ; 
 return d


# Partial product-sum cimputation whose input is in the vector-matrix representation 
# These functions are used in the computation of first and second partial derivatives
# -----------------------------------------------------------------------------------
def ttrianglec1(A,P,i):
 d= 0; 
 m = len(A); 
 for x1 in range(m):
  for x2 in range(m):
     d = d + A[x1][x2]*A[x1][i]*A[x2][i]*P[x1]*P[x2];      
 return d  
 
def t3starc3(A,P,i,j,k):
 d = 0;
 m = len(A); 
 for x1 in range(m):
     d = d + A[i][x1] * A[j][x1] * A[k][x1] * P[x1]; 
 return d 

def t3starc1(A,P,i):
  d = 0;
  m = len(A); 
  for x1 in range(m):
   for x2 in range(m):
    for x3 in range(m):
      d = d + A[i][x1] * A[i][x2] * A[i][x3] * P[x1]*P[x2]*P[x3]; 
  return d 

def t3starc2(A,P,i,j):
  d = 0;
  m = len(A); 
  for x1 in range(m):
   for x2 in range(m):
     d = d + A[x1,i] * A[x1][j] * A[x1][x2] * P[x1]*P[x2]; 
  return d 
 
 
    
def degree2paths(A,P,i):
 m=len(A)
 d= 0 
 for x1 in range(m):
     for x2 in range(m):
         d = d + A[i][x1]*A[x1][x2]*P[x1]*P[x2]
 return d 
 
def degree3paths(A,P,i):
  m=len(A)
  d= 0 
  for x1 in range(m):
   for x2 in range(m):
    for x3 in range(m):
      d = d + A[i][x1]*A[x1][x2]*A[x2][x3]*P[x1]*P[x2]*P[x3]
  return d 

def t3pathc1(A,P,i):
  m=len(A)
  d= 0 
  for x1 in range(m):
   for x2 in range(m):
    for x3 in range(m):
       d = d + A[x1,i]*A[i][x2]*A[x2][x3]*P[x1]*P[x2]*P[x3]
  return d 
 
def t3pathc(A,P,i,j):
  m=len(A);
  d= 0; 
  for x1 in range(m):
     for x2 in range(m):
         d = d + A[i][x1]*A[x1][x2]*A[x2][j]*P[x1]*P[x2];   
  return d  
 
def t3pathc2(A,P,i,j):
  m=len(A); 
  d=0;
  for x1 in range(m):
   for x2 in range(m):
      d = d + A[i][x1]*A[x1][j]*A[j][x2]*P[x1]*P[x2];
  return d 
 
# Quadratic degree This function computes the conditional subgraph density of 2-star graph
def qdegree(A,P,i,j):
 d = 0
 m = len(A); 
 for x1 in range(m):
     d = d + A[i][x1] * A[j][x1] * P[x1]; 
 return d

 def t2starc1(A,P,i):
  d = 0;
  m = len(A); 
  for x1 in range(m):
   for x2 in range(m):
     d = d + A[i][x1] * A[i][x2] * P[x1]*P[x2]; 
  return d 
 
def t2starc2(A,P,i,j): 
  d = 0;
  m = len(A); 
  for x1 in range(m):
     d = d + A[i][x1] * A[j][x1]*P[x1]; 
  return d 

# Degree of i 
def degree(A,P,i):
  m=len(A);
  d= 0; 
  for x1 in range(m):
     d = d + P[x1] * A[i][x1] ;
  return d 

 # This method computes the partial derivative  \partial \sum_j P[i] A_[ij] /\partial A_[kl]
 # when A_[ij] = A_[ji]
def ddegree(P,i,k,l):
   dd = P[l]*delta(i,k) + (1-delta(k,l))*P[k]*delta(i,l); 
   return dd 

def t4cyclec(A,P,i,j):
   m=len(A); 
   d = 0;
   for x1 in range(m):
     for x2 in range(m):
       d = d + A[x1,i]*A[i][x2]*A[x2,j]*A[j,x1]*P[x1]*P[x2]; 
   return d 
 
def t4cyclec1(A,P,i):
  m=len(A); 
  d = 0;
  for x1 in range(m):
    for x2 in range(m):
      for x3 in range(m):
        d = d + A[x1,i]*A[i][x2]*A[x2][x3]*A[x3][x1]*P[x1]*P[x2]*P[x3];
  return d
 
def t4cliquec(A,P,i,j):
 m=len(A);
 d= 0; 
 for x1 in range(m):
     for x2 in range(m):
         d = d + A[x1][x2]*A[x1][i]*A[x1][j]*A[x2][i]*A[x2][j]*P[x1]*P[x2];   
 return d

def t4cliquec1(A,P,i):
 m=len(A);
 d= 0; 
 for x1 in range(m):
  for x2 in range(m):
   for x3 in range(m):
     d = d + A[i][x1]*A[i][x2]*A[i][x3]*A[x1][x2]*A[x1][x3]*A[x2][x3]*P[x1]*P[x2]*P[x3];
 return d


# This function the Hessian H computed by the above functions into a Hessian where the parameter Q has m-1 parameter instead of m 
# since  P[m] = 1-\sum_i**[n-1] P[i] and m is the length of vector Q  
def covhessian(m, H):
 n = len(H);
 H2 = np.zeros((n-1, n-1))
 for i in range(n-m): 
  for j in range(i,n-m): 
     H2[i][j] = H[i][j]; 
 H2[j][i] = H[i][j]; 
 for i in range( (n-m) , (n-1) ):
  for j in range( i, (n-1) ):
     H2[i][j] = H[i][j] - H[i][n-1] - H[n-1][j] + H[n-1][n-1]; 
     H2[j][i] = H2[i][j];
 for i in range( (n-m) , (n-1) ):
  for j in range(  n-m ):
     H2[i][j] = H[i][j] - H[n-1][j] ; 
     H2[j][i] = H2[i][j]; 
 return H2


# This  function computes the gradient of a function considering the 
# constraint   P[m] = 1-\sum_i**[n-1] P[i] 
def covgradient1(G):
  global m
  GQ = G[1]
  G2 = np.zeros((m-1, 1))
  print('G ', G) 
  print('GQ ', GQ) 
  print('G2 ', G2)
  for i in range(m-1):
      print(i)
      G2[i] = GQ[i] - GQ[m-1]; 
 
  return (G[0], G2 )

def covgradient(G):
  global m
  G2 = np.zeros((m-1, 1)) 
  for i in range(0,m-1):
      G2[i] = G[i] - G[m-1]; 
 
  return G2



class triangle3paths(graphp):

  def __init__( self):    
      self.name = "triangle3paths" 

     
  def density(self, M):

     d = 0 ;
     if (r < 2):
        return d 

     A1 = M[0]
     A2 = M[1]
     Q = M[2]
     
     for x1 in range(m):
      for x2 in range(m):
       for x3 in range(m):
        for x4 in range(m):
          d = d + A1[x1][x2] * A1[x2][x3] * A1[x3][x1] * A2[x1][x2] * A2[x2][x3] * A2[x3][x4] * Q[x1] * Q[x2] * Q[x3] * Q[x4];

     return d 


  def gradient(self, M):

     G = [ np.zeros((m,m)) for z in range(r) ]   
     Ma = self.mat1gtriangle3paths(M)
     for i in range(m):
         for j in range(m):  
             G[0][i][j] = Ma[i][j] + Ma[j][j] - Ma[i][i]

     Ma = self.mat2gtriangle3paths(M)
     for i in range(m):
        for j in range(m): 
            G[1][i][j] = Ma[i][j] + Ma[j,j] - Ma[i][i]

     G2 = mat2vec(G); 
     G3 = np.zeros((m,1))
     
     for i in range(m):
        G3[i] = 0; 
        for j in range(m):
         for k in range(m):
          for l in range(m):
            G3[i] = G3[i] + G[0][i][k]*G[0][i][j]*G[0][j][k] * G[1][i][k]*G[1][i][j]*G[1][j][l] +  G[0][i][k]*G[0][i][j]*G[0][j][k] * G[1][i][j]*G[1][j][k]*G[1][k][l];
            G3[i] = G3[i] + G[0][i][k]*G[0][i][j]*G[0][j][k] * G[1][j][k]*G[1][i][j]*G[1][i][l]  +  G[0][k][l]*G[0][k][j]*G[0][l,j] * G[1][k][l]*G[1][k][j]*G[1][i][j];

     # G2 = [G2;G3];
     G1 = np.concatenate( (G2, G3), axis=0)
 
     # Gradient conversion to consider the constraint \sum_i Q[[i]] = 1     
     G0 = covgradient(m, G1) 
    
     return G0


  def mat1gtriangle3paths(self, M):

      Ma = np.zeros((m,m))
      for i in range(m):
       for j in range(m):
         Ma[i][j] = 0; 
         for k in range(m):
          for l in range(m):
           Ma[i][j] = Ma[i][j] + M[0][k][j]*M[0][k][i]*M[1][k][j]*M[1][k][i]*M[1][i][l]; 
           Ma[i][j] = Ma[i][j] + M[0][i][k]*M[0][k][j]*M[1][i][k]*M[1][i][j]*M[1][k][l]; 
           Ma[i][j] = Ma[i][j] + M[0][i][k]*M[0][j][k]*M[1][i][k]*M[1][i][j]*M[1][j][l]; 
           Ma[i][j] = Ma[i][j]*Q[k]*Q[l]; 

         Ma[i][j] = Ma[i][j]*Q[i]*Q[j]; 
       return Ma


  def mat2gtriangle3paths(self,M):

      Ma = np.zeros((m,m))
      for i in range(m):
       for j in range(m):
        Ma[i][j] = 0; 
        for k in range(m):
         for l in range(m):
           Ma[i][j] = Ma[i][j] + M[0][i][k]*M[0][k][l]*M[0][i][l]*M[1][k][i]*M[1][k][l]; 
           Ma[i][j] = Ma[i][j] + M[0][i][j]*M[0][j][k]*M[0][i][k]*M[1][j][k]*M[1][i][l]; 
           Ma[i][j] = Ma[i][j] + M[0][i][k]*M[0][i][j]*M[0][j][k]*M[1][i][k]*M[1][k][l]; 
           Ma[i][j] = Ma[i][j]*Q[k]*Q[l]; 
        Ma[i][j] = Ma[i][j]*Q[i]*Q[j]; 

      return Ma


  def gtriangle3pathsQ(M):
     G2 = np.zeros((m, m)); 
     return G2

  def hq(self, M):

    A1 = vec2mat(M[0])
    A2 = vec2mat(M[1])
    H = np.zeros((m,m))
    for i in range(m):
     for j in range(i,m):
       # ij = posn(i,j) ;
       for k in range(m):
         for l in range(k,m):
          H[i][j]= H[i][j] +  Q[k]*Q[l]*( A1[i][j]*A1[j][l]*A1[i][l]*A2[i][l]*A2[i][j]*A2[j][k] + A1[i][j]*A1[j][k]*A1[i][k]*A2[i][j]*A2[i][k]*A2[k][l] + A1[i][l]*A1[i][k]*A1[k][l]*A2[i][l]*A2[i][k]*A2[k][j] );    
          H[i][j] = H[i][j] + Q[k]*Q[l]*( A1[i][j]*A1[j][k]*A1[k][i]*A2[i][j]*A2[j][k]*A2[k][l] + A1[i][j]*A1[j][k]*A1[k][i]*A2[k][i]*A2[k][j]*A2[j][l] + A1[i][k]*A1[k][l]*A1[l][i]*A2[k][i]*A2[k][l]*A2[l][j] );    
          H[i][j] = H[i][j] + Q[k]*Q[l]*( A1[i][j]*A1[j][k]*A1[k][i]*A2[j][k]*A2[i][j]*A2[i][l] + A1[i][j]*A1[j][k]*A1[k][i]*A2[k][j]*A2[k][i]*A2[i][l] + A1[i][k]*A1[k][l]*A1[i][l]*A2[k][l]*A2[k][i]*A2[i][j] );    
          H[i][j] = H[i][j] + Q[k]*Q[l]*( A1[j][k]*A1[j][l]*A1[k][l]*A2[j][k]*A2[j][l]*A2[l][i] + A1[k][j]*A1[k][l]*A1[j][l]*A2[k][j]*A2[k][l]*A2[l][i] + A1[k][j]*A1[k][l]*A1[l][j]*A2[k][l]*A2[k][j]*A2[i][j] );    
       H[j][i]= H[i][j];
    return H
 
  def hp(self, M):
     return -1 

  def hm(self, M):
     return -1 



 
# Temporary def to validate t4star2
def t4star22(X,layer):
 M = vec2mat(X)
 A = vec2mat(M[layer])
 d = 0;
 m = len(A); 
 for x0 in range(m):
  for x1 in range(m):
   for x2 in range(m):
    for x3 in range(m):
     for x4 in range(m):
           d = d + A[x0][x1] * A[x0][x2] * A[x0][x3] * A[x0][x4] * Q[x0]*Q[x1]*Q[x2]*Q[x3]*Q[x4];
 return d 


class c3star1edge(graphp):

  def __init__( self):    
      self.name = "c3star1edge" 
      
  def density(self, M):

    d = 0 ;
    if (r < 2):
       return d 

    A1 = M[0]
    A2 = M[1]
    Q = M[2]

    for x1 in range(m):
     for x2 in range(m):
      for x3 in range(m):
       d = d + A1[x1][x2] * A1[x1][x2] * A2[x1][x2] * Q[x1] * Q[x2];

    return d 


  def gradient(self, M):
      G = [ np.zeros((m,m)) for i in range(r) ]
      return G

  def gradientQ(self, M):
     G2 = np.zeros((m, m)); 
     return G2


  def hq(self, M):
     pass

  def hp(self, M):
     pass 

  def hm(self, M):
     pass 


 





# Numerical methods to compute gradients and hessians 
# ----------------------------------------------------

 
# Numerically computed hessian 
def fdhess(f,L):
  V = mat2vec(L)
  nx = len(V)
  deltax = sqrt(np.spacing(1)) 
  G0 = mat2vec( f.gradient(L) ) 
  H = np.zeros((nx, nx))
  for k  in range(nx):
     U = np.zeros((nx,1))
     U[k]=1; 
     L1 = vec2mat(V+deltax*U) 
     g = ( mat2vec(f.gradient(L1)) - G0)/deltax ; 
     for i in range(nx):
         H[k][i] = g[i];        
  return H
 


def fdgrad (f,L):
    V = mat2vec(L)
    nx = len(V)
    y0 = f.density(L)
    G = np.zeros((nx,1))
    deltax = sqrt(np.spacing(1))
    for i in range(nx):
      t = copy.copy( V[i] ) 
      V[i] = V[i] + deltax
      L1 = vec2mat(V)
      G[i] = (f.density(L1) - y0) / deltax
      V[i] = t
    return G


def fdgrad2(f,X):
    y0 = f.density2(X)
    nx = len(X)
    G = np.zeros((nx,1))
    deltax = sqrt(np.spacing(1))
    for i  in range(nx):
      t = copy.copy( X[i] )
      X[i] = X[i] + deltax
      G[i] = (f.density2(X) - y0) / deltax
      X[i] = t
    return G


if __name__ == '__main__':
  m = 2
  r = 1 
  V = np.array( [0.5, 0.2, 0.6, 0.2 ] ) 
  L = vec2mat(V)

  o1 = onelayeredge(0)
  print('onelayeredge density' , o1.density(L) ) 
  print('onelayeredge gradient' , o1.gradient(L) ) 
  print('onelayeredge hessian' , o1.hessian(L) ) 

  o2 = onelayerpath3(0)
  print('onelayerpath3 density' , o2.density(L) ) 
  print('onelayerpath3 gradient' , o2.gradient(L) ) 
  print('onelayerpath3 hessian' , o2.hessian(L) ) 

  o3 = onelayertriangle(0)
  print('onelayertriangle density' , o3.density(L) ) 
  print('onelayertriangle gradient' , o3.gradient(L) ) 
  print('onelayertriangle hessian' , o3.hessian(L) ) 

  o4 = onelayerstark(0,3)
  print('onelayerstark density' , o4.density(L) ) 
  print('onelayerstark gradient' , o4.gradient(L) ) 
  print('onelayerstark hessian' , o4.hessian(L) ) 

  o5 = onelayercycle4(0)
  print('onelayercycle4 density' , o5.density(L) ) 
  print('onelayercycle4 gradient' , o5.gradient(L) ) 
  print('onelayercycle4 hessian' , o5.hessian(L) ) 

  o6 = onelayerclique4(0)
  print('onelayerclique4 density' , o6.density(L) ) 
  print('onelayerclique4 gradient' , o6.gradient(L) ) 
  print('onelayerclique4 hessian' , o6.hessian(L) ) 

  o7 = ratefunction()
  print('ratefunction density' , o7.density(L) ) 
  print('ratefunction gradient' , o7.gradient(L) ) 
  print('ratefunction hessian' , o7.hessian(L) ) 

