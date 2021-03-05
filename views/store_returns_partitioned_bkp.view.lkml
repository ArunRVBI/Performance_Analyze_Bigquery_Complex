view: store_returns_partitioned_bkp {
  sql_table_name: `TPCDS_DEV.STORE_RETURNS_PARTITIONED_BKP`
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

  dimension: rank {
    type: number
    sql: ${TABLE}.Rank ;;
  }

  dimension: sr_addr_sk {
    type: number
    sql: ${TABLE}.SR_ADDR_SK ;;
  }

  dimension: sr_cdemo_sk {
    type: number
    sql: ${TABLE}.SR_CDEMO_SK ;;
  }

  dimension: sr_customer_sk {
    type: number
    sql: ${TABLE}.SR_CUSTOMER_SK ;;
  }

  dimension: sr_fee {
    type: number
    sql: ${TABLE}.SR_FEE ;;
  }

  dimension: sr_hdemo_sk {
    type: number
    sql: ${TABLE}.SR_HDEMO_SK ;;
  }

  dimension: sr_item_sk {
    type: number
    sql: ${TABLE}.SR_ITEM_SK ;;
  }

  dimension: sr_net_loss {
    type: number
    sql: ${TABLE}.SR_NET_LOSS ;;
  }

  dimension: sr_reason_sk {
    type: number
    sql: ${TABLE}.SR_REASON_SK ;;
  }

  dimension: sr_refunded_cash {
    type: number
    sql: ${TABLE}.SR_REFUNDED_CASH ;;
  }

  dimension: sr_return_amt {
    type: number
    sql: ${TABLE}.SR_RETURN_AMT ;;
  }

  dimension: sr_return_amt_inc_tax {
    type: number
    sql: ${TABLE}.SR_RETURN_AMT_INC_TAX ;;
  }

  dimension: sr_return_quantity {
    type: number
    sql: ${TABLE}.SR_RETURN_QUANTITY ;;
  }

  dimension: sr_return_ship_cost {
    type: number
    sql: ${TABLE}.SR_RETURN_SHIP_COST ;;
  }

  dimension: sr_return_tax {
    type: number
    sql: ${TABLE}.SR_RETURN_TAX ;;
  }

  dimension: sr_return_time_sk {
    type: number
    sql: ${TABLE}.SR_RETURN_TIME_SK ;;
  }

  dimension: sr_returned_date_sk {
    type: number
    sql: ${TABLE}.SR_RETURNED_DATE_SK ;;
  }

  dimension: sr_reversed_charge {
    type: number
    sql: ${TABLE}.SR_REVERSED_CHARGE ;;
  }

  dimension: sr_store_credit {
    type: number
    sql: ${TABLE}.SR_STORE_CREDIT ;;
  }

  dimension: sr_store_sk {
    type: number
    sql: ${TABLE}.SR_STORE_SK ;;
  }

  dimension: sr_ticket_number {
    type: number
    sql: ${TABLE}.SR_TICKET_NUMBER ;;
  }

  measure: count {
    type: count
    drill_fields: [d_quarter_name, d_day_name]
  }
}
