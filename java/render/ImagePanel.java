import java.awt.*;
import javax.swing.*;
import java.awt.image.*;

public class ImagePanel extends JPanel {

  private BufferedImage image;

  public ImagePanel(BufferedImage image) {
    this.image = image;
    setPreferredSize(new Dimension(image.getWidth(), image.getHeight()));
  }

  @Override
  protected void paintComponent(Graphics g) {
    g.drawImage(image, 0, 0, this);
  }
}