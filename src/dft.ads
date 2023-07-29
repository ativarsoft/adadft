--  Copyright (C) 2023 Mateus de Lima Oliveira

package DFT is

   pragma Elaborate_Body;

   type Signal_Precision_Type is new Long_Float;

   type Signal_Type is array (Natural range <>) of Signal_Precision_Type;

   N : constant := 1024;

   function Spectrum
      (Signal : Signal_Type)
       return Signal_Type;


end DFT;
