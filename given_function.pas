UNIT given_function;
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

INTERFACE
    USES
        SysUtils;

    TYPE
        real_function = FUNCTION (x : real) : real;

    FUNCTION f(x : real) : real;

    FUNCTION derivative_of_f(x : real) : real;

    FUNCTION second_derivative_of_f(x : real) : real;

IMPLEMENTATION
    FUNCTION f(x : real) : real;

    BEGIN
        f := x - cos(x)
    END;

    FUNCTION derivative_of_f(x : real) : real;

    BEGIN
        derivative_of_f := 1 + sin(x)
    END;

    FUNCTION second_derivative_of_f(x : real) : real;

    BEGIN
        second_derivative_of_f := cos(x)
    END;
END.
