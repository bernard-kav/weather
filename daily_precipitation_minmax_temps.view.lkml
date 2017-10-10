view: daily_precipitation_minmax_temps {
  derived_table: {
    sql: SELECT TIMESTAMP(CONCAT(year,'-',mo,'-',da)) day, AVG(min) min, AVG(max) max, AVG(IF(prcp=99.99,0,prcp)) prcp
      FROM `bigquery-public-data.noaa_gsod.gsod2016`
      WHERE stn='722540' AND wban='13904'
      GROUP BY 1
      ORDER BY day
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension_group: day {
    type: time
    sql: ${TABLE}.day ;;
  }

  dimension: min {
    type: number
    sql: ${TABLE}.min ;;
  }

  dimension: max {
    type: number
    sql: ${TABLE}.max ;;
  }

  dimension: prcp {
    type: number
    sql: ${TABLE}.prcp ;;
  }

  set: detail {
    fields: [day_time, min, max, prcp]
  }
}
