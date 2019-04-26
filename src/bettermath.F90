module bettermath
    implicit none

    interface bettmull
        module function bettmull4 (A, B) result (C)
            real (kind=4), intent(in), dimension(:,:) :: A, B
            real (kind=4), dimension(size(A(:,1)), size(B(1,:))) :: C
        end function

        module  function bettmull8 (A, B) result (C)
            real (kind=8), intent(in), dimension(:,:) :: A, B
            real (kind=8), dimension(size(A(:,1)), size(B(1,:))) :: C
        end function

        module function bettmull16 (A, B) result (C)
            real (kind=16), intent(in), dimension(:,:) :: A, B
            real (kind=16), dimension(size(A(:,1)), size(B(1,:))) :: C
        end function
    end interface

contains

    module function bettmull4 (A, B) result(C)
        implicit none
        real (kind=4), intent(in), dimension(:,:) :: A, B
        real (kind=4), dimension(size(A(:,1)), size(B(1,:))) :: C
        integer :: i, j, k
        C = 0

        do j=1,size(A(1,:))
            do k=1,size(A(1,:))
                do i=1,size(A(:,1))
                    C(i,j) = C(i,j) + A(i,k) * B(k,j)
                end do
            end do
        end do

    end function

    module function bettmull8 (A, B) result(C)
        implicit none
        real (kind=8), intent(in), dimension(:,:) :: A, B
        real (kind=8), dimension(size(A(:,1)), size(B(1,:))) :: C
        integer :: i, j, k
        C = 0

        do j=1,size(A(1,:))
            do k=1,size(A(1,:))
                do i=1,size(A(:,1))
                    C(i,j) = C(i,j) + A(i,k) * B(k,j)
                end do
            end do
        end do

    end function

    module function bettmull16 (A, B) result(C)
        implicit none
        real (kind=16), intent(in), dimension(:,:) :: A, B
        real (kind=16), dimension(size(A(:,1)), size(B(1,:))) :: C
        integer :: i, j, k
        C = 0

        do j=1,size(A(1,:))
            do k=1,size(A(1,:))
                do i=1,size(A(:,1))
                    C(i,j) = C(i,j) + A(i,k) * B(k,j)
                end do
            end do
        end do

    end function

end module
