include: "/universal_views/users.view.lkml"

view: +users {
  dimension: age {
    required_access_grants: [hr]
    type: number
    sql: ${TABLE}.age ;;
  }
  dimension: email {
    required_access_grants: [hr]
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: first_name {
    required_access_grants: [hr]
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: gender {
    required_access_grants: [hr]
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: last_name {
    required_access_grants: [hr]
    type: string
    sql: ${TABLE}.last_name ;;
  }
  set: pii {
    fields: [age, email, first_name, gender, last_name]
  }
}



# view: users_pii {
#   # Or, you could make this view a derived table, like this:
#   derived_table: {
#     sql: SELECT
#         user_id as user_id
#         , COUNT(*) as lifetime_orders
#         , MAX(orders.created_at) as most_recent_purchase_at
#       FROM orders
#       GROUP BY user_id
#       ;;
#   }
#
#   # Define your dimensions and measures here, like this:
#   dimension: user_id {
#     description: "Unique ID for each user that has ordered"
#     type: number
#     sql: ${TABLE}.user_id ;;
#   }
#
#   dimension: lifetime_orders {
#     description: "The total number of orders for each user"
#     type: number
#     sql: ${TABLE}.lifetime_orders ;;
#   }
#
#   dimension_group: most_recent_purchase {
#     description: "The date when each user last ordered"
#     type: time
#     timeframes: [date, week, month, year]
#     sql: ${TABLE}.most_recent_purchase_at ;;
#   }
#
#   measure: total_lifetime_orders {
#     description: "Use this for counting lifetime orders across many users"
#     type: sum
#     sql: ${lifetime_orders} ;;
#   }
# }
