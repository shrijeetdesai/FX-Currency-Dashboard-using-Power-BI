Select a.date, a.close as AUD_GBP_Rate,
(Select c.close from currency.cad_data c where c.date=a.date) as CAD_GBP_Rate,
(Select e.close from currency.eur_data e where e.date=a.date) as EUR_GBP_Rate,
(Select i.close from currency.inr_data i where i.date=a.date) as INR_GBP_Rate,
(Select j.close from currency.jpy_data j where j.date=a.date) as JPY_GBP_Rate,
(Select u.close from currency.usd_data u where u.date=a.date) as USD_GBP_Rate,
(Select stddev(a.close) from currency.aud_data a) as vol_AUD_GBP_Rate,
(Select stddev(c.close) from currency.cad_data c) as vol_CAD_GBP_Rate,
(Select stddev(e.close) from currency.eur_data e) as vol_EUR_GBP_Rate,
(Select stddev(i.close) from currency.inr_data i) as vol_INR_GBP_Rate,
(Select stddev(j.close) from currency.jpy_data j) as vol_JPY_GBP_Rate,
(Select stddev(u.close) from currency.usd_data u) as vol_USD_GBP_Rate,
(Select m.fedfunds from currency.aud_macroeconomic_data m where m.date=a.date) as aud_fedfunds,
(Select n.fedfunds from currency.cad_macroeconomic_data n where n.date=a.date) as cad_fedfunds,
(Select o.fedfunds from currency.eur_macroeconomic_data o where o.date=a.date) as eur_fedfunds,
(Select p.fedfunds from currency.gbp_macroeconomic_data p where p.date=a.date) as gbp_fedfunds,
(Select q.fedfunds from currency.inr_macroeconomic_data q where q.date=a.date) as inr_fedfunds, 
(Select r.fedfunds from currency.jpy_macroeconomic_data r where r.date=a.date) as jpy_fedfunds,
(Select s.fedfunds from currency.usd_macroeconomic_data s where s.date=a.date) as usd_fedfunds,
(Select m.unrate from currency.aud_macroeconomic_data m where m.date=a.date) as aud_unrate,
(Select n.unrate from currency.cad_macroeconomic_data n where n.date=a.date) as cad_unrate,
(Select o.unrate from currency.eur_macroeconomic_data o where o.date=a.date) as eur_unrate,
(Select p.unrate from currency.gbp_macroeconomic_data p where p.date=a.date) as gbp_unrate,
(Select q.unrate from currency.inr_macroeconomic_data q where q.date=a.date) as inr_unrate, 
(Select r.unrate from currency.jpy_macroeconomic_data r where r.date=a.date) as jpy_unrate,
(Select s.unrate from currency.usd_macroeconomic_data s where s.date=a.date) as usd_unrate,
(Select m.gdp from currency.aud_macroeconomic_data m where m.date=a.date) as aud_gdp,
(Select n.gdp from currency.cad_macroeconomic_data n where n.date=a.date) as cad_gdp,
(Select o.gdp from currency.eur_macroeconomic_data o where o.date=a.date) as eur_gdp,
(Select p.gdp from currency.gbp_macroeconomic_data p where p.date=a.date) as gbp_gdp,
(Select q.gdp from currency.inr_macroeconomic_data q where q.date=a.date) as inr_gdp, 
(Select r.gdp from currency.jpy_macroeconomic_data r where r.date=a.date) as jpy_gdp,
(Select s.gdp from currency.usd_macroeconomic_data s where s.date=a.date) as usd_gdp
from currency.aud_data a
where a.close is not null
and (Select c.close from currency.cad_data c where c.date = a.date) is not null
and (Select e.close from currency.eur_data e where e.date = a.date) is not null
and (Select i.close from currency.inr_data i where i.date = a.date) is not null
and (Select j.close from currency.jpy_data j where j.date = a.date) is not null
and (Select u.close from currency.usd_data u where u.date = a.date) is not null
and	(Select m.fedfunds from currency.aud_macroeconomic_data m where m.date=a.date) is not null
and	(Select n.fedfunds from currency.cad_macroeconomic_data n where n.date=a.date) is not null
and	(Select o.fedfunds from currency.eur_macroeconomic_data o where o.date=a.date) is not null
and	(Select p.fedfunds from currency.gbp_macroeconomic_data p where p.date=a.date) is not null
and	(Select q.fedfunds from currency.inr_macroeconomic_data q where q.date=a.date) is not null 
and	(Select r.fedfunds from currency.jpy_macroeconomic_data r where r.date=a.date) is not null
and	(Select s.fedfunds from currency.usd_macroeconomic_data s where s.date=a.date) is not null
and (Select m.unrate from currency.aud_macroeconomic_data m where m.date=a.date) is not null
and (Select n.unrate from currency.cad_macroeconomic_data n where n.date=a.date) is not null
and (Select o.unrate from currency.eur_macroeconomic_data o where o.date=a.date) is not null
and (Select p.unrate from currency.gbp_macroeconomic_data p where p.date=a.date) is not null
and (Select q.unrate from currency.inr_macroeconomic_data q where q.date=a.date) is not null 
and (Select r.unrate from currency.jpy_macroeconomic_data r where r.date=a.date) is not null
and (Select s.unrate from currency.usd_macroeconomic_data s where s.date=a.date) is not null
and (Select m.gdp from currency.aud_macroeconomic_data m where m.date=a.date) is not null
and (Select n.gdp from currency.cad_macroeconomic_data n where n.date=a.date) is not null
and (Select o.gdp from currency.eur_macroeconomic_data o where o.date=a.date) is not null
and (Select p.gdp from currency.gbp_macroeconomic_data p where p.date=a.date) is not null
and (Select q.gdp from currency.inr_macroeconomic_data q where q.date=a.date) is not null 
and (Select r.gdp from currency.jpy_macroeconomic_data r where r.date=a.date) is not null
and (Select s.gdp from currency.usd_macroeconomic_data s where s.date=a.date) is not null;



