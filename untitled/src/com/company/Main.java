package com.company;

import java.util.Scanner;

public class Main {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Enter the even number");
        int n = Integer.parseInt(scanner.nextLine());
        for (int i = 0; i < n / 2; i++) {
            for (int j = 0; j < i; j++) {
                System.out.print(" ");
            }
            for (int j = n/2; j >i ; j--) {
                System.out.print("*");
            }
            for (int j = n/2; j >i ; j--) {
                System.out.print("*");
            }
            System.out.println();
        }
        for (int i = 0; i <n/2 ; i++) {
            for (int j = (n/2)-1; j >i ; j--) {
                System.out.print(" ");
            }
            for (int j = 0; j <=i ; j++) {
                System.out.print("*");
            }
            for (int j = 0; j <=i ; j++) {
                System.out.print("*");
            }
            System.out.println();
        }
    }
}
