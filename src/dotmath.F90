module dotmath
implicit none

contains

   function dotmull (A, B) result(C)
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

end module
