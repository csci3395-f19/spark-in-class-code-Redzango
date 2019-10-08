package basics
import scalafx.print.PrintQuality.High
import swiftvis2.plotting._
import swiftvis2.plotting.styles.ScatterStyle
import swiftvis2.plotting.renderer.SwingRenderer
import swiftvis2.plotting.ColorGradient

case class TempRow(day: Int, doy: Int, month: Int, year: Int, precip: Double, tave: Double, tmax: Double, tmin: Double)

object SATemps {
  def parseLine(line: String): TempRow = {
      val p = line.split(",")
      TempRow(p(0).toInt, p(1).toInt, p(2).toInt, p(4).toInt, p(5).toDouble, p(6).toDouble,
      p(7).toDouble, p(8).toDouble)
  }

  def main(args: Array[String]): Unit = {
    val source = scala.io.Source.fromFile("/users/mlewis/CSCI3395-F19/InClassBD/data/SanAntonioTemps.csv")
    val lines = source.getLines()
    val data = lines.drop(2).map(parseLine).toArray

    //data.take(5).foreach(println)

    val HighestHigh = data.maxBy(_.tmax)
                    //data.reduce((d1,d2)=> if(d1.tmax > d2.tmax) d1 else d2)
    //println(HighestHigh.day +""+ HighestHigh.month +""+ HighestHigh.year)

    val mostPrecip = data.maxBy(_.precip)
    
    val daysRain = data.count(_.precip > 1) 
    val rainFrac= daysRain / data.length.toDouble
    //println(rainFrac)

    val rainyData = data.filter(_.precip > 1)
    val htempRainAvg = rainyData.map(_.tmax).fold(0.0)(_+_)
    //println(htempRainAvg)

    val monthData = data.filter(_.month == 3)
    val months = data.groupBy(_.month)
    val avgMonthHTemp = months.mapValues(_.map(_.tmax).fold(0.0)(_ + _) / monthData.length)
    //avgMonthHTemp.toSeq.sortBy(_._1).foreach(println)

    val avgMonthPrecip = monthData.map(_.precip).reduce(_+_) / monthData.length
    //println(avgMonthPrecip)
    
    val monthSortedPrecip = monthData.sortBy(_.precip)
    val medPBM = months.mapValues(m => m.sortBy(_.precip).apply(m.length/2))
    val midIndex = (monthSortedPrecip.length.toDouble/2).toInt
    //println(monthSortedPrecip(midIndex).precip)
    //medPBM.toSeq.sortBy(_._1).foreach(println)

    val cg = ColorGradient(1946.0->RedARGB, 1975.0->BlueARGB, 2014.0->GreenARGB)
    val sizes = data.map(_.precip*2 + 2)
    val tempByDayPlot = Plot.simple(ScatterStyle(data.map(_.doy),data.map(_.tave), symbolWidth = sizes, symbolHeight = sizes, colors = cg(data.map(_.year))), "Day Of Year", "Temp","SA Temps")
    SwingRenderer(tempByDayPlot,800,800,true)
  }
}
