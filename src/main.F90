program main
use naivemath
use bettermath
implicit none

integer :: N = 10, i
real(kind=4), allocatable, dimension(:,:) :: A, B, C
real :: t1,t2

    do i=1,8
        allocate (A(N, N))
        allocate (B(N, N))
        CALL random_number(A)
        CALL random_number(B)

        ! naive
        call CPU_TIME(t1)
        C = naivmull(A, B)
        call CPU_TIME(t2)
        write (*,*) t2 - t1

        ! better
        call CPU_TIME(t1)
        C = bettmull(A, B)
        call CPU_TIME(t2)
        write (*,*) t2 - t1

        write(*,*)
        if(allocated(A)) deallocate(A)
        if(allocated(B)) deallocate(B)
        N = N * 2
    end do

end program
