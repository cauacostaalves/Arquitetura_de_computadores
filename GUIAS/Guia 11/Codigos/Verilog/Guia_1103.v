// ----------------
// --- Moore_1001
// ----------------
module Moore_1001 (
    output reg y,  // Saída indicando se a sequência foi encontrada
    input x,       // Entrada de dados (0 ou 1)
    input clk,     // Sinal de clock
    input reset    // Sinal de reset
);

    // Constantes para os estados
    parameter start  = 3'b000;
    parameter id1    = 3'b001;
    parameter id10   = 3'b010;
    parameter id100  = 3'b011;
    parameter id1001 = 3'b100;

    // Variáveis de estado
    reg [2:0] E1;  // Estado atual
    reg [2:0] E2;  // Próximo estado

    // Lógica da máquina de estados
    always @(posedge clk or negedge reset) begin
        if (reset == 1'b0) begin
            E1 <= start;
        end else begin
            E1 <= E2;
        end
    end

    // Lógica para determinar o próximo estado
    always @(E1 or x) begin
        case (E1)
            start: begin
                if (x == 1'b1) begin
                    E2 = id1;
                end else begin
                    E2 = start;
                end
            end
            id1: begin
                if (x == 1'b0) begin
                    E2 = id10;
                end else begin
                    E2 = start;
                end
            end
            id10: begin
                if (x == 1'b0) begin
                    E2 = id100;
                end else begin
                    E2 = start;
                end
            end
            id100: begin
                if (x == 1'b1) begin
                    E2 = id1001;
                end else begin
                    E2 = start;
                end
            end
            id1001: begin
                if (x == 1'b0) begin
                    E2 = id10;  // Permite interseção da sequência
                end else begin
                    E2 = id1;   // Continua buscando novas sequências
                end
            end
            default: begin
                E2 = start;
            end
        endcase
    end

    // Lógica de saída
    always @(E1) begin
        if (E1 == id1001) begin
            y = 1'b1; // Sequência "1001" encontrada
        end else begin
            y = 1'b0; // Sequência não encontrada
        end
    end
endmodule // Moore_1001

// ----------------
// --- Teste
// ----------------
module Guia_1103; 
    reg   clk, reset, x; 
    wire  m1; 

    Moore_1001 moore1 (m1, x, clk, reset); 

    initial begin
        $display ("Time     X   Moore"); 
        // Valores iniciais 
        clk   = 1; 
        reset = 0; 
        x     = 0; 

        // Mudança no sinal de entrada 
        #5   reset = 1; 
        #10  x = 1; 
        #10  x = 0; 
        #10  x = 0; 
        #10  x = 1; 
        #10  x = 0; 
        #10  x = 1; 
        #10  x = 0; 
        #10  x = 0; 
        #10  x = 1; 

        #30 $finish; 
    end // initial 

    always 
        #5 clk = ~clk; 

    always @(posedge clk) begin 
        $display ("%4d  %4b  %4b", $time, x, m1); 
    end // always at positive edge clocking changing 

endmodule // Guia_1103
