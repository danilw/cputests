import java.awt.*;
import javax.swing.*;
import java.awt.image.*;

public class RenderFrame extends JFrame {

  private ImagePanel imagePanel;

  public RenderFrame(BufferedImage image) {
    setTitle("render");
    setContentPane(imagePanel = new ImagePanel(image));
    setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    setResizable(false);
    pack();
    setLocationRelativeTo(null);
    setVisible(true);
  }

  public void imageUpdated() {
    EventQueue.invokeLater(new Runnable() {
      @Override
      public void run() {
        imagePanel.repaint();
      }
    });
  }

  @Override
  public void setTitle(final String title) {
    EventQueue.invokeLater(new Runnable() {
      @Override
      public void run() {
        RenderFrame.super.setTitle(title);
      }
    });
  }
}
