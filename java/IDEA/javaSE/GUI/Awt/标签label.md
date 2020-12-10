## 标签

这里复习一下组合与内部类

### 组合

```java
package Com.Monarch.Awts.Label;

import Com.Monarch.Awts.Main.MyFrame;

import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class Calc {
    public static void main(String[] args) {
        new CalcFrame().loaFrame();
    }
}
class CalcFrame extends MyFrame{
    public TextField textField1, textField2, textField3;
    private Label label;
    private Button button, clear;

    public void loaFrame() {
        this.setTitle("简易计算器");
        this.loaText();
        this.loaButton();
        this.loaLabel();
        this.addAction();
        this.layoutText();
    }

    public void loaText(){
        textField1 = new TextField(10);
        textField2 = new TextField(10);
        textField3 = new TextField(20);
    }

    public void loaLabel(){
        label = new Label("+");
    }

    public void loaButton(){
        button = new Button("=");
        clear = new Button("clear");
    }

    public void addAction(){
        button.addActionListener(new CalcActonListener(this));
        clear.addActionListener(new CalcActonListener(this));
    }

    public void layoutText(){
        setLayout(new FlowLayout());
        add(textField1);
        add(label);
        add(textField2);
        add(button);
        add(textField3);
        add(clear);
        pack();
    }
}

class CalcActonListener implements ActionListener {
    // 类的组合
    private CalcFrame frame = null;
    @Override
    public void actionPerformed(ActionEvent e) {
        if (e.getActionCommand().equals("=")) {
            calculation();
        }else {
            clearText();
        }
    }

    public CalcActonListener(CalcFrame frame) {
        this.frame = frame;
    }
    private void clearText(){
        frame.textField1.setText("");
        frame.textField2.setText("");
        frame.textField3.setText("");
    }
    private void calculation(){
        int n1 = Integer.parseInt(frame.textField1.getText());
        int n2 = Integer.parseInt(frame.textField2.getText());
        frame.textField3.setText("" + (n1 + n2));
    }
}
```

### 内部类

```java
package Com.Monarch.Awts.Label;

import Com.Monarch.Awts.Main.MyFrame;

import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class Calc1 {
    public static void main(String[] args) {
        new CalcFrame1().loaFrame();
    }
}
class CalcFrame1 extends MyFrame{
    public TextField textField1, textField2, textField3;
    private Label label;
    private Button button, clear;

    public void loaFrame() {
        this.setTitle("简易计算器");
        this.loaText();
        this.loaButton();
        this.loaLabel();
        this.addAction();
        this.layoutText();
    }

    public void loaText(){
        textField1 = new TextField(10);
        textField2 = new TextField(10);
        textField3 = new TextField(20);
    }

    public void loaLabel(){
        label = new Label("+");
    }

    public void loaButton(){
        button = new Button("=");
        clear = new Button("clear");
    }

    public void addAction(){
        button.addActionListener(new CalcActonListener());
        clear.addActionListener(new CalcActonListener());
    }

    public void layoutText(){
        setLayout(new FlowLayout());
        add(textField1);
        add(label);
        add(textField2);
        add(button);
        add(textField3);
        add(clear);
        pack();
    }
    private void clearText(){
        textField1.setText("");
        textField2.setText("");
        textField3.setText("");
    }
    private void calculation(){
        int n1 = Integer.parseInt(textField1.getText());
        int n2 = Integer.parseInt(textField2.getText());
        textField3.setText("" + (n1 + n2));
    }
    class CalcActonListener implements ActionListener {
        @Override
        public void actionPerformed(ActionEvent e) {
            if (e.getActionCommand().equals("=")) {
                calculation();
            } else {
                clearText();
            }
        }
    }
}
```

### 结果

![image-20201206000814451](https://img2020.cnblogs.com/blog/2213660/202012/2213660-20201206000816606-2112234392.png)

- **Label** ：建立标签对象
- 普通方法是采用传参的方法使按钮事件作用到三个文本框，组合是采用直接传入类的方式进行事件监听，而内部类则是可以 **直接访问** 外部类的成员, **内部类** 才是真正的面向对象