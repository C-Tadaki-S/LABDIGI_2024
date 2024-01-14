`timescale 1ns / 1ns

module contador74163_tb;
    reg CLR_1, CLK_2, A_3, B_4, C_5, D_6, ENP_7, GND_8, LD_9, ENT_10, VDD_16;
    wire Q_11, Q_12, Q_13, Q_14, RCO_15;

    // Instanciando o módulo contador74163
    contador74163 uut (
        .CLR_1(CLR_1), .CLK_2(CLK_2), .A_3(A_3), .B_4(B_4), .C_5(C_5), .D_6(D_6), .ENP_7(ENP_7),
        .GND_8(GND_8), .LD_9(LD_9), .ENT_10(ENT_10), .Q_11(Q_11), .Q_12(Q_12), .Q_13(Q_13), .Q_14(Q_14), .RCO_15(RCO_15), .VDD_16(VDD_16)
    );

    initial begin
        // Inicializando as entradas
        CLR_1 = 1; CLK_2 = 0; A_3 = 0; B_4 = 0; C_5 = 0; D_6 = 0; ENP_7 = 0; GND_8 = 0; LD_9 = 1; ENT_10 = 0; VDD_16 = 1;

        // Teste 1: Zerar Saída Q
        #10 CLR_1 = 0; CLK_2 = 1; 
        #10 if ({Q_14, Q_13, Q_12, Q_11} === 4'b0000) $display("Teste 1 passou."); else $display("Teste 1 falhou.");
        #10 CLR_1 = 1; CLK_2 = 0;

        // Teste 2: Contagem de 0 a 5
        #10 ENP_7 = 1; ENT_10 = 1;
        #10 CLK_2 = 1; #10 CLK_2 = 0;  // 1º ciclo de clock
        #10 CLK_2 = 1; #10 CLK_2 = 0;  // 2º ciclo de clock
        #10 CLK_2 = 1; #10 CLK_2 = 0;  // 3º ciclo de clock
        #10 CLK_2 = 1; #10 CLK_2 = 0;  // 4º ciclo de clock
        #10 CLK_2 = 1; #10 CLK_2 = 0;  // 5º ciclo de clock
        #10 if ({Q_11, Q_12, Q_13, Q_14} === 4'b0101) $display("Teste 2 passou."); else $display("Teste 2 falhou Q: %b%b%b%b, RCO: %b", Q_11, Q_12, Q_13, Q_14, RCO_15);

        // Teste 3: Desativa ENT e aciona CLOCK 2 vezes
        #10 ENT_10 = 0;
        #10 CLK_2 = 1; #10 CLK_2 = 0;  // 1º ciclo de clock
        #10 CLK_2 = 1; #10 CLK_2 = 0;  // 2º ciclo de clock
        #10 if ({Q_11, Q_12, Q_13, Q_14} === 4'b0101) $display("Teste 3 passou."); else $display("Teste 3 falhou.");

        // Teste 4: Contar mais 10 vezes
        #10 ENT_10 = 1;
        #10 CLK_2 = 1; #10 CLK_2 = 0;  // 1º ciclo de clock
        #10 CLK_2 = 1; #10 CLK_2 = 0;  // 2º ciclo de clock
        #10 CLK_2 = 1; #10 CLK_2 = 0;  // 3º ciclo de clock
        #10 CLK_2 = 1; #10 CLK_2 = 0;  // 4º ciclo de clock
        #10 CLK_2 = 1; #10 CLK_2 = 0;  // 5º ciclo de clock
        #10 CLK_2 = 1; #10 CLK_2 = 0;  // 6º ciclo de clock
        #10 CLK_2 = 1; #10 CLK_2 = 0;  // 7º ciclo de clock
        #10 CLK_2 = 1; #10 CLK_2 = 0;  // 8º ciclo de clock
        #10 CLK_2 = 1; #10 CLK_2 = 0;  // 9º ciclo de clock
        #10 CLK_2 = 1; #10 CLK_2 = 0;  // 10º ciclo de clock
        #10 if ({Q_11, Q_12, Q_13, Q_14} === 4'b1111 && RCO_15 === 1'b1) $display("Teste 4 passou."); else $display("Teste 4 falhou.");

        // Teste 5: Desativar ENT
        #10 ENT_10 = 0;
        #10 if ({Q_11, Q_12, Q_13, Q_14} === 4'b1111 && RCO_15 === 1'b0) $display("Teste 5 passou."); else $display("Teste 5 falhou.");

        // Teste 6: Desativar ENT e acionar CLOCK 2 vezes
        #10 CLK_2 = 1; #10 CLK_2 = 0;  // 1º ciclo de clock
        #10 CLK_2 = 1; #10 CLK_2 = 0;  // 2º ciclo de clock
        #10 if ({Q_11, Q_12, Q_13, Q_14} === 4'b1111 && RCO_15 === 1'b0) $display("Teste 6 passou."); else $display("Teste 6 falhou.");

        // Teste 7: Ativar ENT, acionar CLR e acionar CLOCK 2 vezes
        #10 ENT_10 = 1; CLR_1 = 0;
        #10 CLK_2 = 1; #10 CLK_2 = 0;  // 1º ciclo de clock
        #10 CLK_2 = 1; #10 CLK_2 = 0;  // 2º ciclo de clock
        #10 $display("Teste 7 - Q: %b%b%b%b, RCO: %b", Q_11, Q_12, Q_13, Q_14, RCO_15);
        #10 CLR_1 = 1;
    end

    // Gerando o dump de ondas para visualização no GTKWave
    initial begin
        $dumpfile("contador74163_tb.vcd");
        $dumpvars(0, contador74163_tb);
    end
endmodule
