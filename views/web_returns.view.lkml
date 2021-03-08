view: web_returns {
  sql_table_name: `TPCDS.WEB_RETURNS`
    ;;

  dimension: wr_account_credit {
    type: number
    sql: ${TABLE}.WR_ACCOUNT_CREDIT ;;
  }

  dimension: wr_fee {
    type: number
    sql: ${TABLE}.WR_FEE ;;
  }

  dimension: wr_item_sk {
    type: number
    sql: ${TABLE}.WR_ITEM_SK ;;
  }

  dimension: wr_net_loss {
    type: number
    sql: ${TABLE}.WR_NET_LOSS ;;
  }

  dimension: wr_order_number {
    type: number
    sql: ${TABLE}.WR_ORDER_NUMBER ;;
  }

  dimension: wr_reason_sk {
    type: number
    sql: ${TABLE}.WR_REASON_SK ;;
  }

  dimension: wr_refunded_addr_sk {
    type: number
    sql: ${TABLE}.WR_REFUNDED_ADDR_SK ;;
  }

  dimension: wr_refunded_cash {
    type: number
    sql: ${TABLE}.WR_REFUNDED_CASH ;;
  }

  dimension: wr_refunded_cdemo_sk {
    type: number
    sql: ${TABLE}.WR_REFUNDED_CDEMO_SK ;;
  }

  dimension: wr_refunded_customer_sk {
    type: number
    sql: ${TABLE}.WR_REFUNDED_CUSTOMER_SK ;;
  }

  dimension: wr_refunded_hdemo_sk {
    type: number
    sql: ${TABLE}.WR_REFUNDED_HDEMO_SK ;;
  }

  dimension: wr_return_amt {
    type: number
    sql: ${TABLE}.WR_RETURN_AMT ;;
  }

  dimension: wr_return_amt_inc_tax {
    type: number
    sql: ${TABLE}.WR_RETURN_AMT_INC_TAX ;;
  }

  dimension: wr_return_quantity {
    type: number
    sql: ${TABLE}.WR_RETURN_QUANTITY ;;
  }

  dimension: wr_return_ship_cost {
    type: number
    sql: ${TABLE}.WR_RETURN_SHIP_COST ;;
  }

  dimension: wr_return_tax {
    type: number
    sql: ${TABLE}.WR_RETURN_TAX ;;
  }

  dimension: wr_returned_date_sk {
    type: number
    sql: ${TABLE}.WR_RETURNED_DATE_SK ;;
  }

  dimension: wr_returned_time_sk {
    type: number
    sql: ${TABLE}.WR_RETURNED_TIME_SK ;;
  }

  dimension: wr_returning_addr_sk {
    type: number
    sql: ${TABLE}.WR_RETURNING_ADDR_SK ;;
  }

  dimension: wr_returning_cdemo_sk {
    type: number
    sql: ${TABLE}.WR_RETURNING_CDEMO_SK ;;
  }

  dimension: wr_returning_customer_sk {
    type: number
    sql: ${TABLE}.WR_RETURNING_CUSTOMER_SK ;;
  }

  dimension: wr_returning_hdemo_sk {
    type: number
    sql: ${TABLE}.WR_RETURNING_HDEMO_SK ;;
  }

  dimension: wr_reversed_charge {
    type: number
    sql: ${TABLE}.WR_REVERSED_CHARGE ;;
  }

  dimension: wr_web_page_sk {
    type: number
    sql: ${TABLE}.WR_WEB_PAGE_SK ;;
  }

#For Charts
  dimension: is_mtd{
    type: yesno
    sql:
      ${date_dim.d_year} = EXTRACT(year FROM {% parameter date_dim.datefilter %})
      and
      cast(cast(substring(${date_dim.d_month},6,2) as INT64) as string)= cast(EXTRACT(month FROM {% parameter date_dim.datefilter %}) as string)
      and
      ${date_dim.d_date} <= cast({% parameter date_dim.datefilter %} as DATE)
      ;;
  }
  dimension: is_sply_mtd{
    type: yesno
    sql:
      ${date_dim.d_year} = EXTRACT(year FROM {% parameter date_dim.datefilter %}) -1
      and
      cast(cast(substring(${date_dim.d_month},6,2) as INT64) as string)= cast(EXTRACT(month FROM {% parameter date_dim.datefilter %}) as string)
      and
      ${date_dim.d_date}<= DATE_ADD(cast ({% parameter date_dim.datefilter %} as DATE),INTERVAL -365 DAY)
      ;;
  }
  dimension: dateflag{
    type: yesno
    sql:
     ( ${date_dim.d_year} = EXTRACT(year FROM {% parameter date_dim.datefilter %})
      and
      cast(cast(substring(${date_dim.d_month},6,2) as INT64) as string)= cast(EXTRACT(month FROM {% parameter date_dim.datefilter %}) as string)
      and
      ${date_dim.d_date} <= cast({% parameter date_dim.datefilter %} as DATE)
      )
      or
      ( ${date_dim.d_year} = EXTRACT(year FROM {% parameter date_dim.datefilter %}) -1
      and
      cast(cast(substring(${date_dim.d_month},6,2) as INT64) as string)= cast(EXTRACT(month FROM {% parameter date_dim.datefilter %}) as string)
      and
      ${date_dim.d_date}<= DATE_ADD(cast ({% parameter date_dim.datefilter %} as DATE),INTERVAL -365 DAY)
      )
      ;;
  }
  measure: currentyear_returnamt {
    type: sum
    sql:  ${TABLE}.WR_RETURN_AMT;;
    filters: [is_mtd: "yes"]
  }
  measure: previousyear_returnamt {
    type: sum
    sql:  ${TABLE}.WR_RETURN_AMT;;
    filters: [is_sply_mtd: "yes"]
  }
  measure: currentyear_returnshipcost {
    type: sum
    sql:  ${TABLE}.WR_RETURN_SHIP_COST;;
    filters: [is_mtd: "yes"]
  }
  measure: previousyear_returnshipcost {
    type: sum
    sql:  ${TABLE}.WR_RETURN_SHIP_COST;;
    filters: [is_sply_mtd: "yes"]
  }
  measure: filter_dateflag {
    type: sum
    sql:  1;;
    filters: [dateflag: "yes"]
  }
  measure: count {
    type: count
    drill_fields: []
  }
}
