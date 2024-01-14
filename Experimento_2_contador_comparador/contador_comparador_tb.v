`timescale 1ns / 1ps

module contador_comparador_tb;
    reg CLK, CLR, ENP, LD;
    reg A_3, B_4, C_5, D_6;
    reg B_3, B_2, B_1, B_0;
    wire A_maior_que_B, A_menor_que_B, A_igual_a_B, RCO;

    // Instanciando o módulo contador_comparador
    contador_comparador uut (
        .CLK(CLK), .CLR(CLR), .ENP(ENP), .LD(LD),
        .A_3(A_3), .B_4(B_4), .C_5(C_5), .D_6(D_6),
        .B_3(B_3), .B_2(B_2), .B_1(B_1), .B_0(B_0),
        .A_maior_que_B(A_maior_que_B), .A_menor_que_B(A_menor_que_B), .A_igual_a_B(A_igual_a_B), .RCO(RCO)
    );

    initial begin
        // Inicializando as entradas
        CLK = 0; CLR = 1; ENP = 0; LD = 1;
        A_3 = 0; B_4 = 0; C_5 = 0; D_6 = 0;
        B_3 = 0; B_2 = 0; B_1 = 0; B_0 = 0;

        // Teste 1: Zerar saída do contador e ajustar DADO=0000
        #10 CLR = 0; CLK = 1; 
        #10 if ({A_maior_que_B, A_menor_que_B, A_igual_a_B} === 3'b001) $display("Teste 1 passou."); else $display("Teste 1 falhou.");
        #10 CLR = 1; CLK = 0;

        // Teste 2: Contagem de 0 a 5
        #10 ENP = 1; LD = 1;
        #10 CLK = 1; #10 CLK = 0;  // 1º ciclo de clock
        #10 CLK = 1; #10 CLK = 0;  // 2º ciclo de clock
        #10 CLK = 1; #10 CLK = 0;  // 3º ciclo de clock
        #10 CLK = 1; #10 CLK = 0;  // 4º ciclo de clock
        #10 CLK = 1; #10 CLK = 0;  // 5º ciclo de clock
        #10 if ({A_maior_que_B, A_menor_que_B, A_igual_a_B} === 3'b100) $display("Teste 2 passou."); else $display("Teste 2 falhou.");

        // Teste 3: Desativa ENP e aciona CLOCK 2 vezes
        #10 ENP = 0;
        #10 CLK = 1; #10 CLK = 0;  // 1º ciclo de clock
        #10 CLK = 1; #10 CLK = 0;  // 2º ciclo de clock
        #10 if ({A_maior_que_B, A_menor_que_B, A_igual_a_B} === 3'b100) $display("Teste 3 passou."); else $display("Teste 3 falhou.");

        // Teste 4: Contagem de 1 a 9 e DADO =1001 
        #10 ENP = 1; LD = 1; B_3 = 1; B_2 = 0; B_1 = 0; B_0 = 1;
        #10 CLK = 1; #10 CLK = 0;  // 1º ciclo de clock
        #10 CLK = 1; #10 CLK = 0;  // 2º ciclo de clock
        #10 CLK = 1; #10 CLK = 0;  // 3º ciclo de clock
        #10 CLK = 1; #10 CLK = 0;  // 4º ciclo de clock
        #10 CLK = 1; #10 CLK = 0;  // 5º ciclo de clock
        #10 CLK = 1; #10 CLK = 0;  // 6º ciclo de clock
        #10 CLK = 1; #10 CLK = 0;  // 7º ciclo de clock
        #10 CLK = 1; #10 CLK = 0;  // 8º ciclo de clock
        #10 CLK = 1; #10 CLK = 0;  // 9º ciclo de clock
        #10 $display("Teste 4 - A_maior_que_B: %b, A_menor_que_B: %b, A_igual_a_B: %b", A_maior_que_B, A_menor_que_B, A_igual_a_B);

        // Teste 5: Mudar para DADO =1111
        #10 LD = 0; B_3 = 1; B_2 = 1; B_1 = 1; B_0 = 1;
        #10 $display("Teste 5 - A_maior_que_B: %b, A_menor_que_B: %b, A_igual_a_B: %b", A_maior_que_B, A_menor_que_B, A_igual_a_B);
        #10 LD = 1;

        // Teste 6: Contar mais 6 vezes
        #10 ENP = 1;
        #10 CLK = 1; #10 CLK = 0;  // 1º ciclo de clock
        #10 CLK = 1; #10 CLK = 0;  // 2º ciclo de clock
        #10 CLK = 1; #10 CLK = 0;  // 3º ciclo de clock
        #10 CLK = 1; #10 CLK = 0;  // 4º ciclo de clock
        #10 CLK = 1; #10 CLK = 0;  // 5º ciclo de clock
        #10 CLK = 1; #10 CLK = 0;  // 6º ciclo de clock
        #10 $display("Teste 6 - A_maior_que_B: %b, A_menor_que_B: %b, A_igual_a_B: %b", A_maior_que_B, A_menor_que_B, A_igual_a_B);

        // Teste 7: Desativar ENT
        #10 ENP = 0;
        #10 $display("Teste 7 - A_maior_que_B: %b, A_menor_que_B: %b, A_igual_a_B: %b", A_maior_que_B, A_menor_que_B, A_igual_a_B);
    end

    // Gerando o dump de ondas para visualização no GTKWave
    initial begin
        $dumpfile("contador_comparador_tb.vcd");
        $dumpvars(0, contador_comparador_tb);
    end
endmodule

