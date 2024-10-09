// Módulo principal
module f (output s, input x, input y);
  wire w1, w2, w3, w4, w5;

  not NOT_1 (w1, x);      // w1 = NOT(x)
  not NOT_2 (w2, y);      // w2 = NOT(y)
  and AND_1 (w3, y, w1);  // w3 = y AND w1 (y AND NOT(x))
  or OR_1 (w4, w2, x);    // w4 = w2 OR x (NOT(y) OR x)
  not NOT_3 (w5, w4);     // w5 = NOT(w4)
  and AND_2 (s, w3, w5);  // s = w3 AND w5
endmodule

// Testbench para imprimir a tabela verdade
module testbench;
  reg x, y;        // Definindo entradas como registros
  wire s;         // Saída

  // Instanciando o módulo
  f my_function (s, x, y);

  initial begin
    // Impressão do cabeçalho
    $display(" x | y | s ");
    $display("------------");
    
    // Testando todas as combinações de x e y
    {x, y} = 2'b00; #1; $display(" %b | %b | %b ", x, y, s);
    {x, y} = 2'b01; #1; $display(" %b | %b | %b ", x, y, s);
    {x, y} = 2'b10; #1; $display(" %b | %b | %b ", x, y, s);
    {x, y} = 2'b11; #1; $display(" %b | %b | %b ", x, y, s);

    // Finalizando a simulação
    $finish;
  end
endmodule
