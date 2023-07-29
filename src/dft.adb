--  Copyright (C) 2023 Mateus de Lima Oliveira

with Ada.Numerics;
with Ada.Numerics.Generic_Elementary_Functions;

package body DFT is

   package Elementary_Functions is new
      Ada.Numerics.Generic_Elementary_Functions (Signal_Precision_Type);

   use Elementary_Functions;

   Pi : constant Signal_Precision_Type := Ada.Numerics.Pi;

   Half_N : constant := N / 2;

   function Spectrum
      (Signal : Signal_Type)
       return Signal_Type
   is

      Real_Output      : Signal_Type (Signal'First .. Signal'Last);
      Imaginary_Output : Signal_Type (Signal'First .. Signal'Last);

      X, Re, Im : Signal_Precision_Type;

      D : Signal_Precision_Type;

      Output_Decibels : Signal_Type (1 .. Half_N);

   begin
      for I in 0 .. Half_N - 1 loop
         for J in 0 .. N - 1 loop
            X := 2.0 * Pi;
            X := X * Signal_Precision_Type (I);
            X := X * Signal_Precision_Type (J);
            X := X / Signal_Precision_Type (N);
            Re := Signal (Signal'First + J) * Cos (X);
            Im := Signal (Signal'First + J) * (-Sin (X));

            Real_Output (I) :=
               Real_Output (Real_Output'First + I) + Re;
            Imaginary_Output (I) :=
               Imaginary_Output (Imaginary_Output'First + I) + Im;
         end loop;
      end loop;

      --  Convert to decibels
      for I in 0 .. Half_N - 1 loop
         D := Sqrt
            (Real_Output (Real_Output'First + I) *
             Real_Output (Real_Output'First + I) +
             Imaginary_Output (Imaginary_Output'First + I) *
             Imaginary_Output (Imaginary_Output'First + I));
         if D < 1.0 then
            D := 0.0;
         else
            D := 20.0 * Log (D);
         end if;
         Output_Decibels (I + 1) := Signal_Precision_Type'Min (D, 200.0);
      end loop;

      return Output_Decibels;
   end Spectrum;

end DFT;

