public class Ativ_4C {
    

        // Função para avaliar operações em diferentes bases
        public static int baseEval(String x, String op, String y, int base) {
            int numX = Integer.parseInt(x, base);
            int numY = Integer.parseInt(y, base);
            
            switch (op) {
                case "-":
                    return numX - numY;
                default:
                    throw new IllegalArgumentException("Operador não suportado");
            }
        }
    
        public static void main(String[] args) {
            // a) 11001(2) - 1101(2)
            String binA = "11001";
            String binB = "01101";
            int resultA = baseEval(binA, "-", binB, 2);
            System.out.printf("11001(2) - 1101(2) = %s (2) = %d (decimal)%n", Integer.toBinaryString(resultA), resultA);
            
            // b) 101,1101(2) - 10,01(2)
            // Note: A vírgula é ignorada na operação binária, resultando em 1011101 - 1001 = 1010100
            String binC = "1011101";
            String binD = "0100100";
            int resultB = baseEval(binC, "-", binD, 2);
            System.out.printf("1011101(2) - 1001(2) = %s (2) = %d (decimal)%n", Integer.toBinaryString(resultB), resultB);
            
            // c) 312(4) - 231(4)
            // Convertendo base 4 para decimal
            int resultC = baseEval("312", "-", "231", 4);
            System.out.printf("312(4) - 231(4) = %s (4) = %d (decimal)%n", Integer.toString(resultC, 4), resultC);
            
            // d) 376(8) - 267(8)
            // Convertendo base 8 para decimal
            int resultD = baseEval("376", "-", "267", 8);
            System.out.printf("376(8) - 267(8) = %s (8) = %d (decimal)%n", Integer.toString(resultD, 8), resultD);
            
            // e) 7D2(16) - A51(16)
            // Convertendo base 16 para decimal
            int resultE = baseEval("7D2", "-", "A51", 16);
            System.out.printf("7D2(16) - A51(16) = %s (16) = %d (decimal)%n", Integer.toHexString(resultE).toUpperCase(), resultE);
        }
    
    
}
