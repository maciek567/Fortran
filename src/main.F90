program main
use naivemath
use bettermath
use dotmath
implicit none

integer :: N = 10, i
real(kind=4), allocatable, dimension(:,:) :: A, B, C
real :: t1,t2
open(1, file = "../res/time_measur_naive", status = 'new')
open(2, file = "../res/time_measur_better", status = 'new')
open(3, file = "../res/time_measur_dot", status = 'new')
open(4, file = "../res/time_measur_matmul", status = 'new')

    do i=1,8
        allocate (A(N, N))
        allocate (B(N, N))
        allocate (C(N, N))
        CALL random_number(A)
        CALL random_number(B)

        ! naive multiplication
        call CPU_TIME(t1)
        C = naivmull(A, B)
        call CPU_TIME(t2)
        write (*,*) N, t2 - t1
        write (1,*) N, t2 - t1

        ! better multiplication
        call CPU_TIME(t1)
        C = bettmull(A, B)
        call CPU_TIME(t2)
        write (*,*) N, t2 - t1
        write (2,*) N, t2 - t1

        ! dot product multiplication
        call CPU_TIME(t1)
        C = dotmull(A, B)
        call CPU_TIME(t2)
        write (*,*) N, t2 - t1
        write (3,*) N, t2 - t1

        ! build-in matmul multiplication
        call CPU_TIME(t1)
        C = matmul(A, B)
        call CPU_TIME(t2)
        write (*,*) N, t2 - t1
        write (4,*) N, t2 - t1

        write(*,*)
        if(allocated(A)) deallocate(A)
        if(allocated(B)) deallocate(B)
        if(allocated(C)) deallocate(C)
        N = N * 2
    end do

close(1)
close(2)
close(3)
close(4)

end program
