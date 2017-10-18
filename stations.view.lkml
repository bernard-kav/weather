view: stations {
  sql_table_name: `fh-bigquery.weather_gsod.stations`
    ;;

  dimension: begin {
    type: string
    sql: ${TABLE}.begin ;;
  }

  dimension: call {
    type: string
    sql: ${TABLE}.call ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: elev {
    type: string
    sql: ${TABLE}.elev ;;
  }

  dimension: end {
    type: string
    sql: ${TABLE}.`end` ;;
  }

  dimension: fips {
    type: string
    sql: ${TABLE}.fips ;;
  }

  dimension: lat {
    type: number
    sql: ${TABLE}.lat ;;
  }

  dimension: lon {
    type: number
    sql: ${TABLE}.lon ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: usaf {
    type: string
    sql: ${TABLE}.usaf ;;
  }

  dimension: wban {
    type: string
    sql: ${TABLE}.wban ;;
  }
  dimension: stn_world_region {
    type: string
    sql: CASE
    WHEN ${lat} >= 66.0  AND ${lat} <=90.0   THEN
      "ARCTIC CIRCLE"
    WHEN ${lat} >= 23.0  AND ${lat} < 66.0  THEN
      "NORTHERN TEMPERATE ZONE - BETWEEN TROPIC OF CANCER & ARCTIC CIRCLE"
    WHEN ${lat} >= 0.0   AND ${lat} < 23.0  THEN
      "NORTHERN TROPICS - BETWEEN TROPIC OF CANCER & EQUATOR"
    WHEN ${lat} >= -23.0 AND ${lat} < 0.0   THEN
      "SOUTHERN TROPICS - BETWEEN TROPIC OF CAPRICORN & EQUATOR"
    WHEN ${lat} >= -66.0 AND ${lat} < -23.0 THEN
      "SOUTHERN TEMPERATE ZONE - BETWEEN TROPIC OF CAPRICORN & ANTARCTIC CIRCLE"
    WHEN ${lat} >= -90.0 AND ${lat} < -66.0 THEN
        "ANTARCTIC CIRCLE"
        END;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
