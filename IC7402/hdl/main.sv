module NAND
(
    output  wire  y_out,
    input   wire  a_in,
    input   wire  b_in
);
    assign y_out  = ~(a_in & b_in);
endmodule

module NOT
(
    output  wire  y_out,
    input   wire  a_in
);
    assign y_out  = ~a_in;
endmodule

module EXOR
(
    output  wire  y_out,
    input   wire  a_in,
    input   wire  b_in
);
    assign y_out  = a_in ^ b_in;
endmodule


module IC7402
(
    input   wire  pin_2,
    input   wire  pin_3,
    input   wire  pin_5,
    input   wire  pin_6,
    input   wire  pin_8,
    input   wire  pin_9,
    input   wire  pin_11,
    input   wire  pin_12,
    output  wire  pin_1,
    output  wire  pin_4,
    output  wire  pin_10,
    output  wire  pin_13
);
    wire   w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12;

    // assign pin_1  = ~(pin_2  | pin_3);
    // assign pin_4  = ~(pin_5  | pin_6);
    // assign pin_10 = ~(pin_8  | pin_9);
    // assign pin_13 = ~(pin_12 | pin_11);

    NOT  NOT_1  ( w1,    pin_2      );
    NOT  NOT_2  ( w2,    pin_3      );
    NAND NAND_1 ( w3,    w1,    w2  );
    NOT  NOT_3  ( pin_1, w3         );
    
    NOT  NOT_4  ( w4,    pin_5      );
    NOT  NOT_5  ( w5,    pin_6      );
    NAND NAND_2 ( w6,    w4,    w5  );
    NOT  NOT_6  ( pin_4, w6         );
    
    NOT  NOT_7  ( w7,    pin_8      );
    NOT  NOT_8  ( w8,    pin_9      );
    NAND NAND_3 ( w9,    w7,    w8  );
    NOT  NOT_9  ( pin_10,w9         );
    
    NOT  NOT_10 ( w10,    pin_11    );
    NOT  NOT_11 ( w11,    pin_12    );
    NAND NAND_4 ( w12,    w10,   w11);
    NOT  NOT_12 ( pin_13, w12       );
    
endmodule