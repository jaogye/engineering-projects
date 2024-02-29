"""
Created on Sun Jan  3 14:19:26 2021

@author: Juan Alvarado
"""

"""
This program computes a maximum entropy  of  amalgamated stepfunctions constrained by 
 subgraph densities 

 The vector of m stepfunctions have two representations:
 1] A list of Matrices-Vector  [M_1, ...,M_r,Q] representation  
    where the entry r is the number of relations and M_i a symmetric matrix mxm
    and Q is the  partition vector

    
# 2] One dimension vector representation: It is denoted by X and it is a vector 
formed  by M_i converted to one-dimension representation using P_i = mat2vec [W_]
and concated all into [P_1,...,P_r, Q[m-1]] where Q[m-1] are m-1 first entries of Q

and Q minus the last entry of Q since all entries of Q are positive and sum 1

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
 
 # To transform the position on the matrix into the position in the vetor
"""

import numpy as np
from scipy.optimize import minimize
from scipy.optimize import Bounds
from scipy.special import logit

from math import log, floor, sqrt
from random import random

from numpy.linalg import eig
import datetime
from GraphParameters import covgradient, vec2mat, mat2vec, onelayeredge, onelayerpath3, onelayertriangle, onelayerstark, onelayercycle4, onelayerclique4, ratefunction

penalty = 1e+8; 
r=1
m=2
def getRandomStepFunction(offdiagonal):
      global m 
      L = []
      for layer in range(r): 
        L.append( np.zeros((m,m)) )
        for i in range(m):
          for j in range(i,m):
             if (i==j):
                L[layer][i][j] = random() 
             else: 
               L[layer][i][j] = offdiagonal;
               L[layer][j][i] = offdiagonal;     
      L = [L]
      L.append( np.ones((m,1)) /m ) 
      return L

 
 
# Miscelaneous functions
# -------------------------------------------------------------------
# This function computes the minimum triangle density based on Alexander Razborov  formula 
def mintri(rho):
 t = floor(1/(1-rho)); 
 d = (t-1) * (t - 2*sqrt( t*(t-rho*(t+1) ) ) ) * (  t + sqrt( t*(t-rho*(t+1)) ) )**2;
 d = d /(  t**2 *(t+1)**2 ); 
 return d 

def optimalstepfunction(rho, tau):
 Q = np.zeros( [0.5, 0.5])
 x = [rho**3 - tau]**[1/3]; 
 P = np.zeros( [rho-x, rho+x, rho-x] ) 
 return [ vec2mat(P), Q ]

def getOptimalEdgetriangle(stat):    
 X = np.zeros((4,1))    
 X[0][0] = stat[1] - (stat[1]**3 - stat[2] )**[1/3] ; 
 X[1][0] = stat[1] + (stat[1]**3 - stat[2] )**[1/3] ; 
 X[2][0] = X[0][0]; 
 X[3][0] = 0.5; 
 return X


