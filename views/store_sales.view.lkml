view: store_sales {
  sql_table_name: `TPCDS.STORE_SALES`
    ;;

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

  measure: ss_sales_price {
    type: sum
    sql: ${TABLE}.SS_SALES_PRICE ;;
    value_format: "0.00"
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


  # Custom dimention

  dimension: is_ytd{
    type: yesno
    sql:
      ${date_dim.d_year} = EXTRACT(year FROM {% parameter date_dim.datefilter %})
      and
      ${date_dim.d_date} <= cast({% parameter date_dim.datefilter %} as DATE)
      ;;
  }
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
  dimension: is_sply_ytd{
    type: yesno
    sql:
      ${date_dim.d_year} = EXTRACT(year FROM {% parameter date_dim.datefilter %}) -1
      and
      ${date_dim.d_date}<= DATE_ADD(cast ({% parameter date_dim.datefilter %} as DATE),INTERVAL -365 DAY)
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

  measure: ytd_CustCount {
    type:count_distinct
    sql: ${ss_customer_sk} ;;
    filters: {
      field: is_ytd
      value: "yes"
    }
  }
  measure: mtd_CustCount {
    type:count_distinct
    sql: ${ss_customer_sk} ;;
    filters: {
      field: is_mtd
      value: "yes"
    }
  }
  measure: sply_ytd_CustCount {
    type:count_distinct
    sql: ${ss_customer_sk} ;;
    filters: {
      field: is_sply_ytd
      value: "yes"
    }
  }
  measure: sply_mtd_CustCount {
    type:count_distinct
    sql: ${ss_customer_sk} ;;
    filters: {
      field: is_sply_mtd
      value: "yes"
    }
  }


  measure: ss_sales_price_ytd {
    type: sum
    sql: ${TABLE}.SS_SALES_PRICE ;;
    filters: [is_ytd: "yes"]
    value_format: "0.00"
  }
  measure: ss_sales_price_mtd {
    type: sum
    sql: ${TABLE}.SS_SALES_PRICE ;;
    filters: [is_mtd: "yes"]
    value_format: "0.00"
  }
  measure: ss_sales_price_sply_ytd {
    type: sum
    sql: ${TABLE}.SS_SALES_PRICE ;;
    filters: [is_sply_ytd: "yes"]
    value_format: "0.00"
  }
  measure: ss_sales_price_sply_mtd {
    type: sum
    sql: ${TABLE}.SS_SALES_PRICE ;;
    filters: [is_sply_mtd: "yes"]
    value_format: "0.00"
  }


  dimension: currentYear{
    type: yesno
    sql:
      ${date_dim.d_year} = EXTRACT(year FROM {% parameter date_dim.datefilter %})
      and
      cast(cast(substring(${date_dim.d_month},6,2) as INT64) as string) = cast(EXTRACT(month FROM {% parameter date_dim.datefilter %}) as string)
      ;;
  }
  dimension: previousYear{
    type: yesno
    sql:
      ${date_dim.d_year} = EXTRACT(year FROM {% parameter date_dim.datefilter %}) -1
      and
      cast(cast(substring(${date_dim.d_month},6,2) as INT64) as string) = cast(EXTRACT(month FROM {% parameter date_dim.datefilter %}) as string)
       ;;
  }
  measure: currentyear_sales {
    type: sum
    sql:  ${TABLE}.SS_SALES_PRICE;;
    filters: [currentYear: "yes"]
  }
  measure: previousyear_sales {
    type: sum
    sql:  ${TABLE}.SS_SALES_PRICE;;
    filters: [previousYear: "yes"]
  }
  measure: sales_ratio {
    type: number
    sql: (${currentyear_sales}-${previousyear_sales})/${previousyear_sales} * 100 ;;
    value_format: "0.00"
  }
  dimension: Weekcount {
    type: number
    sql: EXTRACT(WEEK FROM ${date_dim.d_date}) ;;
  }
  # ned to lookinto weekday and weekdays
  dimension: Weekday {
    type: number
    sql: EXTRACT(DAYOFWEEK FROM ${date_dim.d_date})  ;;
  }

  dimension: weekdays {
    type: string
    sql: CASE
        WHEN EXTRACT(DAYOFWEEK FROM ${date_dim.d_date}) = 1 THEN 'Sunday'
        WHEN EXTRACT(DAYOFWEEK FROM ${date_dim.d_date}) = 2 THEN 'Monday'
        WHEN EXTRACT(DAYOFWEEK FROM ${date_dim.d_date}) = 3 THEN 'Tuesday'
        WHEN EXTRACT(DAYOFWEEK FROM ${date_dim.d_date}) = 4 THEN 'Wednesday'
        WHEN EXTRACT(DAYOFWEEK FROM ${date_dim.d_date}) = 5 THEN 'Thursday'
        WHEN EXTRACT(DAYOFWEEK FROM ${date_dim.d_date}) = 6 THEN 'Friday'
        WHEN EXTRACT(DAYOFWEEK FROM ${date_dim.d_date}) = 7 THEN 'Saturday'
        ELSE 'null'
        END ;;
  }



  dimension: ss_issalesPriceTop10 {
    type: yesno
    sql: ${date_dim.d_year} = EXTRACT(year FROM {% parameter date_dim.datefilter %})
      and
         cast(cast(substring(${date_dim.d_month},6,2) as INT64) as string)= cast(EXTRACT(month FROM {% parameter date_dim.datefilter %}) as string) ;;
  }
  measure: ss_salesprice {
    type: sum
    sql: ${TABLE}.SS_SALES_PRICE;;
    filters: [ss_issalesPriceTop10: "yes"]
    value_format: "0.00"
  }

#For Charts
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


  measure: currentyear_salesprice {
    type: sum
    sql:  ${TABLE}.SS_SALES_PRICE;;
    filters: [is_mtd: "yes"]
    value_format: "0.00"
  }
  measure: previousyear_salesprice {
    type: sum
    sql:  ${TABLE}.SS_SALES_PRICE;;
    filters: [is_sply_mtd: "yes"]
    value_format: "0.00"
  }
  measure: currentyear_listprice {
    type: sum
    sql:  ${TABLE}.SS_LIST_PRICE;;
    filters: [is_mtd: "yes"]
    value_format: "0.00"
  }
  measure: previousyear_listprice {
    type: sum
    sql:  ${TABLE}.SS_LIST_PRICE;;
    filters: [is_sply_mtd: "yes"]
    value_format: "0.00"
  }
  measure: currentyear_wholesalecost {
    type: sum
    sql:  ${TABLE}.SS_WHOLESALE_COST;;
    filters: [is_mtd: "yes"]
    value_format: "0.00"
  }
  measure: previousyear_wholesalecost {
    type: sum
    sql:  ${TABLE}.SS_WHOLESALE_COST;;
    filters: [is_sply_mtd: "yes"]
    value_format: "0.00"
  }
  measure: filter_dateflag {
    type: sum
    sql:  1;;
    filters: [dateflag: "yes"]
    value_format: "0.00"
  }


  measure: count {
    type: count
    drill_fields: []
  }
}
