with Ada.Numerics;
with Ada.Numerics.Generic_Elementary_Functions;

package body DFT is

   package Elementary_Functions is new
      Ada.Numerics.Generic_Elementary_Functions (Signal_Precision_Type);

   use Elementary_Functions;

   Pi : constant Signal_Precision_Type := Ada.Numerics.Pi;

   procedure Trace_DFT
      (Signal           : Signal_Type;
       Real_Output      : out Signal_Type;
       Imaginary_Output : out Signal_Type)
   is
      --  Output : Signal_Type (Signal'First .. Signal'Last);
      X, Re, Im : Signal_Precision_Type;
   begin
      for I in 0 .. N / 2 loop
         for J in 0 .. N loop
            X := 2.0 * Pi;
            X := X * Signal_Precision_Type (I);
            X := X * Signal_Precision_Type (J);
            X := X / Signal_Precision_Type (N);
            Re := Signal (J) * Cos (X);
            Im := Signal (J) * (-Sin (X));

            Real_Output (I) := Real_Output (I) + Re;
            Imaginary_Output (I) := Imaginary_Output (I) + Im;
         end loop;
      end loop;
   end Trace_DFT;

   procedure Spectrum
      (Signal : Signal_Type)
   is
   begin
      null;
   end Spectrum;
end DFT;

