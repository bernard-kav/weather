connection: "terror_and_gun_crime"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"
explore: gsod {
  join: stations{
    type: left_outer
    relationship: many_to_one
    sql_on: ${gsod.stn} = ${stations.usaf};;

  }

}
explore: stations {}
explore: stations2{}
