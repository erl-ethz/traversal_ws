/*
 *    This file was auto-generated using the ACADO Toolkit.
 *    
 *    While ACADO Toolkit is free software released under the terms of
 *    the GNU Lesser General Public License (LGPL), the generated code
 *    as such remains the property of the user who used ACADO Toolkit
 *    to generate this code. In particular, user dependent data of the code
 *    do not inherit the GNU LGPL license. On the other hand, parts of the
 *    generated code that are a direct copy of source code from the
 *    ACADO Toolkit or the software tools it is based on, remain, as derived
 *    work, automatically covered by the LGPL license.
 *    
 *    ACADO Toolkit is distributed in the hope that it will be useful,
 *    but WITHOUT ANY WARRANTY; without even the implied warranty of
 *    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 *    
 */



/*

IMPORTANT: This file should serve as a starting point to develop the user
code for the OCP solver. The code below is for illustration purposes. Most
likely you will not get good results if you execute this code without any
modification(s).

Please read the examples in order to understand how to write user code how
to run the OCP solver. You can find more info on the website:
www.acadotoolkit.org

*/

#include "acado_common.h"
#include "acado_auxiliary_functions.h"

#include <stdio.h>
#include <iostream>
#include <vector>
#include <fstream>

/* Some convenient definitions. */
#define NX          ACADO_NX  /* Number of differential state variables.  */
#define NXA         ACADO_NXA /* Number of algebraic variables. */
#define NU          ACADO_NU  /* Number of control inputs. */
#define NOD         ACADO_NOD  /* Number of online data values. */

#define NY          ACADO_NY  /* Number of measurements/references on nodes 0..N - 1. */
#define NYN         ACADO_NYN /* Number of measurements/references on node N. */

#define N           ACADO_N   /* Number of intervals in the horizon. */

#define NUM_STEPS   100        /* Number of real-time iterations. */
#define VERBOSE     1         /* Show iterations: 1, silent: 0.  */

/* Global variables used by the solver. */
ACADOvariables acadoVariables;
ACADOworkspace acadoWorkspace;

