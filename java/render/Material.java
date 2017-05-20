public class Material {
  public double ambientWeight;
  public double ambientOcclusionPercent;
  public double diffuseWeight;
  public double specularWeight;
  public double reflectionWeight;  
  public double shininess;
  public double[] diffuseColor;
  public double[] highlightColor;
  public double[] reflectionColor;

  public Material(
      double ambientWeight,
      double ambientOcclusionPercent,
      double diffuseWeight,
      double specularWeight,
      double reflectionWeight,
      double shininess,
      double[] diffuseColor,
      double[] highlightColor,
      double[] reflectionColor) {
    this.ambientWeight = ambientWeight;
    this.ambientOcclusionPercent = ambientOcclusionPercent;
    this.diffuseWeight = diffuseWeight;
    this.specularWeight = specularWeight;
    this.reflectionWeight = reflectionWeight;
    this.shininess = shininess;
    this.diffuseColor = diffuseColor;
    this.highlightColor = highlightColor;
    this.reflectionColor = reflectionColor;    
  }
}
