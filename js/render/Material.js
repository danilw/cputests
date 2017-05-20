Material.prototype.ambientWeight;
Material.prototype.ambientOcclusionPercent;
Material.prototype.diffuseWeight;
Material.prototype.specularWeight;
Material.prototype.reflectionWeight;
Material.prototype.shininess;
Material.prototype.diffuseColor;
Material.prototype.highlightColor;
Material.prototype.reflectionColor;


function Material(
        ambientWeight,
        ambientOcclusionPercent,
        diffuseWeight,
        specularWeight,
        reflectionWeight,
        shininess,
        diffuseColor,
        highlightColor,
        reflectionColor) {
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
