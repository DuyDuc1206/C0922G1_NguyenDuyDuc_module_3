package controller;

import java.util.*;

public class Test {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("nhap n");
        int n = Integer.parseInt(scanner.nextLine());
        System.out.println("nhap m");
        int m = Integer.parseInt(scanner.nextLine());
        int[][] arr2 = new int[n][m];
        List<Integer> list = new ArrayList<>();

        for (int i = 0; i <n ; i++) {
            for (int j = 0; j <m ; j++) {
                arr2[i][j] = Integer.parseInt(scanner.nextLine());
            }
        }
        System.out.println("mang 2 chieu la:");
        System.out.println(Arrays.toString(arr2));

        for (int i = 0; i <n ; i++) {
            for (int j = 0; j <m ; j++) {
                if(ktsnt(arr2[i][j])){
                    list.add(arr2[i][j]);
                }
            }
        }
        list.sort(Comparator.naturalOrder());
        System.out.println(list);


    }
    public static boolean ktsnt(int x){
        if (x<2){
            return false;
        }
        for (int i = 2; i <=Math.sqrt(x) ; i++) {
            if (x%i == 0){
                return false;
            }
        }
        return true;
    }
}