Select avg(a.close) as avg_AUD_GBP_Rate,
(Select avg(c.close) from currency.cad_data c where c.date >= '2022-11-21') as avg_CAD_GBP_Rate,
(Select avg(e.close) from currency.eur_data e where e.date >= '2022-11-21') as avg_EUR_GBP_Rate,
(Select avg(i.close) from currency.inr_data i where i.date >= '2022-11-21') as avg_INR_GBP_Rate,
(Select avg(j.close) from currency.jpy_data j where j.date >= '2022-11-21') as avg_JPY_GBP_Rate,
(Select avg(u.close) from currency.usd_data u where u.date >= '2022-11-21') as avg_USD_GBP_Rate,
(Select avg(a.close) from currency.aud_data a where a.date >= '2014-11-21') as avg_AUD_GBP_Rate_10years,
(Select avg(c.close) from currency.cad_data c where c.date >= '2014-11-21') as avg_CAD_GBP_Rate_10years,
(Select avg(e.close) from currency.eur_data e where e.date >= '2014-11-21') as avg_EUR_GBP_Rate_10years,
(Select avg(i.close) from currency.inr_data i where i.date >= '2014-11-21') as avg_INR_GBP_Rate_10years,
(Select avg(j.close) from currency.jpy_data j where j.date >= '2014-11-21') as avg_JPY_GBP_Rate_10years,
(Select avg(u.close) from currency.usd_data u where u.date >= '2014-11-21') as avg_USD_GBP_Rate_10years,
(Select max(c.close) from currency.cad_data c where c.date >= '2014-11-21') as max_CAD_GBP_Rate_10years,
(Select max(e.close) from currency.eur_data e where e.date >= '2014-11-21') as max_EUR_GBP_Rate_10years,
(Select max(i.close) from currency.inr_data i where i.date >= '2014-11-21') as max_INR_GBP_Rate_10years,
(Select max(j.close) from currency.jpy_data j where j.date >= '2014-11-21') as max_JPY_GBP_Rate_10years,
(Select max(u.close) from currency.usd_data u where u.date >= '2014-11-21') as max_USD_GBP_Rate_10years,
(Select min(c.close) from currency.cad_data c where c.date >= '2014-11-21') as min_CAD_GBP_Rate_10years,
(Select min(e.close) from currency.eur_data e where e.date >= '2014-11-21') as min_EUR_GBP_Rate_10years,
(Select min(i.close) from currency.inr_data i where i.date >= '2014-11-21') as min_INR_GBP_Rate_10years,
(Select min(j.close) from currency.jpy_data j where j.date >= '2014-11-21') as min_JPY_GBP_Rate_10years,
(Select min(u.close) from currency.usd_data u where u.date >= '2014-11-21') as min_USD_GBP_Rate_10years,
(Select max(c.close) from currency.cad_data c where c.date >= '2022-11-21') as max_CAD_GBP_Rate_2years,
(Select max(e.close) from currency.eur_data e where e.date >= '2022-11-21') as max_EUR_GBP_Rate_2years,
(Select max(i.close) from currency.inr_data i where i.date >= '2022-11-21') as max_INR_GBP_Rate_2years,
(Select max(j.close) from currency.jpy_data j where j.date >= '2022-11-21') as max_JPY_GBP_Rate_2years,
(Select max(u.close) from currency.usd_data u where u.date >= '2022-11-21') as max_USD_GBP_Rate_2years,
(Select min(c.close) from currency.cad_data c where c.date >= '2022-11-21') as min_CAD_GBP_Rate_10years,
(Select min(e.close) from currency.eur_data e where e.date >= '2022-11-21') as min_EUR_GBP_Rate_10years,
(Select min(i.close) from currency.inr_data i where i.date >= '2022-11-21') as min_INR_GBP_Rate_10years,
(Select min(j.close) from currency.jpy_data j where j.date >= '2022-11-21') as min_JPY_GBP_Rate_10years,
(Select min(u.close) from currency.usd_data u where u.date >= '2022-11-21') as min_USD_GBP_Rate_10years
from currency.aud_data a where a.date >= '2022-11-21';
