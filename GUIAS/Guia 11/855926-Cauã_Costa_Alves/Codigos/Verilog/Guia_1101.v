// constant definitions 
`define found    1 
`define notfound 0 

// ----------------
// --- FSM_1001
// ----------------
module FSM_1001 (
    output reg y, // Saída indicando se a sequência foi encontrada
    input x,      // Entrada de dados
    input clk,    // Clock
    input reset   // Sinal de reset
);

    // Definição dos estados
    parameter [1:0]
        start = 2'b00,
        id1    = 2'b01,
        id10   = 2'b10,
        id100  = 2'b11;

    // Variáveis de estado
    reg [1:0] E1;
    reg [1:0] E2;

    // Lógica para a saída y e para o próximo estado
    always @( x or E1 ) begin
        y = `notfound;
        case ( E1 )
            start: begin
                if ( x ) begin
                    E2 = id1;
                end else begin
                    E2 = start;
                end
            end
            id1: begin
                if ( ~x ) begin
                    E2 = id10;
                end else begin
                    E2 = start;
                end
            end
            id10: begin
                if ( ~x ) begin
                    E2 = id100;
                end else begin
                    E2 = start;
                end
            end
            id100: begin
                if ( x ) begin
                    E2 = start;
                    y = `found; // Indica que a sequência foi encontrada
                end else begin
                    E2 = start;
                end
            end
            default: begin
                E2 = start; // Estado indefinido
            end
        endcase
    end

    // Lógica para o próximo estado
    always @( posedge clk or negedge reset ) begin
        if ( reset ) begin
            E1 = E2; // Atualiza o estado
        end else begin
            E1 = 0; // Reinicia o estado
        end
    end
endmodule // FSM_1001
