module contador74163 (
    CLR_1, CLK_2, A_3, B_4, C_5, D_6, ENP_7, GND_8, LD_9, ENT_10, Q_11, Q_12, Q_13, Q_14, RCO_15, VDD_16
);
  input CLR_1, CLK_2, A_3, B_4, C_5, D_6, ENP_7, GND_8, LD_9, ENT_10, VDD_16;
  output Q_11, Q_12, Q_13, Q_14, RCO_15;


  reg [3:0] Q_11to14;


  assign Q_11 = Q_11to14[3];
  assign Q_12 = Q_11to14[2];
  assign Q_13 = Q_11to14[1];
  assign Q_14 = Q_11to14[0];


  assign RCO_15 = ENT_10 && (Q_11to14 == 4'b1111);


  always @(posedge CLK_2) begin
    case (CLR_1)
      1'b1: case (LD_9)
        1'b1: case (ENP_7)
          1'b1: case (ENT_10)
            1'b1: Q_11to14 <= Q_11to14 + 4'b0001;
            default: Q_11to14 <= Q_11to14;
          endcase
          default: Q_11to14 <= Q_11to14;
        endcase
       
        default: Q_11to14 <= {A_3, B_4, C_5, D_6};
      endcase
      default: Q_11to14 <= 4'b0000;
    endcase
  end
endmodule