# -------------------------------------------------------------------------------------------------------------------------------------------
 
   
class Optimiza():
  def __init__( self, constraints, goalfunction):
      self.constraints = constraints
      self.goalfunction = goalfunction
  def density(self, L):
      d = self.goalfunction.density(L) + penalty * self.densityDistance(L)
      return d 
  def densityX(self, X):
      L = vec2mat(X)
      d = self.density(L)
      return d 
  # Compute the distance to the feasble region i.e. sum_i (t[F_i,W]-stas_i)**2
  def densityDistance(self, L):
      d = 0 
      for para in self.constraints:
        d2 =  (para[0].density(L) - para[1]) 
        d = d + d2 * d2 
      return d   
   # Compute the distance to the feasble region i.e. sum_i (t[F_i,W]-stas_i)**2
  def densityDistanceX(self, X):
      L = vec2mat(X)
      return self.densityDistance(L)
  def gradient(self, L):
      G = self.goalfunction.gradient(L) + penalty * self.gradientDistance(L)
      return G
  def gradientX(self, X):
      L = vec2mat(X)
      return self.gradient(L)      
  def gradientDistance(self, L):
      G = 0
      for para in self.constraints:
          d = para[0].density(L) - para[1]
          G = G + 2*d*para[0].gradient(L) 
      return G    
  def gradientDistanceX(self, X):
      L = vec2mat(X)
      return self.gradientDistance(L)
  def hessian(self, L):
      H = self.goalfunction.hessian(L) + penalty * self.hessianDistance(L)
      return H
  def hessianX(self, X):
      L = vec2mat(X)
      return self.hessian(L)      
  def hessianDistance(self, L):
      H = 0
      for para in self.constraints:
         G2 = para[0].gradient( L )
         H2 = para[0].hessian( L ) 
         d = (para[0].density(L) - para[1])
         H = H + 2*(d*H2 + G2.dot( G2.transpose() )) ; 
      return H
  def hessianDistanceX(self, X):
      L = vec2mat(X)
      return self.hessianDistance(L) 
  # get gradient vectors 
  def getJacobian(self, L):
    M = L[0]
    P = L[1]
    m = len(P) 
    J = []
    for para in self.constraints:
       J.append( covgradient(m, para[0].gradient( L )) )
    J =np.array(J) ;    
    return J 
  # get the projection matrix into the normal space of the feasible at P 
  def getProjection(self, L):
   Jh =  self.getJacobian(L) ; 
   # Pj = Jh*inv[Jh'*Jh]*Jh';
   Pj =  Jh.dot((Jh.transpose().dot(Jh))**(-1) ).dot(Jh.transpose())                         
   return Pj 
  # This function computes the \mu coefficients of the geodesic hessian 
  def getmu(self, L):
   Jh =  self.getJacobian(L) ; 
   Gent = self.goalfunction.gradient(L)     
   # mu =  Gent'*Jh*inv[Jh'*Jh]; 
   mu =  Gent.transpose().dot(Jh).dot((Jh.transpose().dot(Jh))**(-1) )     
   return mu
  # This function computes the geodesic hessian of the ratefunction def at [A,P]
  def getGeoHessian(self,L):
    Jh =  self.getJacobian(L) ; 
    Hg =  self.goalfunction.hessian(L) 
    Gent = self.goalfunction.gradient(L)
    # mu =  Gent'*Jh*inv[Jh'*Jh];     
    mu =  Gent.transpose().dot(Jh).dot((Jh.transpose().dot(Jh))**(-1) ) 
    for i in range(len(mu)):
        Hg = Hg - mu[i] * self.parameters[i][0].hessian( L )
    return Hg
  # Get lagrange multipliers 
  # beta : Lagrange multipliers
  # rerror : Relative error
  # e : error vector 
  def getLagrange(self,L):
    Jh = self.getJacobian(L) 
    Y = self.goalfunction.gradient(L) 
    # beta = inv[M'*M]*M'*Y; 
    beta = (Jh.transpose().dot(Jh)**(-1)).dot(Jh.transpose()).dot(Y)
    Yhat = L*beta; 
    E = Y - Yhat; 
    rerror = np.inner(E,E)*np.inner(Yhat,Yhat); 
    return beta, E, rerror 
  # This function computes the max and min eigenvalues of the geodesic hessian projected into the tangent space
  def qform(self,L):
    mm = m*(m+1)/2 + m - 1; 
    Pj = self.getProjection(L); 
    Hg = self.getGeoHessian(L); 
    A = [np.identity(mm) - Pj ]
    # B = A'*Hg*A; 
    B = A.transpose().dot(Hg).dot(A)
    ee, _ = eig(B) ; 
    for i in range(len(ee) ):
      for j in range(i,len(ee)):
          if (ee[i][1] > ee[j][1]):
             temp = ee[i][1]; 
             ee[i][1] = ee[j][1]; 
             ee[j][1] = temp; 
             temp = ee[i][2]; 
             ee[i][2] = ee[j][2]; 
             ee[j][2] = temp; 
    qmin = ee[len(self.contraints)+1,2]; 
    qmax = ee[len(ee),2];  
    return qmin, qmax, B


