module naivemath
	implicit none


contains
    function naivmull (A, B) res(C)
        implicit none
        real (kind=4), intent(in), dimension(:,:) :: A, B
    end function


end module
