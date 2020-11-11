program numbers
 use files
 implicit none
 integer, parameter :: n = 100
 integer :: i,isum,m
 real :: c(n)

 m = n
 isum = 0
 !$omp parallel do default(none) shared(m) &
 !$omp private(i) &
 !$omp reduction(+:isum)
 do i=1,m
    isum = isum + i
    !print*,i
 enddo
 !omp end parallel do

 print*,' sum of numbers = ',isum
 call write_array_to_file(c)

end program numbers
