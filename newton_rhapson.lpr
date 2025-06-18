PROGRAM newton_rhapson;

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