# Function to constraint partititons  
def partition(X):
  global r; 
  global m; 
  Q = X[ floor(r*m*(m+1)/2):len(X) ]  
  d=1-sum(Q)
  return d

def feasibleSolution(opt):
    global m 
    # Generation of the initial solution
    L = getRandomStepFunction(0.95)
    X = mat2vec(L)
    print('Initial value', opt.densityDistanceX(X), 'Initial solution ', X)
    margin = 10*np.spacing(1); 
    # Define the constraints
    constraints = ({'type': 'ineq', 'fun': partition})
    bounds = []
    for i in range(len(X)):
        bounds.append((margin, 1-margin) )
    result = minimize(fun=opt.densityDistanceX, x0=X, jac=opt.gradientDistanceX, 
                      hess=opt.hessianDistanceX, bounds=bounds, constraints=constraints)
    return result

# This function computes the optimal step def given a valid initial solution. 
def optimalSolution(opt, x):
    margin = 10*np.spacing(1)
    constraints = ({'type': 'ineq', 'fun': partition})
    bounds = []
    for i in range(len(x)):
        bounds.append((margin, 1-margin) )
    result = minimize(fun=opt.densityX, x0=x, jac=opt.gradientX, hess=opt.hessianX, bounds=bounds, constraints=constraints)
    return result

# Get the minimal size of stepfunctions such that satisfy the constraints and minimize rate 
def computeSolution(opt):
     result= feasibleSolution(opt)    
     opti_result = optimalSolution(opt, result.x); 
     return opti_result


    
# Main Program 
# ---------------------------------------------------------------------------------------------------------------

m=2;
r=1; 
L = getRandomStepFunction(0.95) 

# Vector of sufficient statistics 
vecstat = np.array(  [ 0.735, 0.37171725] ) 
vecstat = np.array( [ 0.4, 0.056] )
penalty = 1e+8; 

ratef = ratefunction()
o_onelayeredge = onelayeredge(0)
o_onelayertriangle = onelayertriangle(0)
o_onelayerpath3 = onelayerpath3(0)
o_onelayerstar2 = onelayerstark(0,2)
o_onelayercycle4 = onelayercycle4(0)
o_onelayerclique4 = onelayerclique4(0)
# Define the equality constraints, each constraint is the pair (graphParameter,number)
constraints = [(o_onelayeredge, 0.4),  ( o_onelayertriangle, 0.056)]

# Define the optimization parameters 
opt = Optimiza(constraints, ratef)

print('Density ', opt.density(L))
print('Gradient ', opt.gradient(L))
print('Hessian ', opt.hessian(L))

print('Optimal solution ', computeSolution(opt))
 
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------
# Initialization functions 
# -----------------------------------------------------------------------------------------------------------------------------------------------------------------
# Optimization functions: The input parameter are the global vectors  vecgraph and vecstat
# The def computeSolution[vecstat_new, Xini, mini] computes an optimal stepdef 
 # ----------------------------------------------------------------------------------------------------------------------------------------------------------------
