module dotmath
    implicit none

    interface dotmull
        module function dotmull4 (A, B) result (C)
            real (kind=4), intent(in), dimension(:,:) :: A, B
            real (kind=4), dimension(size(A(:,1)), size(B(1,:))) :: C
        end function

        module  function dotmull8 (A, B) result (C)
            real (kind=8), intent(in), dimension(:,:) :: A, B
            real (kind=8), dimension(size(A(:,1)), size(B(1,:))) :: C
        end function

        module function dotmull16 (A, B) result (C)
            real (kind=16), intent(in), dimension(:,:) :: A, B
            real (kind=16), dimension(size(A(:,1)), size(B(1,:))) :: C
        end function
    end interface

contains

   module function dotmull4 (A, B) result(C)
        implicit none
        real (kind=4), intent(in), dimension(:,:) :: A, B
        real (kind=4), dimension(size(A(:,1)), size(B(1,:))) :: C
        integer :: i, j, k
        C = 0

        do j = 1, size(A(1,:))
            do i = 1, size(A(:,1))
                C(i,j) = dot_product(A(i,:), B(:,j))
            end do
        end do
    end function

    module function dotmull8 (A, B) result(C)
        implicit none
        real (kind=8), intent(in), dimension(:,:) :: A, B
        real (kind=8), dimension(size(A(:,1)), size(B(1,:))) :: C
        integer :: i, j, k
        C = 0

        do j = 1, size(A(1,:))
            do i = 1, size(A(:,1))
                C(i,j) = dot_product(A(i,:), B(:,j))
            end do
        end do
    end function

    module function dotmull16 (A, B) result(C)
        implicit none
        real (kind=16), intent(in), dimension(:,:) :: A, B
        real (kind=16), dimension(size(A(:,1)), size(B(1,:))) :: C
        integer :: i, j, k
        C = 0

        do j = 1, size(A(1,:))
            do i = 1, size(A(:,1))
                C(i,j) = dot_product(A(i,:), B(:,j))
            end do
        end do
    end function

end module