/* A template for testing of the solver. */
int main( )
{
	/* Some temporary variables. */
	int    i, iter;
	acado_timer t;

	/* Log variable */
	std::vector<std::vector<double>> log;
	log.resize(NUM_STEPS);

	/* Initialize the solver. */
	acado_initializeSolver();

	/* Initialize the weight matrices */
	for (size_t i = 0; i < N*NY*NY; i++)
		acadoVariables.W[i] = 0;
	
	for (size_t i = 0; i < N; i++)
	{
		acadoVariables.W[i*NY*NY+NY*0] = 1; // x
		acadoVariables.W[i*NY*NY+NY*1+1] = 1; // y
		acadoVariables.W[i*NY*NY+NY*2+2] = 0.01; // vx
		acadoVariables.W[i*NY*NY+NY*3+3] = 0.01; // vy
		acadoVariables.W[i*NY*NY+NY*4+4] = 5; // vz
		acadoVariables.W[i*NY*NY+NY*5+5] = 0.5; // tau_x
		acadoVariables.W[i*NY*NY+NY*6+6] = 0.5; // tau_y
		acadoVariables.W[i*NY*NY+NY*7+7] = 0.5; // tau_z
		acadoVariables.W[i*NY*NY+NY*8+8] = 0.01; // thrust
		acadoVariables.W[i*NY*NY+NY*9+9] = 1; // dismatch impedance dynamics x
		acadoVariables.W[i*NY*NY+NY*10+10] = 1; // dismatch impedance dynamics y
		acadoVariables.W[i*NY*NY+NY*11+11] = 1; // dismatch impedance dynamics z
	}
	
	for (size_t i = 0; i < NYN*NYN; i++)
		acadoVariables.WN[i] = 0;
	
	acadoVariables.WN[0] = 1; // x
	acadoVariables.WN[4] = 1; // y
	acadoVariables.WN[8] = 10; 	 // vz

	/* Initialize the states and controls. */
	for (i = 0; i < (N + 1); ++i) {
		acadoVariables.x[ i*NX+0 ] = 0.0;	// x
		acadoVariables.x[ i*NX+1 ] = 0.0;	// y
		acadoVariables.x[ i*NX+2 ] = 1.0;	// z
		acadoVariables.x[ i*NX+3 ] = 0.0;	// vx
		acadoVariables.x[ i*NX+4 ] = 0.0;	// vy
		acadoVariables.x[ i*NX+5 ] = 0.0;	// vz
		acadoVariables.x[ i*NX+6 ] = 1.0;	// q_w
		acadoVariables.x[ i*NX+7 ] = 0.0;	// q_x
		acadoVariables.x[ i*NX+8 ] = 0.0;	// q_y
		acadoVariables.x[ i*NX+9 ] = 0.0;	// q_z
		acadoVariables.x[ i*NX+10 ] = 1.0;	// w_x
		acadoVariables.x[ i*NX+11 ] = 0.0;	// w_y
		acadoVariables.x[ i*NX+12 ] = 0.0;	// w_z
	}

	/* Initialize Online Data. */
	for (i = 0; i < (N + 1); ++i) {
		acadoVariables.od[ i*NOD+0 ] = 0.0;		// external_force x
		acadoVariables.od[ i*NOD+1 ] = 0.0;		// external_force y
		acadoVariables.od[ i*NOD+2 ] = 0.0;		// external_force z
		acadoVariables.od[ i*NOD+3 ] = 0.0;		// external_torque x
		acadoVariables.od[ i*NOD+4 ] = 0.0;		// external_torque y
		acadoVariables.od[ i*NOD+5 ] = 0.0;		// external_torque z
		acadoVariables.od[ i*NOD+6 ] = 0.05;	// velocity reference_z
	}

	for (i = 0; i < N; ++i)  {
		acadoVariables.ubValues[ NU*i ] = 20;   // thrust
		acadoVariables.ubValues[ NU*i+1 ] = 0.5;   // tau x
		acadoVariables.ubValues[ NU*i+2 ] = 0.5;   // tau y
		acadoVariables.ubValues[ NU*i+3 ] = 0.5;   // tau z
	}

	/* Initialize the measurements/reference. */
	for (i = 0; i < N; ++i)  {
		acadoVariables.y[ i*NY+0 ] = 0.5;	// x
		acadoVariables.y[ i*NY+1 ] = 0; // y
		acadoVariables.y[ i*NY+2 ] = 0; // vx
		acadoVariables.y[ i*NY+3 ] = 0; // vy
		acadoVariables.y[ i*NY+4 ] = 0.05; // vz
		acadoVariables.y[ i*NY+5 ] = 0; // tau_x
		acadoVariables.y[ i*NY+6 ] = 0; // tau_y
		acadoVariables.y[ i*NY+7 ] = 0; // tau_z
		acadoVariables.y[ i*NY+8 ] = 0; // thrust
		acadoVariables.y[ i*NY+9 ] = 0; // dismatch impedance dynamics x
		acadoVariables.y[ i*NY+10 ] = 0; // dismatch impedance dynamics y
		acadoVariables.y[ i*NY+11 ] = 0; // dismatch impedance dynamics z
	}
	acadoVariables.yN[ 0 ] = 0.5;
	acadoVariables.yN[ 1 ] = 0;
	acadoVariables.yN[ 2 ] = 0.05;


	/* MPC: initialize the current state feedback. */
#if ACADO_INITIAL_STATE_FIXED
	for (i = 0; i < NX; ++i) acadoVariables.x0[ i ] = acadoVariables.x[i];
#endif

	if( VERBOSE ) acado_printHeader();

	/* Prepare first step */
	acado_preparationStep();

	/* Get the time before start of the loop. */
	acado_tic( &t );
	int status;

	/* The "real-time iterations" loop. */
	for(iter = 0; iter < NUM_STEPS; ++iter)
	{
		printf("objective function : %f\n", acado_getObjective());
		printf("x_desired = %f\t", acadoVariables.y[0]);
		/* Perform the feedback step. */
		status = acado_feedbackStep( );
		// DEBUG
		// acado_printDifferentialVariables();
		// acado_printControlVariables();

		/* Apply the new control immediately to the process, first NU components. */
		printf("solver status : %d\n", status);
		if( VERBOSE ) printf("\tReal-Time Iteration %d:  KKT Tolerance = %.3e\n\n", iter, acado_getKKT() );
		
		log[iter].resize(NX+NU+1);
		for (i = 0; i < NX; ++i) 
		{
			log[iter][i] = acadoVariables.x[i];
			acadoVariables.x0[ i ] = acadoVariables.x[NX + i];  
		}
		for (; i < NU+NX; i++)
		{
			log[iter][i] = acadoVariables.u[i-NX];
		}
		log[iter][NX+NU] = acadoVariables.ubValues[0];
		// acado_shiftStates(2, 0, 0);
		// acado_shiftControls( 0 );

		/* Prepare for the next step. */
		acado_preparationStep();
	}
	/* Read the elapsed time. */
	real_t te = acado_toc( &t );

	if( VERBOSE ) printf("\n\nEnd of the RTI loop. \n\n\n");

	/* Eye-candy. */

	if( VERBOSE )
		printf("\n\n Average time of one real-time iteration:   %.3g microseconds\n\n", 1e6 * te / NUM_STEPS);

	acado_printDifferentialVariables();
	acado_printControlVariables();

	/* Save log data */
	std::ofstream dataLog( "./mpc_drone.txt" );
	if ( dataLog.is_open() )
	{
		for (i = 0; i < log.size(); i++)
		{
			for (int j = 0; j < log[ i ].size(); j++)
				dataLog << log[ i ][ j ] << " ";
			dataLog << std::endl;
		}

		dataLog.close();
	}
	else
	{
		std::cout << "Log file could not be opened" << "\n";

		return 1;
	}

    return 0;
}
