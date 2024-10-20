
// -------------- 
// --- Mealy FSM 
// -------------- 
 
/* 
                        Mealy FSM Diagram 
                      ___________________ 
                    /                    \ 
              1    v     1           0  1 | // found 
   [start] ---> [id1] ---> [id11] ---> [id110] 
     ^  \0      0 |       1 /  ^        0 | // not found 
      \_/        /          \__/          | 
       \________/                         | 
        \                                 | 
         \________________________________/ 
*/ 
 
// constant definitions 
/* Matricula: 855926
Aluno; Cau~Cosr
`define found      1 
`define notfound 0 
 
// FSM by Mealy 
module mealy_1101 ( y, x, clk, reset ); 
 output y; 
 input   x; 
 input   clk; 
 input   reset; 
 
 reg      y; 
 
 parameter      // state identifiers  
   start    = 2'b00, 
   id1      = 2'b01, 
   id11    = 2'b11, 
   id110  = 2'b10; 
 
   reg [1:0] E1; // current state variables 
   reg [1:0] E2; // next state logic output 
 
// next state logic 
   always @( x or E1 ) 
    begin 
     y = `notfound; 
     case ( E1 ) 
      start: 
        if ( x ) 
         E2 = id1; 
        else 
         E2 = start; 
      id1: 
        if ( x ) 
         E2 = id11; 
        else 
         E2 = start; 
      id11: 
        if ( x ) 
         E2 = id11; 
        else 
         E2 = id110; 
      id110: 
        if ( x ) 
         begin 
           E2 =  id1; 
           y  = `found; 
         end 
        else 
         begin 
           E2 =  start; 
           y  = `notfound; 
         end 
      default:   // undefined state 
           E2 =  2'bxx; 
     endcase 
    end // always at signal or state changing 
 
// state variables 
   always @( posedge clk or negedge reset ) 
    begin 
     if ( reset ) 
      E1 = E2;    // updates current state 
     else 
      E1 = 0;     // reset 
    end // always at signal changing 
 
endmodule // mealy_1101

// Testbench para mealy_1101
module test_mealy_1101;

  // Definindo as variáveis para testar o módulo
  reg clk;
  reg reset;
  reg x;
  wire y;

  // Instanciando o módulo Mealy FSM
  mealy_1101 uut (
    .y(y),
    .x(x),
    .clk(clk),
    .reset(reset)
  );

  // Gerando o clock
  always #5 clk = ~clk;

  // Teste inicial
  initial begin
    // Exibindo os sinais no console
    $monitor("Tempo: %0d, Reset: %b, x: %b, y: %b", $time, reset, x, y);

    // Inicializando os sinais
    clk = 0;
    reset = 0;
    x = 0;

    // Aplicando reset
    #10 reset = 1;
    #10 reset = 0;

    // Sequência de teste
    // Aplicando sequência "1101" e outras variações
    #10 x = 1;  // Primeiro bit (1)
    #10 x = 1;  // Segundo bit (1)
    #10 x = 0;  // Terceiro bit (0)
    #10 x = 1;  // Quarto bit (1) -> Deve detectar a sequência e y = 1
    
    // Testando outra sequência inválida
    #10 x = 0;
    #10 x = 0;
    #10 x = 1;  // Apenas para ver a transição de estados

    // Finalizando a simulação
    #50 $finish;
  end

endmodule
