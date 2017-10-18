view: stations2 {
  sql_table_name: `fh-bigquery.weather_gsod.stations`
    ;;

  dimension: begin {
    type: string
    sql: ${TABLE}.begin ;;
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

  dimension: icao {
    type: string
    sql: ${TABLE}.icao ;;
  }

  dimension: lat {
    type: string
    sql: ${TABLE}.lat ;;
  }

  dimension: lon {
    type: string
    sql: ${TABLE}.lon ;;
  }
  dimension: geolocation {
    type: location
    sql_latitude: ${lat} ;;
    sql_longitude: ${lon} ;;
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

  measure: count {
    type: count
    drill_fields: [name]
  }
}
