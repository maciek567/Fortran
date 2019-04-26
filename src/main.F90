program main
use naivemath
use bettermath
use dotmath
implicit none

integer :: N, i, k
real(kind=4), allocatable, dimension(:,:) :: A4, B4, C4
real(kind=8), allocatable, dimension(:,:) :: A8, B8, C8
real(kind=16), allocatable, dimension(:,:) :: A16, B16, C16
real :: t1,t2

open(1, file = "../res/time_measur_naive_4", status = 'new')
open(2, file = "../res/time_measur_naive_8", status = 'new')
open(3, file = "../res/time_measur_naive_16", status = 'new')

open(4, file = "../res/time_measur_better_4", status = 'new')
open(5, file = "../res/time_measur_better_8", status = 'new')
open(6, file = "../res/time_measur_better_16", status = 'new')

open(7, file = "../res/time_measur_dot_4", status = 'new')
open(8, file = "../res/time_measur_dot_8", status = 'new')
open(9, file = "../res/time_measur_dot_16", status = 'new')

open(10, file = "../res/time_measur_matmul_4", status = 'new')
open(11, file = "../res/time_measur_matmul_8", status = 'new')
open(12, file = "../res/time_measur_matmul_16", status = 'new')

do k = 1,3 ! k=1 - real(kind=4), k=2 - real(kind=8), k=3 - real(kind=16),
    N = 10
    do i = 1,8 ! size of matrices

        select case (k)
            case (1)
                allocate (A4(N, N))
                allocate (B4(N, N))
                allocate (C4(N, N))
                CALL random_number(A4)
                CALL random_number(B4)
            case (2)
                allocate (A8(N, N))
                allocate (B8(N, N))
                allocate (C8(N, N))
                CALL random_number(A8)
                CALL random_number(B8)
            case (3)
                allocate (A16(N, N))
                allocate (B16(N, N))
                allocate (C16(N, N))
                CALL random_number(A16)
                CALL random_number(B16)
        end select

        ! naive multiplication
        call CPU_TIME(t1)
        select case (k)
            case (1)
                C4 = naivmull(A4, B4)
            case (2)
                C8 = naivmull(A8, B8)
            case (3)
                C16 = naivmull(A16, B16)
        end select
        call CPU_TIME(t2)
        write (*,*) N, t2 - t1
        select case (k)
            case (1)
                write (1,*) N, t2 - t1
            case (2)
                write (2,*) N, t2 - t1
            case (3)
                write (3,*) N, t2 - t1
        end select


        ! better multiplication
        call CPU_TIME(t1)
        select case (k)
            case (1)
                C4 = bettmull(A4, B4)
            case (2)
                C8 = bettmull(A8, B8)
            case (3)
                C16 = bettmull(A16, B16)
        end select
        call CPU_TIME(t2)
        write (*,*) N, t2 - t1
        select case (k)
            case (1)
                write (4,*) N, t2 - t1
            case (2)
                write (5,*) N, t2 - t1
            case (3)
                write (6,*) N, t2 - t1
        end select

        ! dot product multiplication
        call CPU_TIME(t1)
        select case (k)
            case (1)
                C4 = dotmull(A4, B4)
            case (2)
                C8 = dotmull(A8, B8)
            case (3)
                C16 = dotmull(A16, B16)
        end select
        call CPU_TIME(t2)
        write (*,*) N, t2 - t1
        select case (k)
            case (1)
                write (7,*) N, t2 - t1
            case (2)
                write (8,*) N, t2 - t1
            case (3)
                write (9,*) N, t2 - t1
        end select

        ! build-in matmul multiplication
        call CPU_TIME(t1)
        select case (k)
            case (1)
                C4 = matmul(A4, B4)
            case (2)
                C8 = matmul(A8, B8)
            case (3)
                C16 = matmul(A16, B16)
        end select
        call CPU_TIME(t2)
        write (*,*) N, t2 - t1
        select case (k)
            case (1)
                write (10,*) N, t2 - t1
            case (2)
                write (11,*) N, t2 - t1
            case (3)
                write (12,*) N, t2 - t1
        end select

        write(*,*)

        select case (k)
            case (1)
                if(allocated(A4)) deallocate(A4)
                if(allocated(B4)) deallocate(B4)
                if(allocated(C4)) deallocate(C4)
            case (2)
                if(allocated(A8)) deallocate(A8)
                if(allocated(B8)) deallocate(B8)
                if(allocated(C8)) deallocate(C8)
            case (3)
                if(allocated(A16)) deallocate(A16)
                if(allocated(B16)) deallocate(B16)
                if(allocated(C16)) deallocate(C16)
        end select

        N = N * 2
    end do
end do

do i=1,12
    close(i)
end do

end program
