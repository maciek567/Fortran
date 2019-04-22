module dotmath
	implicit none
	private


contains
    function dotmull (A, B) result(C)
        implicit none
        real (kind=4), intent(in), dimension(:,:) :: A, B
    end function


end module
