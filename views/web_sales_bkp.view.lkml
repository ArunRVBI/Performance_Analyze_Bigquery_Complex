view: web_sales_bkp {
  sql_table_name: `TPCDS_DEV.WEB_SALES_BKP`
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

  dimension: ws_bill_addr_sk {
    type: number
    sql: ${TABLE}.WS_BILL_ADDR_SK ;;
  }

  dimension: ws_bill_cdemo_sk {
    type: number
    sql: ${TABLE}.WS_BILL_CDEMO_SK ;;
  }

  dimension: ws_bill_customer_sk {
    type: number
    sql: ${TABLE}.WS_BILL_CUSTOMER_SK ;;
  }

  dimension: ws_bill_hdemo_sk {
    type: number
    sql: ${TABLE}.WS_BILL_HDEMO_SK ;;
  }

  dimension: ws_coupon_amt {
    type: number
    sql: ${TABLE}.WS_COUPON_AMT ;;
  }

  dimension: ws_ext_discount_amt {
    type: number
    sql: ${TABLE}.WS_EXT_DISCOUNT_AMT ;;
  }

  dimension: ws_ext_list_price {
    type: number
    sql: ${TABLE}.WS_EXT_LIST_PRICE ;;
  }

  dimension: ws_ext_sales_price {
    type: number
    sql: ${TABLE}.WS_EXT_SALES_PRICE ;;
  }

  dimension: ws_ext_ship_cost {
    type: number
    sql: ${TABLE}.WS_EXT_SHIP_COST ;;
  }

  dimension: ws_ext_tax {
    type: number
    sql: ${TABLE}.WS_EXT_TAX ;;
  }

  dimension: ws_ext_wholesale_cost {
    type: number
    sql: ${TABLE}.WS_EXT_WHOLESALE_COST ;;
  }

  dimension: ws_item_sk {
    type: number
    sql: ${TABLE}.WS_ITEM_SK ;;
  }

  dimension: ws_list_price {
    type: number
    sql: ${TABLE}.WS_LIST_PRICE ;;
  }

  dimension: ws_net_paid {
    type: number
    value_format_name: id
    sql: ${TABLE}.WS_NET_PAID ;;
  }

  dimension: ws_net_paid_inc_ship {
    type: number
    sql: ${TABLE}.WS_NET_PAID_INC_SHIP ;;
  }

  dimension: ws_net_paid_inc_ship_tax {
    type: number
    sql: ${TABLE}.WS_NET_PAID_INC_SHIP_TAX ;;
  }

  dimension: ws_net_paid_inc_tax {
    type: number
    sql: ${TABLE}.WS_NET_PAID_INC_TAX ;;
  }

  dimension: ws_net_profit {
    type: number
    sql: ${TABLE}.WS_NET_PROFIT ;;
  }

  dimension: ws_order_number {
    type: number
    sql: ${TABLE}.WS_ORDER_NUMBER ;;
  }

  dimension: ws_promo_sk {
    type: number
    sql: ${TABLE}.WS_PROMO_SK ;;
  }

  dimension: ws_quantity {
    type: number
    sql: ${TABLE}.WS_QUANTITY ;;
  }

  dimension: ws_sales_price {
    type: number
    sql: ${TABLE}.WS_SALES_PRICE ;;
  }

  dimension: ws_ship_addr_sk {
    type: number
    sql: ${TABLE}.WS_SHIP_ADDR_SK ;;
  }

  dimension: ws_ship_cdemo_sk {
    type: number
    sql: ${TABLE}.WS_SHIP_CDEMO_SK ;;
  }

  dimension: ws_ship_customer_sk {
    type: number
    sql: ${TABLE}.WS_SHIP_CUSTOMER_SK ;;
  }

  dimension: ws_ship_date_sk {
    type: number
    sql: ${TABLE}.WS_SHIP_DATE_SK ;;
  }

  dimension: ws_ship_hdemo_sk {
    type: number
    sql: ${TABLE}.WS_SHIP_HDEMO_SK ;;
  }

  dimension: ws_ship_mode_sk {
    type: number
    sql: ${TABLE}.WS_SHIP_MODE_SK ;;
  }

  dimension: ws_sold_date_sk {
    type: number
    sql: ${TABLE}.WS_SOLD_DATE_SK ;;
  }

  dimension: ws_sold_time_sk {
    type: number
    sql: ${TABLE}.WS_SOLD_TIME_SK ;;
  }

  dimension: ws_warehouse_sk {
    type: number
    sql: ${TABLE}.WS_WAREHOUSE_SK ;;
  }

  dimension: ws_web_page_sk {
    type: number
    sql: ${TABLE}.WS_WEB_PAGE_SK ;;
  }

  dimension: ws_web_site_sk {
    type: number
    sql: ${TABLE}.WS_WEB_SITE_SK ;;
  }

  dimension: ws_wholesale_cost {
    type: number
    sql: ${TABLE}.WS_WHOLESALE_COST ;;
  }

  measure: count {
    type: count
    drill_fields: [d_quarter_name, d_day_name]
  }
}
