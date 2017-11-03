package com.commons;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Random;


/**
 * @author lenovo
 */
public class Validation {
    public static final char[] CHARS = {'1','2','3','4','5','6','7','8','9','A','B','C',
            'D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'};
    Random random = new Random();

    public String getRandomString(){
        StringBuffer stringBuffer = new StringBuffer();
        for (int i = 1;i < 5;i++){
            stringBuffer.append(CHARS[random.nextInt(CHARS.length)]);
        }
        return stringBuffer.toString();
    }

    public Color getRandomColor(){
        return new Color(random.nextInt(255),random.nextInt(255),random.nextInt(255));
    }

    public Color getReverseColor(Color color){
        return new Color(255 - color.getRed(),255 - color.getGreen(),255 - color.getBlue());
    }

    String text = getRandomString();

    public String getText(){
        return text;
    }

    public BufferedImage getBufferImage(int width,int height){
        Color color = getRandomColor();
        Color reverse = getReverseColor(color);

        BufferedImage bufferedImage = new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
        Graphics2D graphics2D = bufferedImage.createGraphics();
        graphics2D.setFont(new Font(Font.SANS_SERIF,Font.BOLD,20));
        graphics2D.setColor(color);
        graphics2D.fillRect(0,0,width,height);
        graphics2D.setColor(reverse);
        graphics2D.drawString(getText(),10,22);
        for (int i = 0,n = random.nextInt(80);i < n;i++){
            graphics2D.drawRect(random.nextInt(width),random.nextInt(height),1,1);
        }
        return bufferedImage;
    }

    public void output(BufferedImage bufferedImage, OutputStream outputStream){
        try {
            ImageIO.write(bufferedImage,"JPEG",outputStream);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
