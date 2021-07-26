PROGRAM RUNGE_KUTTA
	!4th order method for systems of equations
	IMPLICIT NONE 
	REAL*8, ALLOCATABLE :: Y(:),Y0(:),K0(:),K1(:),K2(:),K3(:)
	INTEGER :: N,STEPS,I,J
	REAL*8 :: H,X,XEND
	
	OPEN(1,FILE='initial.txt')
	READ(1,*) N,STEPS,H,X,XEND
	ALLOCATE(Y(N),Y0(N),K0(N),K1(N),K2(N),K3(N))
	READ(1,*) Y
	CLOSE(1)
	PRINT*,'*********************SYSTEMS OF EQUATIONS*********************'
	PRINT*,'*****************4th ORDER RUNGE-KUTTA METHOD*****************'
	PRINT*, '	X		Y(I)	 	, I=1,',N
	OPEN(2,FILE='results.txt')
	DO WHILE (X < XEND) 
		DO J=0,STEPS
			WRITE(2,*) X,(Y(I),I=1,N)
			PRINT'(5E13.5)',X,(Y(I),I=1,N)
			K0=FUNC(X,Y,N);Y0=Y;Y=Y0+.5*H*K0;X=X+.5*H
			K1=FUNC(X,Y,N);Y=Y0+.5*H*K1
			K2=FUNC(X,Y,N);Y=Y0+H*K2;X=X+.5*H
			K3=FUNC(X,Y,N);Y=Y0+(K0+2.*(K1+K2)+K3)/6.*H
		END DO
	END DO 
	CLOSE(2)
	CONTAINS
	FUNCTION FUNC(X,Y,N)
		! Provides the values of f(x,y(i)) specified by user
		IMPLICIT NONE
		INTEGER, INTENT (IN) :: N
		REAL*8 :: FUNC(N)
		REAL*8, INTENT (IN) :: X,Y(:)
		FUNC(1)=-2.*Y(1)+4.*EXP(-X)
		FUNC(2)=-Y(1)*(Y(2)**2)/3.
		RETURN
	END FUNCTION
END PROGRAM RUNGE_KUTTA
