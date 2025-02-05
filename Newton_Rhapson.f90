! Newton_Rhapson.f90 -- Calculates the approximate solution of the given function in Function.f90
! Copyright (C) 2025 by Avishek Gorai <avishekgorai@myyahoo.com>

! This program is free software: you can redistribute it and/or modify
! it under the terms of the GNU General Public License as published by
! the Free Software Foundation, either version 3 of the License, or
! (at your option) any later version.

! This program is distributed in the hope that it will be useful,
! but WITHOUT ANY WARRANTY; without even the implied warranty of
! MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
! GNU General Public License for more details.

! You should have received a copy of the GNU General Public License
! along with this program.  If not, see <https://www.gnu.org/licenses/>.

PROGRAM newton_rhapson_method
  IMPLICIT NONE

  REAL, PARAMETER :: tolerance = epsilon(1.1) * 1.0E2

  INTEGER input_status, number_of_iterations
  REAL x, x_new
  LOGICAL converges

  ! Functions
  REAL f, derivative_of_f, second_derivative_of_f

    PRINT *, "Copyright (C) 2025 Avishek Gorai <avishekgorai@myyahoo.com>"

    PRINT "(A1, A)", "0", "This program is free software: you can redistribute it and/or modify " // &
         "it under the terms of the GNU General Public License as published by " // &
         "the Free Software Foundation, either version 3 of the License, or " // &
         "(at your option) any later version."

    PRINT "(A1, A)", "0", "This program is distributed in the hope that it will be useful, " // &
         "but WITHOUT ANY WARRANTY; without even the implied warranty of " // &
         "MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the " // &
         "GNU General Public License for more details."

    PRINT "(A1, A)", "0", "You should have received a copy of the GNU General Public License " // &
         "along with this program.  If not, see <https://www.gnu.org/licenses/>."
       
  input_loop: DO
     PRINT "(A1, A)", "0", "Enter guess:-"
     READ (*, *, iostat = input_status) x
     
     IF (input_status /= 0) THEN
        PRINT "(A1, A)", "0", "Incorrect input!"
     ELSE IF (input_status == -1) THEN
        PRINT "(A1, A)", "0", "Bye!"
        EXIT
     ELSE
        converges = (f(x) * second_derivative_of_f(x)) < (derivative_of_f(x) ** 2)
        IF (converges) THEN
           number_of_iterations = 0
           DO
              x_new = x - derivative_of_f(x) / f(x)

              IF (abs(x_new - x) < tolerance) THEN
                 EXIT
              ELSE
                 x = x_new
                 number_of_iterations = number_of_iterations + 1
              END IF
           END DO
           PRINT "('0Number of ierations = ', I10)", number_of_iterations
           PRINT *, "x = ", x_new
           EXIT
        ELSE
           PRINT *, "The series will not converge for initial x = ", x
           CYCLE
        END IF
     END IF
  END DO input_loop 
END PROGRAM newton_rhapson_method
