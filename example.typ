#import "lib.typ": assignment, today_date, code

// Use the template
#show: assignment.with(
  course: [Example Course],
  title: [Assignment],
  author: [Max Mustermann],
  date: [#today_date("de")],
)

= Task 1

== a)
I don't know the answer...

== b)
Main.java
#code(line-numbers: true, border: true, lang: "java")[```
class main{
  public static void main(String[] args) {
    System.out.println("Hello World");
  }
}
```]
#pagebreak()



