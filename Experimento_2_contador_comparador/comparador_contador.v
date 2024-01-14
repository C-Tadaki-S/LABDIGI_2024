module contador_comparador (
    input CLK, CLR, ENP, LD,
    input A_3, B_4, C_5, D_6,
    input B_3, B_2, B_1, B_0,
    output A_maior_que_B, A_menor_que_B, A_igual_a_B, RCO
);

    /*A parte importante é entender o que será entrada fornecida e o que é saída que verificaremos:
        CONTADOR: CLK, CLR, ENP e LD são entradas fornecidas para o contador;
        os Q são saídas do contador -> e elas serão entradas no comparador;
        GND será terra, obviamente.
        os A,B,C,D serão entradas fornecidas também, que estarão no contador;
        VDD é nativamente alto, RCO é outra saída do contador e o ENT também é alta;

        COMNPARADOR: o valor A comparado será o valor de saída do contador;
        o valor B será um valor que forneceremos como entrada para o comparador;
        as entradas de cascateamento por enquanto ficarão nativamente como igual;
        A saída será conectada;
     */

    wire valor_comparado_A3, valor_comparado_A2, valor_comparado_A1, valor_comparado_A0;

    contador74163 contador (
        .CLR_1(CLR), .CLK_2(CLK), .A_3(A_3), .B_4(B_4), .C_5(C_5), .D_6(D_6), .ENP_7(ENP), .GND_8(1'b0), .LD_9(LD), .ENT_10(1'b1),
        .Q_11(valor_comparado_A3), .Q_12(valor_comparado_A2), .Q_13(valor_comparado_A1), .Q_14(valor_comparado_A0), .RCO_15(RCO), .VDD_16(1'b1)
    );

    comparador7485_6 comparador (
        .valor_comparado_A3(valor_comparado_A3), .valor_comparado_A2(valor_comparado_A2), .valor_comparado_A1(valor_comparado_A1), .valor_comparado_A0(valor_comparado_A0),
        .valor_comparado_B3(B_3), .valor_comparado_B2(B_2), .valor_comparado_B1(B_1), .valor_comparado_B0(B_0),
        .entrada_A_maior_B(1'b0), .entrada_A_menor_B(1'b0), .entrada_A_igual_B(1'b1),
        .A_maior_que_B(A_maior_que_B), .A_menor_que_B(A_menor_que_B), .A_igual_a_B(A_igual_a_B)
    );

endmodule