"""
def feasibility(goalfunction, m, offdiagonal):

 vecstat = vecstat_new; 
 mindis = -99999999; 
 margin = 10*np.spacing(1); 
 avgtime = 0; 
 for k in range(10):
      X = getRandomStepFunction[m, offdiagonal];
      time0 = datetime.datetime.now()
      dis= 0      
      result = minimize( X, [@distanceF2, @gradientF2 ], [], [@partition] , zeros[len(X),1]+margin, ones[len(X),1]-margin,1000 );
      result = minimize( X, [@distanceF2, @gradientF2 ], [], [@partition] , zeros[len(X),1]+margin, ones[len(X),1]-margin,1000 );
      XF, dis, info, iter, nf, lambda1 = result
      time1 = datetime.datetime.now() 
      avgtime = avgtime + time1 -time0 ; 
      if (dis < mindis):
         mindis = dis; 

 avgtime = avgtime / 10; 
 
 return mindis, avgtime 

 

# it gives the number of edge of a given graph name 
def eGraph(sName):
 
   if sName == "triangle":
     d = 3; 
   if sName == "3paths":
     d = 3;
   if sName == "edges":
     d = 1; 
   if sName == "2star":
     d =  2;
   if sName == "3star":
     d = 3; 
   if sName == "4star":
     d = 4; 
   if sName == "4cycle":
     d = 4;
   if sName == "4clique":
     d = 6;
     
   return d 
 
# if the graph is bipartite
def Isbipartite(sName):
 
   if sName == "triangle":
     d = 0; 
   if sName == "3paths":
     d = 1;
   if sName == "edges":
     d = 1; 
   if sName == "2star":
     d = 1;
   if sName == "3star":
     d = 1; 
   if sName == "4star":
     d = 1; 
   if sName == "4cycle":
     d = 1;
   if sName == "4clique":
     d = 0; 
  
   return d; 


# Functions to run experimients  
# ---------------------------------------------------------------------------------------------

 
# This function saves the head of file
def saveHead(d,vecgraph):
 for i in range(len(vecgraph)):
     fprintf(fd, "%s;", vecgraph[l]); 
     fprintf(fd, "%s;", "ratefunction");
     fprintf(fd, "%s;", "size")
     fprintf(fd, "%s;", "tfeas")
     fprintf(fd, "%s;", "topti")
     fprintf(fd, "%s;", "error")
     for j in range(19):
      fprintf(fd, "x%d;", j) 

 fprintf(fd, "%s;", "edges")
 fprintf(fd, "%s;", "triangle")
 fprintf(fd, "%s;", "4clique")
 fprintf(fd, "%s;", "2star")
 fprintf(fd, "%s;", "3star")
 fprintf(fd, "%s;", "4star")
 fprintf(fd, "%s;", "3paths")
 fprintf(fd, "%s;", "4cycle")
 fprintf(fd, "\n") 
 return 
 
 
 
 # This function saves a solution 
def saveSolution(fd, vecstat, m, tfeas, topti, rerror, X):
 for i in  range( len(vecstat) ):
    fprintf(fd, "%2.5f;", vecstat[i]) 

 fprintf(fd, "%2.12f;", ratefunction2(X))  
 fprintf(fd, "%d;", m) 
 fprintf(fd, "%4.4f;", tfeas)
 fprintf(fd, "%4.4f;", topti)
 fprintf(fd, "%4.12f;", rerror)
 
 for i in range( len(X)):
    fprintf(fd, "%2.18f;", X[i])

 
 fprintf(fd, "%1.4f;", density2("edges",X))
 fprintf(fd, "%1.4f;", density2("triangle",X))
 fprintf(fd, "%1.8f;", density2("4clique",X))
 fprintf(fd, "%1.8f;", density2("2star",X))
 fprintf(fd, "%1.8f;", density2("3star",X))
 fprintf(fd, "%1.8f;", density2("4star",X))
 fprintf(fd, "%1.8f;", density2("3paths",X))
 fprintf(fd, "%1.8f;", density2("4cycle",X))
 fprintf(fd, "\n")
 
 return 
 
 
 # This function runs experiments on rate def stepfuncion minization. 
def runExperiment(vecgraph_new, sName=""):

 vecgraph = vecgraph_new; 
 
 if isempty(sName):
    sName = strcat[vecgraph[1],"_", vecgraph[2], ".csv"];
 endif 
 fd = fopen [sName, "w"];
 saveHead[fd,vecgraph]; 
 Xini = 0; 
 for i in range(199):
     dedges=i*0.005;
     dsubgraph1=[dedges]**eGraph[vecgraph[1]];
     # Computation of optimal graphon above the Erods-Renyi curve 
     dsubgraph2=[dedges]**eGraph[vecgraph[2]];
     # Saving the Erdos-Renyi case
     saveSolution[fd, [dsubgraph1, dsubgraph2], 1, 0, 0, 0, dedges]; 
     dsubgraph2=dsubgraph2+0.005;
     m = 2 ; Xini=0; 
     found=1;
     while (dsubgraph2 < 1 and m != 0 and found ):
        vecstat_new = [dsubgraph1, dsubgraph2]; 
        t2=time() 
        [found, rerror,m,XF, obj,info, Xini1, Xini2, time1] = computeSolution[vecstat_new, Xini, 2 ];
        t1=time()
        if found:
           saveSolution[fd, [dsubgraph1, dsubgraph2], m, time1-t2, t1-time1, rerror, XF]; 
           Xini=XF; 
        endif
        dsubgraph2 = dsubgraph2 + 0.005;
     endwhile 
     # Computation of optimal graphon below the Erods-Renyi curve 
     dsubgraph2=[dedges]**eGraph[vecgraph[2]]-0.005;
     m = 2 ; Xini=0; found=1; 
     while (dsubgraph2 > 0 and m != 0 and found ):
        vecstat_new = [dsubgraph1, dsubgraph2]; 
        t2=time()
        [found, rerror,m,XF, obj,info, Xini1, Xini2, time1] = computeSolution[vecstat_new, Xini,2 ];
        t1=time()
        if found:
           saveSolution[fd, [dsubgraph1, dsubgraph2], m, time1-t2, t1-time1,  rerror, XF];
           Xini=XF; 
        endif
        dsubgraph2 = dsubgraph2 - 0.005;

 fclose[fd]; 
 return 
 
 
 
 
 # This function runs experiments on rate def stepfuncion minimization. 
def runExperimentlog(alog, vecgraph_new, sName):
 
 vecgraph = vecgraph_new; 
 
 fd = fopen [sName, "w"];
 saveHead[fd,vecgraph];
 for j in range(19):
    fprintf(fd, "x%d;", j)

 fprintf(fd, "\n")
 Xini = 0; 
 for i in range(len(alog)):
     dsubgraph1=alog[i,1];
     dsubgraph2=alog[i,2];
     t2=time()
     [found, rerror,m,XF, obj,info, Xini1, Xini2, time1] = computeSolution[[dsubgraph1, dsubgraph2], 0, 2 ];
     iter = 0; 
     rerrormin = 10; 
     Xmin=0;
     while (rerror > 10**-5 and iter < 5 ):
        [found, rerror,m,XF, obj,info, Xini1, Xini2, time1] = computeSolution[[dsubgraph1, dsubgraph2], 0, 2 ];
        if (rerror < rerrormin):
           rerrormin = rerror; 
           Xmin = XF; 
        endif 
        iter=iter+1 
     endwhile 
     t1=time()
     saveSolution[fd, [dsubgraph1, dsubgraph2], m, t1-time1, time1 -t1 , rerror, XF]; 
  
 fclose[fd]; 
 return  
 
 

 
def readtable(fname, skipline=0):
 fd = fopen [fname, "r"];
 if skipline:
    sline = fgets[fd]; 
 endif 
 i=0;
 while ( not feof[fd] ):
    i=i+1 
    sline = fgets[fd]; 
    tokens = tokenize[sline, ";" ]; 
    for j in range(len(tokens)):
        aW[i][j] = str2double[ tokens[j] ] ;

 fclose[fd]; 
 return aW
 
 
 
def savefile(sName, aW):
 fd = fopen [sName, "w"];
 n= len[aW[1,]]; 
 for i in range(len(aW)):
     for j in range(n-1):
        fprintf(fd, "%2.12f;", aW[i][j]) 

     fprintf(fd, "%2.12f \n", aW[i,n]) 
 
 fclose[fd]; 
 return
 


def checkIniValues(vecgraph_new ):
 
 aExp2 = readExperimients[vecgraph_new];
 # aExp  = aExp2(find[aExp2(:,3]!=2] ,:];  
 aExp  = 0
 
 
 vecgraph = vecgraph_new; 
 
 fd = fopen [strcat["log", vecgraph[1], vecgraph[2],".csv"], "a"];
 for j in range( len(aExp) ):
     [mindis, avgtime]  = feasibility[aExp[j,1,2], aExp[j,3], 0.95];
     fprintf(fd, "%s;", vecgraph[1])
     fprintf(fd, "%s;", vecgraph[2])
     fprintf(fd, "%12.6f;", aExp[j,1] )
     fprintf(fd, "%12.6f;", aExp[j,2] )
     fprintf(fd, "%d;", aExp[j,3])
     fprintf(fd, "%8.2f;", avgtime )
     fprintf(fd, "%18.14f;", mindis )
     fprintf(fd, "\n") 
 
 
 
 for j in range(len(aExp)):
     [mindis, avgtime]  = feasibility[aExp[j,1,2], aExp[j,3], 0.05];
     fprintf(fd, "%s;", vecgraph[1])
     fprintf(fd, "%s;", vecgraph[2])
     fprintf(fd, "%12.6f;", aExp[j,1] )
     fprintf(fd, "%12.6f;", aExp[j,2] )
     fprintf(fd, "%d;", aExp[j,3])
     fprintf(fd, "%8.2f;", avgtime )
     fprintf(fd, "%18.14f;", mindis )
     fprintf(fd, "\n") 
 

 fclose[fd]; 
 return
 
  
 """
 
 
 
 
 

