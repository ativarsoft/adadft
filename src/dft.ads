package DFT is

   pragma Elaborate_Body;

   type Signal_Precision_Type is new Long_Float;

   type Signal_Type is array (Natural range <>) of Signal_Precision_Type;

   N : constant := 1024;

   procedure Trace_DFT
      (Signal           : Signal_Type;
       Real_Output      : out Signal_Type;
       Imaginary_Output : out Signal_Type);

   procedure Spectrum
      (Signal : Signal_Type);

end DFT;
