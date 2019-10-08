package sparkrdd

import org.apache.spark.SparkConf
import org.apache.spark.SparkContext
import swiftvis2.plotting._
import swiftvis2.plotting.renderer.SwingRenderer
//import swiftvis2.spark._

object SparkRDDTemplate {
    def main(args: Array[String]): Unit ={
    val conf = new SparkConf().setAppName("Temp Data")
        .setMaster("local[*]") //sets where the program sources from
    val sc = new SparkContext(conf)
  
    sc.setLogLevel("WARN") // what warnings or errors are printed
  
     // Your code here. 
  
    sc.stop()
    }
}