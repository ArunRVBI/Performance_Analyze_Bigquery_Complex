view: store_sales_bkp {
  sql_table_name: `TPCDS_DEV.STORE_SALES_BKP`
    ;;

  dimension: d_current_day {
    type: yesno
    sql: ${TABLE}.D_CURRENT_DAY ;;
  }

  dimension: d_current_month {
    type: yesno
    sql: ${TABLE}.D_CURRENT_MONTH ;;
  }

  dimension: d_current_quarter {
    type: yesno
    sql: ${TABLE}.D_CURRENT_QUARTER ;;
  }

  dimension: d_current_week {
    type: yesno
    sql: ${TABLE}.D_CURRENT_WEEK ;;
  }

  dimension: d_current_year {
    type: yesno
    sql: ${TABLE}.D_CURRENT_YEAR ;;
  }

  dimension_group: d {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.D_DATE ;;
  }

  dimension: d_date_id {
    type: string
    sql: ${TABLE}.D_DATE_ID ;;
  }

  dimension: d_date_sk {
    type: number
    sql: ${TABLE}.D_DATE_SK ;;
  }

  dimension: d_day_name {
    type: string
    sql: ${TABLE}.D_DAY_NAME ;;
  }

  dimension: d_dom {
    type: number
    sql: ${TABLE}.D_DOM ;;
  }

  dimension: d_dow {
    type: number
    sql: ${TABLE}.D_DOW ;;
  }

  dimension: d_first_dom {
    type: number
    sql: ${TABLE}.D_FIRST_DOM ;;
  }

  dimension: d_following_holiday {
    type: yesno
    sql: ${TABLE}.D_FOLLOWING_HOLIDAY ;;
  }

  dimension: d_fy_quarter_seq {
    type: number
    sql: ${TABLE}.D_FY_QUARTER_SEQ ;;
  }

  dimension: d_fy_week_seq {
    type: number
    sql: ${TABLE}.D_FY_WEEK_SEQ ;;
  }

  dimension: d_fy_year {
    type: number
    sql: ${TABLE}.D_FY_YEAR ;;
  }

  dimension: d_holiday {
    type: yesno
    sql: ${TABLE}.D_HOLIDAY ;;
  }

  dimension: d_last_dom {
    type: number
    sql: ${TABLE}.D_LAST_DOM ;;
  }

  dimension: d_month_seq {
    type: number
    sql: ${TABLE}.D_MONTH_SEQ ;;
  }

  dimension: d_moy {
    type: number
    sql: ${TABLE}.D_MOY ;;
  }

  dimension: d_qoy {
    type: number
    sql: ${TABLE}.D_QOY ;;
  }

  dimension: d_quarter_name {
    type: string
    sql: ${TABLE}.D_QUARTER_NAME ;;
  }

  dimension: d_quarter_seq {
    type: number
    sql: ${TABLE}.D_QUARTER_SEQ ;;
  }

  dimension: d_same_day_lq {
    type: number
    sql: ${TABLE}.D_SAME_DAY_LQ ;;
  }

  dimension: d_same_day_ly {
    type: number
    sql: ${TABLE}.D_SAME_DAY_LY ;;
  }

  dimension: d_week_seq {
    type: number
    sql: ${TABLE}.D_WEEK_SEQ ;;
  }

  dimension: d_weekend {
    type: yesno
    sql: ${TABLE}.D_WEEKEND ;;
  }

  dimension: dyear {
    type: number
    sql: ${TABLE}.D_YEAR ;;
  }

  dimension: ss_addr_sk {
    type: number
    sql: ${TABLE}.SS_ADDR_SK ;;
  }

  dimension: ss_cdemo_sk {
    type: number
    sql: ${TABLE}.SS_CDEMO_SK ;;
  }

  dimension: ss_coupon_amt {
    type: number
    sql: ${TABLE}.SS_COUPON_AMT ;;
  }

  dimension: ss_customer_sk {
    type: number
    sql: ${TABLE}.SS_CUSTOMER_SK ;;
  }

  dimension: ss_ext_discount_amt {
    type: number
    sql: ${TABLE}.SS_EXT_DISCOUNT_AMT ;;
  }

  dimension: ss_ext_list_price {
    type: number
    sql: ${TABLE}.SS_EXT_LIST_PRICE ;;
  }

  dimension: ss_ext_sales_price {
    type: number
    sql: ${TABLE}.SS_EXT_SALES_PRICE ;;
  }

  dimension: ss_ext_tax {
    type: number
    sql: ${TABLE}.SS_EXT_TAX ;;
  }

  dimension: ss_ext_wholesale_cost {
    type: number
    sql: ${TABLE}.SS_EXT_WHOLESALE_COST ;;
  }

  dimension: ss_hdemo_sk {
    type: number
    sql: ${TABLE}.SS_HDEMO_SK ;;
  }

  dimension: ss_item_sk {
    type: number
    sql: ${TABLE}.SS_ITEM_SK ;;
  }

  dimension: ss_list_price {
    type: number
    sql: ${TABLE}.SS_LIST_PRICE ;;
  }

  dimension: ss_net_paid {
    type: number
    value_format_name: id
    sql: ${TABLE}.SS_NET_PAID ;;
  }

  dimension: ss_net_paid_inc_tax {
    type: number
    sql: ${TABLE}.SS_NET_PAID_INC_TAX ;;
  }

  dimension: ss_net_profit {
    type: number
    sql: ${TABLE}.SS_NET_PROFIT ;;
  }

  dimension: ss_promo_sk {
    type: number
    sql: ${TABLE}.SS_PROMO_SK ;;
  }

  dimension: ss_quantity {
    type: number
    sql: ${TABLE}.SS_QUANTITY ;;
  }

  dimension: ss_sales_price {
    type: number
    sql: ${TABLE}.SS_SALES_PRICE ;;
  }

  dimension: ss_sold_date_sk {
    type: number
    sql: ${TABLE}.SS_SOLD_DATE_SK ;;
  }

  dimension: ss_sold_time_sk {
    type: number
    sql: ${TABLE}.SS_SOLD_TIME_SK ;;
  }

  dimension: ss_store_sk {
    type: number
    sql: ${TABLE}.SS_STORE_SK ;;
  }

  dimension: ss_ticket_number {
    type: number
    sql: ${TABLE}.SS_TICKET_NUMBER ;;
  }

  dimension: ss_wholesale_cost {
    type: number
    sql: ${TABLE}.SS_WHOLESALE_COST ;;
  }

  measure: count {
    type: count
    drill_fields: [d_quarter_name, d_day_name]
  }
}
