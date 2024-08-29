public class Ativ_2C {
    

        public static int C1(int nbits, int x) {
            int maxValue = (1 << nbits) - 1;
            return maxValue - x;
        }
    
        public static int C2(int nbits, int x) {
            return C1(nbits, x) + 1;
        }
    
        public static String toBinaryString(int value, int nbits) {
            String binString = Integer.toBinaryString(value);
            while (binString.length() < nbits) {
                binString = "0" + binString;
            }
            return binString;
        }
    
        public static void main(String[] args) {
          
    
            // a.) C1,6 (321(4))
            int base4Value = 21; // 321(4) decimal
            System.out.println("321(4) in decimal: " + base4Value);
            int c1Value = C1(6, base4Value);
            int c2Value = C2(6, base4Value);
            System.out.printf("C1,6(321(4)) = %s\n", toBinaryString(c1Value, 6));
            System.out.printf("C2,6(321(4)) = %s\n", toBinaryString(c2Value, 6));
    
            // b.) C1,8 (B2(16))
            int base16Value = 178; // B2(16)  decimal
            System.out.println("B2(16) in decimal: " + base16Value);
            c1Value = C1(8, base16Value);
            c2Value = C2(8, base16Value);
            System.out.printf("C1,8(B2(16)) = %s\n", toBinaryString(c1Value, 8));
            System.out.printf("C2,8(B2(16)) = %s\n", toBinaryString(c2Value, 8));
    
            // c.) C2,6 (231(4))
            int base4Value2 = 39; // 231(4)  decimal
            System.out.println("231(4) in decimal: " + base4Value2);
            c1Value = C1(6, base4Value2);
            c2Value = C2(6, base4Value2);
            System.out.printf("C1,6(231(4)) = %s\n", toBinaryString(c1Value, 6));
            System.out.printf("C2,6(231(4)) = %s\n", toBinaryString(c2Value, 6));
    
            // d.) C2,10 (146(8))
            int base8Value = 102; // 146(8) in decimal
            System.out.println("146(8) in decimal: " + base8Value);
            c1Value = C1(10, base8Value);
            c2Value = C2(10, base8Value);
            System.out.printf("C2,10(146(8)) = %s\n", toBinaryString(c2Value, 10));
    
            // e.) C2,8 (6F(16))
            int base16Value2 = 111; // 6F(16)  decimal
            System.out.println("6F(16) in decimal: " + base16Value2);
            c1Value = C1(8, base16Value2);
            c2Value = C2(8, base16Value2);
            System.out.printf("C2,8(6F(16)) = %s\n", toBinaryString(c2Value, 8));
        }
}
