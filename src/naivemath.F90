module naivemath
	implicit none

contains

    function naivmull (A, B) result (C)
        implicit none
        real (kind=4), intent(in), dimension(:,:) :: A, B
        real (kind=4), dimension(size(A(:,1)), size(B(1,:))) :: C
        integer :: i, j, k
        C = 0

        do i=1,size(A(:,1))
            do j=1,size(B(1,:))
                do k=1,size(A(1,:))
                    C(i,j) = C(i,j) + A(i,k) * B(k,j)
                end do
            end do
        end do

    end function

end module
