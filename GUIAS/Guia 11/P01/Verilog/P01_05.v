// Módulo XOR
module xor_gate(input a, input b, output y);
  assign y = a ^ b; // XOR
endmodule

// Módulo NOR
module nor_gate(input a, input b, output y);
  assign y = ~(a | b); // NOR
endmodule

// Módulo NAND
module nand_gate(input a, input b, output y);
  assign y = ~(a & b); // NAND
endmodule

// Módulo principal que combina as portas
module top_module(input a, input b, output y);
  wire xor_out, nor_out;

  // Instanciando o módulo XOR
  xor_gate xor1(a, b, xor_out); // XOR(a, b)

  // Instanciando o módulo NOR
  nor_gate nor1(~a, ~b, nor_out); // NOR(NOT(a), NOT(b))

  // Instanciando o módulo NAND
  nand_gate nand1(xor_out, nor_out, y); // NAND(xor_out, nor_out)
endmodule

// Testbench para imprimir a tabela verdade
module testbench;
  reg a, b;        // Entradas como registros
  wire y;         // Saída

  // Instanciando o módulo principal
  top_module my_function(a, b, y);

  initial begin
    // Impressão do cabeçalho
    $display(" a | b | y ");
    $display("----------");
    
    // Testando todas as combinações de a e b
    {a, b} = 2'b00; #1; $display(" %b | %b | %b ", a, b, y);
    {a, b} = 2'b01; #1; $display(" %b | %b | %b ", a, b, y);
    {a, b} = 2'b10; #1; $display(" %b | %b | %b ", a, b, y);
    {a, b} = 2'b11; #1; $display(" %b | %b | %b ", a, b, y);

    // Finalizando a simulação
    $finish;
  end
endmodule
