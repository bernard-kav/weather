view: gsod {
  sql_table_name: `fh-bigquery.weather_gsod.gsod201*`
    ;;

  dimension: count_dewp {
    hidden: yes
    type: number
    sql: ${TABLE}.count_dewp ;;
  }

  dimension: count_slp {
    hidden: yes
    type: number
    sql: ${TABLE}.count_slp ;;
  }

  dimension: count_stp {
    hidden: yes
    type: number
    sql: ${TABLE}.count_stp ;;
  }
  dimension_group: actual_date {
    type: time
    timeframes: [raw, date, month,year]
    sql: TIMESTAMP(CONCAT(year,'-',mo,'-',da));;
  }
  dimension: decades {
    type: string
    sql: CASE
    WHEN ${actual_date_year} LIKE "192%" THEN "20S"
    WHEN ${actual_date_year} LIKE "193%" THEN "30S"
    WHEN ${actual_date_year} LIKE "194%" THEN "40S"
    WHEN ${actual_date_year} LIKE "195%" THEN "50S"
    WHEN ${actual_date_year} LIKE "196%" THEN "60S"
    WHEN ${actual_date_year} LIKE "197%" THEN "70S"
    WHEN ${actual_date_year} LIKE "198%" THEN "80S"
    WHEN ${actual_date_year} LIKE "199%" THEN "90S"
    WHEN ${actual_date_year} LIKE "200%" THEN "2000S"
    WHEN ${actual_date_year} LIKE "201%" THEN "2010S"
  END;;
  }

  dimension: count_temp {
    hidden: yes
    type: number
    sql: ${TABLE}.count_temp ;;
  }

  dimension: count_visib {
    hidden: yes
    type: number
    sql: ${TABLE}.count_visib ;;
  }

  dimension: count_wdsp {
    hidden: yes
    type: string
    sql: ${TABLE}.count_wdsp ;;
  }

  dimension: da {
    hidden: yes
    type: string
    sql: ${TABLE}.da ;;
  }

  dimension: dew_point {
    description: "Mean dew point for the day in degreesm Fahrenheit to tenths.  Missing = 9999.9"
    type: number
    sql: CASE
    WHEN ${TABLE}.dewp = 9999.9 THEN NULL
    END;;
  }

  dimension: flag_max {
    hidden: yes
    type: string
    sql: ${TABLE}.flag_max ;;
  }

  dimension: flag_min {
    hidden: yes
    type: string
    sql: ${TABLE}.flag_min ;;
  }

  dimension: fog {
    description: "Indicators (1 = yes, 0 = no/not reported) for the occurrence during the day"
    type: string
    sql: CASE
    WHEN ${TABLE}.fog = 1 THEN "Yes"
    WHEN ${TABLE}.fog = 0 THEN "No"
    END;;
  }

  dimension: max_gust {
    description: "Maximum wind gust reported for the day in knots to tenths. Missing = 999.9"
    type: number
    sql: CASE
    WHEN ${TABLE}.gust = 999.9 THEN NULL
    END;;
  }

  dimension: hail {
    description: "Indicators (1 = yes, 0 = no/not reported) for the occurrence during the day"
    type: string
    sql: CASE
    WHEN ${TABLE}.hail = 1 THEN "Yes"
    WHEN ${TABLE}.hail = 0 THEN "No"
    END;;
  }

  dimension: max {
    description: "Maximum temperature reported during the day in Fahrenheit to tenths. Missing = 9999.9"
    type: number
    sql: CASE
    WHEN ${TABLE}.max = 9999.9 THEN NULL
    END;;
  }

  dimension: min {
    description: "Maximum temperature reported during the day in Fahrenheit to tenths. Missing = 9999.9"
    type: number
    sql: CASE
    WHEN ${TABLE}.min = 9999.9 THEN NULL
    END;;
  }

  dimension: mo {
    hidden: yes
    type: string
    sql: ${TABLE}.mo ;;
  }

  dimension: max_sus_wind_spd {
    description: "Maximum sustained wind speed reported for the day in knots to tenths. Missing = 999.9"
    type: string
    sql: CASE
    WHEN ${TABLE}.mxpsd = 999.9 THEN NULL
    END;;
  }

  dimension: prcp {
    description: "Total precipitation (rain and/or melted snow) reported during the day in inches and hundredths"
    type: number
    sql: CASE
    WHEN ${TABLE}.prcp = 99.99 THEN NULL
    WHEN ${TABLE}.prcp = .00 THEN "Trace Amount"
    END;;
  }

  dimension: flag_prcp {
    hidden: yes
    type: string
    sql: ${TABLE}.flag_prcp ;;
  }

  dimension: rain_drizzle {
    description: "Indicators (1 = yes, 0 = no/not reported) for the occurrence during the day"
    type: string
    sql: CASE
    WHEN ${TABLE}.rain_drizzle = 1 THEN "Yes"
    WHEN ${TABLE}.rain_drizzle = 0 THEN "No"
    ELSE NULL
    END;;
  }

  dimension: sea_level_pressure {
    description: "Mean sea level pressure for the day in millibars to tenths. Missing = 9999.9"
    type: number
    sql: CASE
    WHEN ${TABLE}.slp = 9999.9 THEN NULL
    END;;
  }

  dimension: snow_depth {
    description: "Snow depth in inches to tenths--last report for the day if reported more thanonce. Missing = 999.9"
    type: number
    sql: CASE
    WHEN ${TABLE}.sndp = 999.9 THEN NULL
    END;;
  }

  dimension: snow_ice_pellets {
    description: "Indicators (1 = yes, 0 = no/not reported) for the occurrence during the day"
    type: string
    sql: CASE
    WHEN ${TABLE}.snow_ice_pellets = 1 THEN "Yes"
    WHEN ${TABLE}.snow_ice_pellets = 0 THEN "No"
    ELSE NULL
    END;;
  }

  dimension: stn {
    description: "Station number (WMO/DATSAV3 number) for the location"
    type: string
    sql: ${TABLE}.stn ;;
  }

  dimension: stp {
    description: "Mean station pressure for the day in millibars to tenths. Missing = 9999.9"
    type: number
    sql: CASE
    WHEN ${TABLE}.stp = 9999.9 THEN NULL
    END;;
  }

  dimension: temp {
    description: "Mean temperature for the day in degrees Fahrenheit to tenths. Missing = 9999.9"
    type: number
    sql: CASE
    WHEN ${TABLE}.temp = 9999.9 THEN NULL
    END;;
  }

  dimension: thunder {
    description: "Indicators (1 = yes, 0 = no/not reported) for the occurrence during the day"
    type: string
    sql: CASE
    WHEN ${TABLE}.thunder = 1 THEN "Yes"
    WHEN ${TABLE}.thunder = 0 THEN "No"
    END;;
  }

  dimension: tornado_funnel_cloud {
    type: string
    sql: ${TABLE}.tornado_funnel_cloud ;;
  }

  dimension: visib {
    type: number
    sql: ${TABLE}.visib ;;
  }

  dimension: wban {
    description: "this is the historical Weather Bureau Air Force Navy number - "
    type: string
    sql: ${TABLE}.wban ;;
  }

  dimension: wdsp {
    type: string
    sql: ${TABLE}.wdsp ;;
  }

  dimension: year {
    type: string
    sql: ${TABLE}.year ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
  measure: average_precipitation{
    sql: ${prcp} ;;
    type: average
  }
  measure: average_max_temp{
    sql: ${max} ;;
    type: average
  }
  measure: median_temp {
    sql: ${temp} ;;
    type: median
  }


  measure: sum {
    type: sum

  }
}
