boolean keyboard = false;

String num1_1 = "";
String num1_2 = "";
String num2_1 = "";
String num2_2 = "";
int check = 1;
int mode1 = 1;
int mode2 = 2;
int oper = 1;
float result1_1;
float result1_2;
float result2_1;
float result2_2;
String result1 = "";
String result2 = "";
String status1 = "i";
String status2 = "i";

char temp;

void setup() {
  fullScreen();
  rectMode(CORNERS);
}

void draw() {
  background(255);
  rect(width/10, height/4, width*4/15.0, height*3/8.0);
  rect(width*14/45.0, height/4, width*43/90.0, height*3/8.0);
  rect(width*47/90.0, height/4, width*31/45.0, height*3/8.0);
  rect(width*11/15.0, height/4, width*9/10.0, height*3/8.0);

  rect(width/4, height/8, width/4+50, height/8+50);
  rect(width-width/4-50, height/8, width-width/4, height/8+50);

  rect(width/4, height/2, width/4+50, height/2+30);
  rect(width*5/12.0-10, height/2, width*5/12.0-10+50, height/2+30);
  rect(width*7/12.0-20, height/2, width*7/12.0-20+50, height/2+30);
  rect(width*3/4.0-30, height/2, width*3/4.0+20, height/2+30);
  fill(0);
  if (mode1 == 1) {
    status1 = "i";
  } else {
    status1 = "∠";
  }
  if (mode2 == 2) {
    status2 = "i";
  } else {
    status2 = "∠";
  }
  textSize(width/30.0);
  text(status1, width/4+10, height/8+30);
  text(status2, width-width/4-50+10, height/8+30);
  text("+", width/4+15, height/2+15);
  text("-", width*5/12.0+5, height/2+15);
  text("×", width*7/12.0-5, height/2+15);
  text("÷", width*3/4.0-15, height/2+15);
  text(num1_1, width/10, height*3/8.0-20);
  text(num1_2, width*14/45.0+2, height*3/8.0-20);
  text(num2_1, width*47/90.0+2, height*3/8.0-20);
  text(num2_2, width*11/15.0+2, height*3/8.0-20);
  text(result1, 30, height*3/4.0);
  text(result2, width/2, height*3/4.0);
  fill(255);
}

public void calcu() {
  float f1_1, f1_2, f2_1, f2_2;
  f1_1 = float(num1_1);
  f1_2 = float(num1_2);
  f2_1 = float(num2_1);
  f2_2 = float(num2_2);
  if (Float.isNaN(f1_1) || Float.isNaN(f1_2)|| Float.isNaN(f2_1)|| Float.isNaN(f2_2)) {
    text("You had typed something wrong!", width/2, height);
  }
  if (mode1 == -1) {
    float temp1 = f1_1 * cos(radians(f1_2));
    float temp2 = f1_1 * sin(radians(f1_2));
    f1_1 = temp1;
    f1_2 = temp2;
  }
  if (mode2 == -2) {
    float temp1 = f2_1 * cos(radians(f2_2));
    float temp2 = f2_1 * sin(radians(f2_2));
    f2_1 = temp1;
    f2_2 = temp2;
  }
  println(f1_1+" + i "+f1_2);
  println(f2_1+" + i "+f2_2);
  if (oper == 1) {
    result1_1 = f1_1 + f2_1;
    result1_2 = f1_2 + f2_2;
    result2_1 = sqrt(sq(result1_1) + sq(result1_2));
    result2_2 = degrees(atan(result1_2 / result1_1));
  }
  if (oper == 2) {
    result1_1 = f1_1 - f2_1;
    result1_2 = f1_2 - f2_2;
    result2_1 = sqrt(sq(result1_1) + sq(result1_2));
    result2_2 = degrees(atan(result1_2 / result1_1));
  }
  if (oper == 3) {
    result1_1 = f1_1*f2_1 - f1_2*f2_2;
    result1_2 = f1_1*f2_2 + f1_2*f2_1;
    result2_1 = sqrt(sq(result1_1) + sq(result1_2));
    result2_2 = degrees(atan(result1_2 / result1_1));
  }
  if (oper == 4) {
    float arc1_1 = sqrt(sq(f1_1) + sq(f1_2));
    float arc1_2 = atan(f1_2/f1_1);
    float arc2_1 = sqrt(sq(f2_1) + sq(f2_2));
    float arc2_2 = atan(f2_2/f2_1);
    result2_1 = arc1_1/arc2_1;
    result2_2 = arc1_2-arc2_2;
    result1_1 = result2_1 * cos(result2_2);
    result1_2 = result2_1 * sin(result2_2);
    result2_2 = degrees(arc1_2-arc2_2);
  }
  result1_1 = round(result1_1*1000)/1000.0;
  result1_2 = round(result1_2*1000)/1000.0;
  result2_1 = round(result2_1*1000)/1000.0;
  result2_2 = round(result2_2*1000)/1000.0;
  result1 = str(result1_1) + " + i " + result1_2;
  result2 = str(result2_1) + " ∠ " + result2_2;
  println(result1);
  println(result2);
}

