#! /bin/sh

# vars
refYear="2015"
refDate="20150501"
refMonth="201508"
refLastMonth="201507"
refLastDay="20"
ext="23_00"
sql=""
if [ -n "$1" ]
then
    nbCopy=`expr $1 - 2`
else
    nbCopy=-1
fi

# script
for i in `seq -1 $nbCopy`
do
    yesterdayDate=`date -d "$i days" +%Y%m%d`;
    yesterdayYear=`date -d "$i days" +%Y`;
    j=`expr $i + 1`
    todayDate=`date -d "$j days" +%Y%m%d`;
    todayMonth=`date -d "$j days" +%Y%m`;
    todayYear=`date -d "$j days" +%Y`;
    yesterdayLastMonthDate=`date -d "1 month ago $i days" +%Y%m%d`;
    yesterdayLastMonthYear=`date -d "1 month ago $i days" +%Y`;
    k=`expr $i + 3`
    lastMonthPlus2Date=`date -d "1 month ago $k days" +%Y%m%d`;
    lastMonthPlus2Day=`date -d "1 month ago $k days" +%d`;
    lastMonthPlus2Year=`date -d "1 month ago $k days" +%Y`;
    l=`expr $i + 4`
    lastMonthPlus3Date=`date -d "1 month ago $l days" +%Y%m%d`;
    lastMonthPlus3Day=`date -d "1 month ago $l days" +%d`;
    lastMonthPlus3Year=`date -d "1 month ago $l days" +%Y`;
    m=`expr $i + 5`
    lastMonthPlus4Date=`date -d "1 month ago $m days" +%Y%m%d`;
    lastMonthPlus4Day=`date -d "1 month ago $m days" +%d`;
    lastMonthPlus4Year=`date -d "1 month ago $m days" +%Y`;

    add=""
    add="$add CREATE TABLE IF NOT EXISTS agg_product_count_date_$yesterdayYear.agg_$yesterdayDate$ext                 LIKE agg_product_count_date_$refYear.agg_$refDate$ext;\n"
    add="$add CREATE TABLE IF NOT EXISTS agg_product_count_date_$todayYear.agg_$todayDate                             LIKE agg_product_count_date_$refYear.agg_$refDate;\n"

    add="$add CREATE TABLE IF NOT EXISTS agg_transaction_date_$yesterdayYear.agg_$yesterdayDate$ext                   LIKE agg_transaction_date_$refYear.agg_$refDate$ext;\n"
    add="$add CREATE TABLE IF NOT EXISTS agg_transaction_date_$todayYear.agg_$todayDate                               LIKE agg_transaction_date_$refYear.agg_$refDate;\n"
    add="$add CREATE TABLE IF NOT EXISTS agg_transaction_date_$yesterdayLastMonthYear.agg_$yesterdayLastMonthDate$ext LIKE agg_transaction_date_$refYear.agg_$refDate$ext;\n"
    add="$add CREATE TABLE IF NOT EXISTS agg_transaction_date_$yesterdayLastMonthYear.agg_$yesterdayLastMonthDate     LIKE agg_transaction_date_$refYear.agg_$refDate;\n"

    add="$add CREATE TABLE IF NOT EXISTS agg_tithe_date_$yesterdayYear.agg_$yesterdayDate$ext                         LIKE agg_tithe_date_$refYear.agg_$refDate$ext;\n"
    add="$add CREATE TABLE IF NOT EXISTS agg_tithe_date_$todayYear.agg_$todayDate                                     LIKE agg_tithe_date_$refYear.agg_$refDate;\n"
    add="$add CREATE TABLE IF NOT EXISTS agg_tithe_date_$yesterdayLastMonthYear.agg_$yesterdayLastMonthDate$ext       LIKE agg_tithe_date_$refYear.agg_$refDate$ext;\n"
    add="$add CREATE TABLE IF NOT EXISTS agg_tithe_date_$yesterdayLastMonthYear.agg_$yesterdayLastMonthDate           LIKE agg_tithe_date_$refYear.agg_$refDate;\n"

    add="$add CREATE TABLE IF NOT EXISTS agg_click_$yesterdayYear.agg_$yesterdayDate$ext                              LIKE agg_click_$refYear.agg_$refDate$ext;\n"
    add="$add CREATE TABLE IF NOT EXISTS agg_click_$yesterdayLastMonthYear.agg_$yesterdayLastMonthDate$ext            LIKE agg_click_$refYear.agg_$refDate$ext;\n"
    add="$add CREATE TABLE IF NOT EXISTS agg_click_$todayYear.agg_$todayDate                                          LIKE agg_click_$refYear.agg_$refDate;\n"
    add="$add CREATE TABLE IF NOT EXISTS agg_click_$todayYear.agg_$todayMonth                                         LIKE agg_click_$refYear.agg_$refMonth;\n"

    add="$add CREATE TABLE IF NOT EXISTS agg_impression_$yesterdayYear.agg_$yesterdayDate$ext                         LIKE agg_impression_$refYear.agg_$refDate$ext;\n"
    add="$add CREATE TABLE IF NOT EXISTS agg_impression_$todayYear.agg_$todayDate                                     LIKE agg_impression_$refYear.agg_$refDate;\n"

    add="$add CREATE TABLE IF NOT EXISTS agg_influenced_transaction_$yesterdayYear.agg_$yesterdayDate$ext             LIKE agg_influenced_transaction_$refYear.agg_$refDate$ext;\n"
    add="$add CREATE TABLE IF NOT EXISTS agg_influenced_transaction_$todayYear.agg_$todayDate                         LIKE agg_influenced_transaction_$refYear.agg_$refDate;\n"

    add="$add CREATE TABLE IF NOT EXISTS agg_assisted_transaction_$yesterdayYear.agg_$yesterdayDate$ext               LIKE agg_assisted_transaction_$refYear.agg_$refDate$ext;\n"
    add="$add CREATE TABLE IF NOT EXISTS agg_assisted_transaction_$todayYear.agg_$todayDate                           LIKE agg_assisted_transaction_$refYear.agg_$refDate;\n"

    add="$add CREATE TABLE IF NOT EXISTS agg_transaction_comdate_$yesterdayYear.agg_$yesterdayDate$ext                LIKE agg_transaction_comdate_$refYear.agg_$refDate$ext;\n"
    add="$add CREATE TABLE IF NOT EXISTS agg_transaction_comdate_$todayYear.agg_$todayDate                            LIKE agg_transaction_comdate_$refYear.agg_$refDate;\n"

    add="$add CREATE TABLE IF NOT EXISTS agg_tithe_comdate_$yesterdayYear.agg_$yesterdayDate$ext                      LIKE agg_tithe_comdate_$refYear.agg_$refDate$ext;\n"
    add="$add CREATE TABLE IF NOT EXISTS agg_tithe_comdate_$todayYear.agg_$todayDate                                  LIKE agg_tithe_comdate_$refYear.agg_$refDate;\n"

    for k in `seq 1 15`
    do
        clickDate=`date -d "1 month ago $k days" +%Y%m%d`;
        clickDay=`date -d "1 month ago $k days" +%d`;
        clickYear=`date -d "1 month ago $k days" +%Y`;

        add="$add CREATE TABLE IF NOT EXISTS agg_transaction_date_$clickYear.agg_$clickDate                           LIKE agg_transaction_date_$refYear.agg_$refLastMonth$refLastDay;\n"
        add="$add CREATE TABLE IF NOT EXISTS agg_tithe_date_$clickYear.agg_$clickDate                                 LIKE agg_tithe_date_$refYear.agg_$refLastMonth$refLastDay;\n"
        add="$add CREATE TABLE IF NOT EXISTS agg_click_$clickYear.agg_$clickDate                                      LIKE agg_click_$refYear.agg_$refLastMonth$refLastDay;\n"
    done

    sql=$sql$add
done

echo $sql
