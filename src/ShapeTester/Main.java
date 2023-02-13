// Isaac Williamson | Feb 8 2023 | Shape Tester
import java.util.Scanner;


class Main {
  public static void main(String[] args) {
    Scanner scan = new Scanner(System.in);
    Box b1 = new Box();
    //b1.l = 11.3;
    Sphere s1 = new Sphere();
    double val = 0.0;
    int sel = 0;
    Pyramid p1 = new Pyramid();
    

  System.out.println("Welcome to shape tester!");
  System.out.println("Press 1 for Box");
  System.out.println("Press 2 for Pyramid");
  System.out.println("Press 3 for Sphere");
  sel = scan.nextInt();

  if(sel == 1) {
    System.out.println("Enter Box Width");
  val = scan.nextInt();
  b1.setW(val);


  System.out.println("Enter Box Height:");
  val = scan.nextInt();
  b1.setH(val);

  System.out.println("Enter box Length:");
  val = scan.nextInt();
  b1.setL(val);

    

  System.out.println("Volume: " + b1.calcVol());
  System.out.println("Surface Area:" + b1.calcSurfArea());
    
  } else if(sel == 2) {
    System.out.println("Enter Pyramid Width");
  val = scan.nextInt();
  p1.setW(val);


  System.out.println("Enter Pyramid Height:");
  val = scan.nextInt();
  p1.setH(val);

    System.out.println("Enter Pyramid Length:");
  val = scan.nextInt();
  p1.setL(val);

  System.out.println("Volume: " + p1.calcVol());
  System.out.println("Surface Area:" + p1.calcSurfArea());
  } else if(sel == 3) {
    System.out.println("Enter Sphere Radius ");
    val = scan.nextInt();
    s1.setR(val);
    System.out.println("Volume: " + s1.calcVol());
    System.out.println("Surface Area:" + s1.calcSurfArea());
  }
  }

  
}