void keyPressed() {
  if (check == 1) {
    num1_1 = input(num1_1);
  } else if (check == 2) {
    num1_2 = input(num1_2);
  } else if (check == 3) {
    num2_1 = input(num2_1);
  } else if (check == 4) {
    num2_2 = input(num2_2);
  }
}

String input(String temp) {
  if (keyCode == 67) {
    temp = subit(temp);
  } else {
    temp = temp + key;
  }
  return temp;
}

String subit(String str) {
  if (str != null && str.length() > 0) {
    str = str.substring(0, str.length() - 1);
  }
  return str;
}

void mousePressed() {
  if (mouseX >= width/10 && mouseY >= height/4 && mouseX <= width*4/15.0 && mouseY <= height*3/8.0) {
    check = 1;
    println(check);
    openKeyboard();
  } else if (mouseX >= width*14/45.0 && mouseY >= height/4 && mouseX <= width*43/90.0 && mouseY <= height*3/8.0) {
    check = 2;
    println(check);
    openKeyboard();
  } else if (mouseX >= width*47/90.0 && mouseY >= height/4 && mouseX <= width*31/45.0 && mouseY <= height*3/8.0) {
    check = 3;
    println(check);
    openKeyboard();
  } else if (mouseX >= width*11/15.0 && mouseY >= height/4 && mouseX <= width*9/10.0 && mouseY <= height*3/8.0) {
    check = 4;
    println(check);
    openKeyboard();
  } else if (mouseX >= width/4 && mouseY >= height/8 && mouseX <= width/4+50 && mouseY <= height/8+50) {
    mode1 = -mode1;
    println(mode1);
  } else if (mouseX >= width-width/4-50 && mouseY >= height/8 && mouseX <= width-width/4 && mouseY <= height/8+50) {
    mode2 = -mode2;
    println(mode2);
  } else if (mouseX >= width/4 && mouseY >= height/2 && mouseX <= width/4+50 && mouseY <= height/2+30) {
    oper = 1;
    calcu();
  } else if (mouseX >= width*5/12.0-10 && mouseY >= height/2 && mouseX <= width*5/12.0-10+50 && mouseY <= height/2+30) {
    oper = 2;
    calcu();
  } else if (mouseX >= width*7/12.0-20 && mouseY >= height/2 && mouseX <= width*7/12.0-20+50 && mouseY <= height/2+30) {
    oper = 3;
    calcu();
  } else if (mouseX >= width*3/4.0-30 && mouseY >= height/2 && mouseX <= width*3/4.0+20 && mouseY <= height/2+30) {
    oper = 4;
    calcu();
  } else {
    closeKeyboard();
  }
}
