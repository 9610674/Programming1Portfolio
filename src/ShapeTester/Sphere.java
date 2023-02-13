public class Sphere {
  // Variable
  private double r;


  public Sphere() {
    r = 0.0;
    
  }
  public void setR(double r) {
    this.r = r;
    
  }

  
  public double calcVol() {
    double vol = 4/3 * 3.14 * (Math. pow(r, 3));
    return vol;
}

      public double calcSurfArea() {
        double sa = 4 * 3.14 * ((Math. pow(r, 2)));
        return sa;
        
        
      }
  }
