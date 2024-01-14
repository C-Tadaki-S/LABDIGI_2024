`timescale 1ns / 1ns

module comparador7485_6_tb;
    // Declaração de variáveis
    reg valor_comparado_A3, valor_comparado_A2, valor_comparado_A1, valor_comparado_A0;
    reg valor_comparado_B3, valor_comparado_B2, valor_comparado_B1, valor_comparado_B0;
    reg entrada_A_maior_B, entrada_A_menor_B, entrada_A_igual_B;
    wire A_maior_que_B, A_menor_que_B, A_igual_a_B;

    // Instanciando o módulo
    comparador7485_6 uut (
        .valor_comparado_A3(valor_comparado_A3), .valor_comparado_A2(valor_comparado_A2), .valor_comparado_A1(valor_comparado_A1), .valor_comparado_A0(valor_comparado_A0),
        .valor_comparado_B3(valor_comparado_B3), .valor_comparado_B2(valor_comparado_B2), .valor_comparado_B1(valor_comparado_B1), .valor_comparado_B0(valor_comparado_B0),
        .entrada_A_maior_B(entrada_A_maior_B), .entrada_A_menor_B(entrada_A_menor_B), .entrada_A_igual_B(entrada_A_igual_B),
        .A_maior_que_B(A_maior_que_B), .A_menor_que_B(A_menor_que_B), .A_igual_a_B(A_igual_a_B)
    );

    initial begin
        // Inicializando as entradas
        valor_comparado_A3 = 0; valor_comparado_A2 = 0; valor_comparado_A1 = 0; valor_comparado_A0 = 0;
        valor_comparado_B3 = 0; valor_comparado_B2 = 0; valor_comparado_B1 = 0; valor_comparado_B0 = 0;
        entrada_A_maior_B = 0; entrada_A_menor_B = 0; entrada_A_igual_B = 1;

        // Teste: A maior que B
        #10 valor_comparado_A3 = 1; valor_comparado_A2 = 0; valor_comparado_A1 = 1; valor_comparado_A0 = 0;
        #10 valor_comparado_B3 = 0; valor_comparado_B2 = 1; valor_comparado_B1 = 0; valor_comparado_B0 = 1;
        #10 entrada_A_maior_B = 1; entrada_A_menor_B = 0; entrada_A_igual_B = 1;
        #10 if (A_maior_que_B == 1'b1 && A_menor_que_B == 1'b0 && A_igual_a_B == 1'b0) $display("Teste A maior que B: PASSOU");
            else $display("Teste A maior que B: FALHOU");

        // Teste: A menor que B
        #10 valor_comparado_A3 = 0; valor_comparado_A2 = 0; valor_comparado_A1 = 1; valor_comparado_A0 = 0;
        #10 valor_comparado_B3 = 1; valor_comparado_B2 = 1; valor_comparado_B1 = 0; valor_comparado_B0 = 1;
        #10 entrada_A_maior_B = 0; entrada_A_menor_B = 1; entrada_A_igual_B = 1;
        #10 if (A_maior_que_B == 1'b0 && A_menor_que_B == 1'b1 && A_igual_a_B == 1'b0) $display("Teste A menor que B: PASSOU");
            else $display("Teste A menor que B: FALHOU");

        // Teste: valor_comparado_A3 é 1
        #10 valor_comparado_A3 = 1; valor_comparado_A2 = 0; valor_comparado_A1 = 0; valor_comparado_A0 = 0;
        #10 valor_comparado_B3 = 0; valor_comparado_B2 = 0; valor_comparado_B1 = 0; valor_comparado_B0 = 0;
        #10 entrada_A_maior_B = 1; entrada_A_menor_B = 0; entrada_A_igual_B = 1;
        #10 if (A_maior_que_B == 1'b1 && A_menor_que_B == 1'b0 && A_igual_a_B == 1'b0) $display("Teste valor_comparado_A3 é 1: PASSOU");
            else $display("Teste valor_comparado_A3 é 1: FALHOU");

        // Teste: Todas as entradas são iguais e entrada_A_maior_B, entrada_A_menor_B e entrada_A_igual_B são baixas
        #10 valor_comparado_A3 = 1; valor_comparado_A2 = 1; valor_comparado_A1 = 1; valor_comparado_A0 = 1;
        #10 valor_comparado_B3 = 1; valor_comparado_B2 = 1; valor_comparado_B1 = 1; valor_comparado_B0 = 1;
        #10 entrada_A_maior_B = 0; entrada_A_menor_B = 0; entrada_A_igual_B = 0;
        #10 if (A_maior_que_B == 1'b1 && A_menor_que_B == 1'b1 && A_igual_a_B == 1'b0) $display("Teste Todas as entradas são iguais e entrada_A_maior_B, entrada_A_menor_B e entrada_A_igual_B são baixas: PASSOU");
            else $display("Teste Todas as entradas são iguais e entrada_A_maior_B, entrada_A_menor_B e entrada_A_igual_B são baixas: FALHOU");

        // Teste: Todas as entradas são iguais e entrada_A_maior_B, entrada_A_menor_B e entrada_A_igual_B são altas
        #10 valor_comparado_A3 = 1; valor_comparado_A2 = 1; valor_comparado_A1 = 1; valor_comparado_A0 = 1;
        #10 valor_comparado_B3 = 1; valor_comparado_B2 = 1; valor_comparado_B1 = 1; valor_comparado_B0 = 1;
        #10 entrada_A_maior_B = 1; entrada_A_menor_B = 1; entrada_A_igual_B = 1;
        #10 if (A_maior_que_B == 1'b0 && A_menor_que_B == 1'b0 && A_igual_a_B == 1'b0) $display("Teste Todas as entradas são iguais e entrada_A_maior_B, entrada_A_menor_B e entrada_A_igual_B são altas: PASSOU");
            else $display("Teste Todas as entradas são iguais e entrada_A_maior_B, entrada_A_menor_B e entrada_A_igual_B são altas: FALHOU");
    end

    // Gerando o dump de ondas para visualização no GTKWave
    initial begin
        $dumpfile("testbench.vcd");
        $dumpvars(0, comparador7485_6_tb);
    end
endmodule

