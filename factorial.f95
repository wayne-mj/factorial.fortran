program factorial
    implicit none
    integer(16) :: n, i
    integer :: ierr
    character(len=100) :: arg
    character(len=100) :: bigarse, bigarse2

    write(bigarse, '(I50)') huge(n)
    write(bigarse2, '(I50)') bit_size(n)    
    
    print *, "Factorial calculator"
    print *, "Largest number possible: ", trim(adjustl(bigarse)), " (", trim(adjustl(bigarse2)), " bits)"   
    print *, " "
    
    call get_command_argument(1, arg, STATUS=ierr)
    if (ierr .ne. 0) then
        print *, "Usage: factorial <n>"
        stop
    else
        read(arg, '(I10)', iostat=ierr) n
        if (ierr .ne. 0) then
            print *, "Must be an integer"
            stop
        end if

        if (n .lt. 0) then
            print *, "Must be non-negative"
            stop
        end if

        if (n .eq. 0) then
            print *, "0! = 1"
            stop
        else
            i = 1
            do i = 1, n-1
                n = n * i
            end do
            write(bigarse, '(I50)') n
            print *, "Result: ", trim(adjustl(bigarse))
        end if
    end if

end program factorial