"""
  
 # Compute the distance how far Lagrange multiplier is satisfied i.e. sum_i [t[F_i,W]-stas_i]**2
def fstat(X):
 P = X[1 , m*(m+1)/2];
 Q = X[ m*(m+1)/2+1 , m*(m+1)/2+m-1 ];
 Q = [Q, 1-sum[Q]];
 beta = X[m*(m+1)/2+m:len(X)];
 D= rateI.gradient(M)
 #D=zeros[len(P) ]; 
 np=len(vecgraph);
 for i in range(np):
     D = D - beta[i]* vecgraph[i].gradient(M) 

 d = np.inner(D,D)**2 + penalty*distance(X);
 return d
 
 
 # Compute a penalized version for the rate function
def frate(X):
 P = X[1:m*(m+1)/2];
 Q = X [ m*(m+1)/2+1:m*(m+1)/2+m-1];
 Q = np.zeros( [Q, 1-sum(Q)] )
 d = ratefunction(M) + penalty*distance(X);
 return d

 
# -------------------------------------------------------------

def gradientQ( M ):
     G = [ np.zeros((m,m)) for i in range(r) ]
     Q = M[r]
     for layer in range(r):
      for i in range(m):
        for j in range(i,m):        
         G[layer][i][j] = (2-delta(i,j))*logit(M[layer][i][j])*Q[i]*Q[j]; 
         G[layer][j][i] = G[layer][i][j]; 
         print( G[layer][j][i]  )   

     print(G)
     G2 = mat2vec(G); 
     return G2


# def to obtain Jacobians and Lagrange Multipliers
# ----------------------------------------------------------- 
# get gradient vectors considering Q as a constant parameter
def getJacobianQ(M):
 J = []; 
 for i in range(len(vecgraph)):
     J = [J,  vecgraph[i].gradientQ( M)] 
 
 return J
 
  
 # This function computes the \mu coefficients of the geodesic hessian whne Q is  constant 
def getmuQ(M):
 Jh =   getJacobianQ[M] ; 
 Gent =  ratef.gradientQ(M) 
 # mu =  Gent'*Jh*inv[Jh'*Jh]; 
 mu =  Gent.transpose().dot(Jh).dot((Jh.transpose().dot(Jh))**(-1) ) 
 return mu 
 

 # This function computes the geodesic hession of the ratefunction def at W 
 # and considering Q as a constant parameter
def getGeoHessianQ(M):
 Jh =  getJacobianQ(M) ; 
 Hg =  ratef.hessianQ( M) 
 Gent = ratef.gradientQ(M)
 # mu =  Gent'*Jh*inv[Jh'*Jh]; 
 mu =  Gent.transpose().dot(Jh).dot((Jh.transpose().dot(Jh))**(-1) ) 
 for i in range(len(vecgraph) ):
     Hg = Hg - mu[i]* vecgraph[i].hessianQ( M)
 
 return Hg
 
 
 # This function computes the max and min eigenvalues of the geodesic hessian 
 # projected into the tangent space where Q is a constant parameter
def qformQ(M):
 m = len(Q); 
 mm = m*(m+1)/2; 
 Pj = getProjectionQ(M); 
 Hg = getGeoHessianQ(M); 
 A = [np.identity(mm) - Pj]; 
 B = A.transpose().dot(Hg).dot(A )
 ee = eig[B] ; 

 ecut = np.sort( abs(ee) ); 
 qmin =  min[ee[abs[ee] > ecut]] ; 
 qmax =  max[ee[abs[ee] > ecut]] ;
 
 return qmin, qmax, B

# Compute distance  of a stepdef to the constrained region in terms of sufficient statistics  sum_i [t[F_i,W]-stas_i]**2 considereinmg as constant
def distanceFQ(P):
 d=0; 
 for i in range(len(vecgraph)):
     d = d + ((vecgraph[i].density(M) - vecstat[i]))**2; 
 return d
 

 # def that computes the hessian of the distance to the feasible region defined by a vector of graphs and a vector statistics at [M] when Q is constant 
 # distance = sum_i [t[F_i,W]-stas_i]**2
def hessianFQ(P):

 H = np.zeros((len(P) ,len(P) ))
 for i in range( len(vecgraph) ):
      # If the hessian total I apply covariant derivation 
     G2 =  vecgraph[i].gradientQ( M) 
     H2 =  vecgraph[i].hessianQ( M) 
     d = vecgraph[i].density(M) - vecstat[i]
     H = H + 2*(d*H2 + G2.dot( G2.transpose() )) ; 

 return H
 
   
def gradientFQ(P):
 G = np.zeros((len(P) ,1))
 for i in range( len(vecgraph) ):
      G = G + 2*[vecgraph[i].density( M) 
                 - vecstat[i]]*vecgraph[i].gradientQ( M); 

 return G
 
 # get the projection matrix into the normal space of the feasible at P considering Q as a constant parameter
def getProjectionQ(M):
 Jh =  getJacobianQ(M) ; 
 # Pj = Jh*inv[Jh'*Jh]*Jh';
 Pj =  Jh.dot((Jh.transpose().dot(Jh))**(-1) ).dot(Jh.transpose()) 
                         
 return Pj

 mini = 2 ; Xini = 0 ; 
found,rerror,m,XF, obj,info, Xini1, Xini2, time1 = computeSolution[vecstat, Xini, mini]
 
#* t[K2,W] = 1/16
#* t[S3,W] = 0.064/64
#* t[S4,W] = 0.01637664/256 and where we want to find the smallest possible t[S2,W].
m=4; 
# vecgraph = ["edges", "3star", "4star"] ; 
# vecstat = [1/16; 0.064/64; 0.01637664/256 ]; 

 #runs[0.406, 0.99, "edges_triangle_2starAll.csv"]
 #checkIniValues[vecgraph ]
 #computeTime[vecgraph]
 
"""