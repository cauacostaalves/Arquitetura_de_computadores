// Módulo MUX
module mux(input a, input b, input chave, output y);
  assign y = (chave == 0) ? a : b; // MUX simples
endmodule

// Módulo principal
module top_module(input a, input b, input c, output y);
  wire mux1_out, mux2_out, not_a, not_b, not_c;

  // Negação das entradas
  not NOT_a(not_a, a);
  not NOT_b(not_b, b);
  not NOT_c(not_c, c);
  
  // Primeiro MUX
  mux mux1(b, a, c, mux1_out); // MUX(b, a, c)
  
  // Segundo MUX
  mux mux2(not_a, not_b, c, mux2_out); // MUX(NOT(a), NOT(b), c)

  // MUX final
  mux mux_final(mux1_out, mux2_out, not_c, y); // MUX(mux1_out, mux2_out, NOT(c))
endmodule

// Testbench para imprimir a tabela verdade
module testbench;
  reg a, b, c;        // Entradas como registros
  wire y;            // Saída

  // Instanciando o módulo principal
  top_module my_function(a, b, c, y);

  initial begin
    // Impressão do cabeçalho
    $display(" a | b | c | y ");
    $display("---------------");
    
    // Testando todas as combinações de a, b e c
    {a, b, c} = 3'b000; #1; $display(" %b | %b | %b | %b ", a, b, c, y);
    {a, b, c} = 3'b001; #1; $display(" %b | %b | %b | %b ", a, b, c, y);
    {a, b, c} = 3'b010; #1; $display(" %b | %b | %b | %b ", a, b, c, y);
    {a, b, c} = 3'b011; #1; $display(" %b | %b | %b | %b ", a, b, c, y);
    {a, b, c} = 3'b100; #1; $display(" %b | %b | %b | %b ", a, b, c, y);
    {a, b, c} = 3'b101; #1; $display(" %b | %b | %b | %b ", a, b, c, y);
    {a, b, c} = 3'b110; #1; $display(" %b | %b | %b | %b ", a, b, c, y);
    {a, b, c} = 3'b111; #1; $display(" %b | %b | %b | %b ", a, b, c, y);

    // Finalizando a simulação
    $finish;
  end
endmodule
