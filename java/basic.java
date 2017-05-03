public class basic {

    public static void main(String[] args) {
        long timetocalc = System.currentTimeMillis();
        char[] str=new char[50000];
        //String str = "";
        System.out.println("Start!!!");
        for (long i = 0; i < 50000000L; i++) {
            Math.sqrt((double) i);
            Math.pow((double) i, 2.56);
            long j = i * 745L;
            String string = new String(String.valueOf(i));
            string = string.concat(" kaka pipi"); // "Kaka pipi" is a kind of childly call in Dutch. 
            string = new String(string.toUpperCase());
            if (i % 300 == 0) {
                str = "".toCharArray();
            } else {
                str = (str+Long.toHexString(i)).toCharArray();
            }
        }
        timetocalc = System.currentTimeMillis() - timetocalc;
        System.out.println("timetocalc(msec): " + timetocalc);
    }

}
