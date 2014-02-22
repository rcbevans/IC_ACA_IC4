#include <math.h>
#include <stdio.h>
#include <stdlib.h>

#include "gettimemicroseconds.h" 
#include "reference_element.h"

void helmholtz_ffc(double **A, double x[4][3])
{
  /* Compute Jacobian of affine map from reference cell */
  const double J_00 = x[1][0] - x[0][0];
  const double J_01 = x[2][0] - x[0][0];
  const double J_02 = x[3][0] - x[0][0];
  const double J_10 = x[1][1] - x[0][1];
  const double J_11 = x[2][1] - x[0][1];
  const double J_12 = x[3][1] - x[0][1];
  const double J_20 = x[1][2] - x[0][2];
  const double J_21 = x[2][2] - x[0][2];
  const double J_22 = x[3][2] - x[0][2];

  /* Compute sub determinants */
  const double d_00 = J_11*J_22 - J_12*J_21;
  const double d_01 = J_12*J_20 - J_10*J_22;
  const double d_02 = J_10*J_21 - J_11*J_20;
  const double d_10 = J_02*J_21 - J_01*J_22;
  const double d_11 = J_00*J_22 - J_02*J_20;
  const double d_12 = J_01*J_20 - J_00*J_21;
  const double d_20 = J_01*J_12 - J_02*J_11;
  const double d_21 = J_02*J_10 - J_00*J_12;
  const double d_22 = J_00*J_11 - J_01*J_10;

  /* Compute determinant of Jacobian */
  const double detJ = J_00*d_00 + J_10*d_10 + J_20*d_20;

  /* Compute inverse of Jacobian */
  const double K_00 = d_00 / detJ;
  const double K_01 = d_10 / detJ;
  const double K_02 = d_20 / detJ;
  const double K_10 = d_01 / detJ;
  const double K_11 = d_11 / detJ;
  const double K_12 = d_21 / detJ;
  const double K_20 = d_02 / detJ;
  const double K_21 = d_12 / detJ;
  const double K_22 = d_22 / detJ;

  /* Set scale factor */
  const double det = detJ;

  int i, j, k;

  /* Reset values in the element tensor. */
  for (i = 0; i < 20; i++)
  {
    for (j = 0; j < 20; j++)
    {
      A[i][j] = 0.0;
    }
  }

  /* Evaluate an integral */
  for (i = 0; i < 24; i++)
  {
    for (j = 0; j < 20; j++)
    {
      for (k = 0; k < 20; k++)
      {
        A[j][k] += (FE0[i][j]*FE0[i][k]*(-1.0) + (((K_00*FE0_D100[i][j] + K_10*FE0_D010[i][j] + K_20*FE0_D001[i][j]))*((K_00*FE0_D100[i][k] + K_10*FE0_D010[i][k] + K_20*FE0_D001[i][k])) + ((K_02*FE0_D100[i][j] + K_12*FE0_D010[i][j] + K_22*FE0_D001[i][j]))*((K_02*FE0_D100[i][k] + K_12*FE0_D010[i][k] + K_22*FE0_D001[i][k])) + ((K_01*FE0_D100[i][j] + K_11*FE0_D010[i][j] + K_21*FE0_D001[i][j]))*((K_01*FE0_D100[i][k] + K_11*FE0_D010[i][k] + K_21*FE0_D001[i][k]))))*W24[i]*det;
      }
    }
  }
}


int main () 
{
  /* Set initial fake coordinates */
  double x[4][3] = {{ 3.0, 22.0, 45.1}, {1.0, 2.0, 11.0}, {4.1, 3.4, 4.1}, {1.2, 3.3, 5.6}};

  double **A = (double**) malloc (sizeof(double)*20);
  int i, j, k;
  unsigned long start, stop;

  for (i = 0; i < 20; i++) 
  {
    A[i] = (double*) malloc (sizeof(double)*20);
  }

  for (i = 0; i < 20; i++)
  {
    for (j = 0; j < 20; j++) 
    {
      A[i][j] = 0.0;
    }
  }

  start = gettimemicroseconds();
  for (i = 0; i < ITER; i++)
  {
    /* Change fake coordinates */
    for (j = 0; j < 4; j++)
      for (k = 0; k < 3; k++)
        x[j][k] = rand ();
    
    /* Invoke kernel */
    helmholtz_ffc (A, x);
  }
  stop = gettimemicroseconds();

  printf ("Elapsed: %lu us\n", stop-start);
  return 0;
}
