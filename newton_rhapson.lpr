PROGRAM newton_rhapson;
(*
 Copyright (C) 2025 Avishek Gorai <avishekgorai@myyahoo.com>

 This program is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.

 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with this program.  If not, see <https://www.gnu.org/licenses/>.
 *)

USES
    Sysutils,
    given_function;

CONST
    tolerance = 1.0E-6;

VAR
    x, new_x, initial_guess : real;
    accurate                : boolean;

FUNCTION converges(initial_guess          : real;
                   f                      : real_function;
                   derivative_of_f        : real_function;
                   second_derivative_of_f : real_function) : boolean;

BEGIN
    converges := abs(f(initial_guess) * second_derivative_of_f(initial_guess)) < sqr(derivative_of_f(initial_guess))
END;

BEGIN
    writeln('Enter initial guess: ');
    read(initial_guess);

    IF NOT converges(initial_guess, @f, @derivative_of_f, @second_derivative_of_f) THEN
      BEGIN
        writeln('The function will not converge for initial x = ', initial_guess)
      END
    ELSE
      BEGIN
        x := initial_guess;
        accurate := false;
        WHILE NOT accurate DO
        BEGIN
            new_x := x - f(x) / derivative_of_f(x);
            IF abs(new_x - x) < tolerance THEN
              BEGIN
                accurate := true;
              END
            ELSE
              BEGIN
                x := new_x
              END
        END;

        writeln(new_x)
      END;
END.
