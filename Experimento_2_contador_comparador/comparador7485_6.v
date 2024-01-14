module comparador7485_6 (
    input valor_comparado_A3, valor_comparado_A2, valor_comparado_A1, valor_comparado_A0,
    input valor_comparado_B3, valor_comparado_B2, valor_comparado_B1, valor_comparado_B0,
    input entrada_A_maior_B, entrada_A_menor_B, entrada_A_igual_B,
    output A_maior_que_B, A_menor_que_B, A_igual_a_B
);
    /*fios intermediários para resultados envolvendo apenas o valor de a e de b sem considerar os bits de cascata*/
    wire a_maior_que_b, a_menor_que_b, a_igual_a_b;
    wire a3_igual_b3, a3_maior_b3, a3_menor_b3;
    wire a2_igual_b2, a2_maior_b2, a2_menor_b2;
    wire a1_igual_b1, a1_maior_b1, a1_menor_b1;
    wire a0_igual_b0, a0_maior_b0, a0_menor_b0;

    /*lógica de comparação de bits de forma respectiva*/
    assign a3_igual_b3 = (valor_comparado_A3 == valor_comparado_B3);
    assign a3_maior_b3 = (valor_comparado_A3 > valor_comparado_B3);
    assign a3_menor_b3 = (valor_comparado_A3 < valor_comparado_B3);

    assign a2_igual_b2 = (valor_comparado_A2 == valor_comparado_B2);
    assign a2_maior_b2 = (valor_comparado_A2 > valor_comparado_B2);
    assign a2_menor_b2 = (valor_comparado_A2 < valor_comparado_B2);

    assign a1_igual_b1 = (valor_comparado_A1 == valor_comparado_B1);
    assign a1_maior_b1 = (valor_comparado_A1 > valor_comparado_B1);
    assign a1_menor_b1 = (valor_comparado_A1 < valor_comparado_B1);

    assign a0_igual_b0 = (valor_comparado_A0 == valor_comparado_B0);
    assign a0_maior_b0 = (valor_comparado_A0 > valor_comparado_B0);
    assign a0_menor_b0 = (valor_comparado_A0 < valor_comparado_B0);
    
    assign a_maior_que_b = a3_maior_b3 | (a3_igual_b3 & a2_maior_b2) | (a3_igual_b3 & a2_igual_b2 & a1_maior_b1) | (a3_igual_b3 & a2_igual_b2 & a1_igual_b1 & a0_maior_b0);
    assign a_igual_a_b = a3_igual_b3 & a2_igual_b2 & a1_igual_b1 & a0_igual_b0;
    assign a_menor_que_b = ~(a_maior_que_b | a_igual_a_b);

    // Verifica se entrada_A_maior_B, entrada_A_menor_B e entrada_A_igual_B estão altos e todos os bits correspondentes de A e B são iguais
    wire erro = entrada_A_maior_B & entrada_A_menor_B & entrada_A_igual_B & a3_igual_b3 & a2_igual_b2 & a1_igual_b1 & a0_igual_b0;

    assign A_maior_que_B = erro ? 0 : (a_maior_que_b | (a_igual_a_b & ((entrada_A_maior_B & ~entrada_A_menor_B)) | a_igual_a_b & (~entrada_A_maior_B & ~entrada_A_menor_B & ~entrada_A_igual_B)));
    assign A_menor_que_B = erro ? 0 : (a_menor_que_b | (a_igual_a_b & ((entrada_A_menor_B & ~entrada_A_maior_B)) | a_igual_a_b & (~entrada_A_maior_B & ~entrada_A_menor_B & ~entrada_A_igual_B)));
    assign A_igual_a_B = erro ? 0 : (a_igual_a_b & entrada_A_igual_B);

endmodule
