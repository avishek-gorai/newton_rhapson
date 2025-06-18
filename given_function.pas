UNIT given_function;

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

