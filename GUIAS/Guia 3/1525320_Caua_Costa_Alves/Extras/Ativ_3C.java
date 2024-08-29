public class Ativ_3C {
    

        // Função para converter binário para decimal
        public static int bin2dec(String bin) {
            return Integer.parseInt(bin, 2);
        }
    
        // Função para converter binário para hexadecimal
        public static String bin2hex(String bin) {
            int decimal = bin2dec(bin);
            return Integer.toHexString(decimal).toUpperCase();
        }
    
        public static void main(String[] args) {
            // a) 10110(2)
            String binA = "10110";
            int decA = bin2dec(binA);
            System.out.printf("10110(2) = %d (decimal)%n", decA);
    
            // b) 110011(2)
            String binB = "110011";
            int decB = bin2dec(binB);
            System.out.printf("110011(2) = %d (decimal)%n", decB);
    
            // c) 100100(2)
            String binC = "100100";
            System.out.printf("100100(2) = %s (binary)%n", binC);
    
            // d) 1011011(2)
            String binD = "1011011";
            System.out.printf("1011011(2) = %s (binary)%n", binD);
    
            // e) 1110011(2)
            String binE = "1110011";
            String hexE = bin2hex(binE);
            System.out.printf("1110011(2) = %s (hexadecimal)%n", hexE);
        }
    
    
}
