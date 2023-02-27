import java.util.Scanner;

class Main {
  public static void main(String[] args) {
    Scanner scan = new Scanner(System.in);
    System.out.println("Enter a word to change it to PigLatin:");
    String word = scan.nextLine();
    char firstLetter = word.charAt(0);
    String restOfWord = word.substring(1);
    char ch = firstLetter;
    System.out.println(restOfWord.toLowerCase() + Character.toLowerCase(ch) + "ay");
    ch = firstLetter;
  }
}