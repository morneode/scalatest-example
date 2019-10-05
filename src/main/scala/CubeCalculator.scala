object CubeCalculator extends App {
  def cube(x: Int) = {
    x * x * x
  }
  println(s"Cube = ${cube(2)}")
}