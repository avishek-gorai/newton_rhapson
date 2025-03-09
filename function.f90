! Function.f90 -- Newton_Rhapson.f90 uses this functions.
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

REAL FUNCTION f(n)
  IMPLICIT NONE 
  REAL, INTENT(IN) :: n

  f = n ** 3 - 4 * n - 9
END FUNCTION f

REAL FUNCTION derivative_of_f(n)
  IMPLICIT NONE 
  REAL, INTENT(IN) :: n

  derivative_of_f = 3 * n ** 2 - 4
END FUNCTION derivative_of_f

REAL FUNCTION second_derivative_of_f(n)
  IMPLICIT NONE 
  REAL, INTENT(IN) :: n

  second_derivative_of_f = 6 * n
END FUNCTION second_derivative_of_f

