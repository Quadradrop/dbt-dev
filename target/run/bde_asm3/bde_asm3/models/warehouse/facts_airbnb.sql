
  
    

  create  table "postgres"."warehouse"."facts_airbnb__dbt_tmp"
  
  
    as
  
  (
    WITH check_dimensions AS (
    SELECT
        CASE
            WHEN listing_id IN (SELECT DISTINCT listing_id FROM "postgres"."staging"."listings_property_stg")
            THEN listing_id
            ELSE 0
        END AS listing_id,
        CASE
            WHEN LOWER(listing_neighbourhood) IN (SELECT DISTINCT LOWER(SUBURB_NAME) FROM "postgres"."staging"."lga_suburb_stg")
            THEN listing_neighbourhood
            ELSE 'unknown'
        END AS listing_neighbourhood,
        CASE
            WHEN host_id IN (SELECT DISTINCT host_id FROM "postgres"."staging"."listings_host_stg")
            THEN host_id
            ELSE 0
        END AS host_id,
        scraped_date,
		price,
        has_availability,
        availability_30,
        number_of_reviews,
        review_scores_rating,
        review_scores_accuracy,
        review_scores_cleanliness,
        review_scores_checkin,
        review_scores_communication,
        review_scores_value
    FROM "postgres"."staging"."airbnb_stg"
)

SELECT
    a.listing_id,
    a.listing_neighbourhood,
    a.scraped_date,
    a.has_availability,
    a.availability_30,
    a.price,
    a.number_of_reviews,
    a.review_scores_rating,
    a.review_scores_accuracy,
    a.review_scores_cleanliness,
    a.review_scores_checkin,
    a.review_scores_communication,
    a.review_scores_value,
    a.host_id,
    f.host_name,
    f.host_since,
    f.host_is_superhost,
    f.host_neighbourhood,
    g.property_type,
    h.room_type,
    h.accommodates,
    b.lga_name,
	b.suburb_name,
    d.Tot_P_M,
	d.Tot_P_F,
	d.Tot_P_P,
	d.Age_0_4_yr_M,
	d.Age_0_4_yr_F,
	d.Age_0_4_yr_P,
	d.Age_5_14_yr_M,
	d.Age_5_14_yr_F,
	d.Age_5_14_yr_P,
	d.Age_15_19_yr_M,
	d.Age_15_19_yr_F,
	d.Age_15_19_yr_P,
	d.Age_20_24_yr_M,
	d.Age_20_24_yr_F,
	d.Age_20_24_yr_P,
	d.Age_25_34_yr_M,
	d.Age_25_34_yr_F,
	d.Age_25_34_yr_P,
	d.Age_35_44_yr_M,
	d.Age_35_44_yr_F,
	d.Age_35_44_yr_P,
	d.Age_45_54_yr_M,
	d.Age_45_54_yr_F,
	d.Age_45_54_yr_P,
	d.Age_55_64_yr_M,
	d.Age_55_64_yr_F,
	d.Age_55_64_yr_P,
	d.Age_65_74_yr_M,
	d.Age_65_74_yr_F,
	d.Age_65_74_yr_P,
	d.Age_75_84_yr_M,
	d.Age_75_84_yr_F,
	d.Age_75_84_yr_P,
	d.Age_85ov_M,
	d.Age_85ov_F,
	d.Age_85ov_P,
	d.Counted_Census_Night_home_M,
	d.Counted_Census_Night_home_F,
	d.Counted_Census_Night_home_P,
	d.Count_Census_Nt_Ewhere_Aust_M,
	d.Count_Census_Nt_Ewhere_Aust_F,
	d.Count_Census_Nt_Ewhere_Aust_P,
	d.Indigenous_psns_Aboriginal_M,
	d.Indigenous_psns_Aboriginal_F,
	d.Indigenous_psns_Aboriginal_P,
	d.Indig_psns_Torres_Strait_Is_M,
	d.Indig_psns_Torres_Strait_Is_F,
	d.Indig_psns_Torres_Strait_Is_P,
	d.Indig_Bth_Abor_Torres_St_Is_M,
	d.Indig_Bth_Abor_Torres_St_Is_F,
	d.Indig_Bth_Abor_Torres_St_Is_P,
	d.Indigenous_P_Tot_M,
	d.Indigenous_P_Tot_F,
	d.Indigenous_P_Tot_P,
	d.Birthplace_Australia_M,
	d.Birthplace_Australia_F,
	d.Birthplace_Australia_P,
	d.Birthplace_Elsewhere_M,
	d.Birthplace_Elsewhere_F,
	d.Birthplace_Elsewhere_P,
	d.Lang_spoken_home_Eng_only_M,
	d.Lang_spoken_home_Eng_only_F,
	d.Lang_spoken_home_Eng_only_P,
	d.Lang_spoken_home_Oth_Lang_M,
	d.Lang_spoken_home_Oth_Lang_F,
	d.Lang_spoken_home_Oth_Lang_P,
	d.Australian_citizen_M,
	d.Australian_citizen_F,
	d.Australian_citizen_P,
	d.Age_psns_att_educ_inst_0_4_M,
	d.Age_psns_att_educ_inst_0_4_F,
	d.Age_psns_att_educ_inst_0_4_P,
	d.Age_psns_att_educ_inst_5_14_M,
	d.Age_psns_att_educ_inst_5_14_F,
	d.Age_psns_att_educ_inst_5_14_P,
	d.Age_psns_att_edu_inst_15_19_M,
	d.Age_psns_att_edu_inst_15_19_F,
	d.Age_psns_att_edu_inst_15_19_P,
	d.Age_psns_att_edu_inst_20_24_M,
	d.Age_psns_att_edu_inst_20_24_F,
	d.Age_psns_att_edu_inst_20_24_P,
	d.Age_psns_att_edu_inst_25_ov_M,
	d.Age_psns_att_edu_inst_25_ov_F,
	d.Age_psns_att_edu_inst_25_ov_P,
	d.High_yr_schl_comp_Yr_12_eq_M,
	d.High_yr_schl_comp_Yr_12_eq_F,
	d.High_yr_schl_comp_Yr_12_eq_P,
	d.High_yr_schl_comp_Yr_11_eq_M,
	d.High_yr_schl_comp_Yr_11_eq_F,
	d.High_yr_schl_comp_Yr_11_eq_P,
	d.High_yr_schl_comp_Yr_10_eq_M,
	d.High_yr_schl_comp_Yr_10_eq_F,
	d.High_yr_schl_comp_Yr_10_eq_P,
	d.High_yr_schl_comp_Yr_9_eq_M,
	d.High_yr_schl_comp_Yr_9_eq_F,
	d.High_yr_schl_comp_Yr_9_eq_P,
	d.High_yr_schl_comp_Yr_8_belw_M,
	d.High_yr_schl_comp_Yr_8_belw_F,
	d.High_yr_schl_comp_Yr_8_belw_P,
	d.High_yr_schl_comp_D_n_g_sch_M,
	d.High_yr_schl_comp_D_n_g_sch_F,
	d.High_yr_schl_comp_D_n_g_sch_P,
	d.Count_psns_occ_priv_dwgs_M,
	d.Count_psns_occ_priv_dwgs_F,
	d.Count_psns_occ_priv_dwgs_P,
	d.Count_Persons_other_dwgs_M,
	d.Count_Persons_other_dwgs_F,
	d.Count_Persons_other_dwgs_P,
    e.median_age_persons,
    e.median_mortgage_repay_monthly,
    e.median_tot_prsnl_inc_weekly,
    e.median_rent_weekly,
    e.median_tot_fam_inc_weekly,
    e.average_num_psns_per_bedroom,
    e.median_tot_hhd_inc_weekly,
    e.average_household_size
FROM check_dimensions AS a
LEFT JOIN staging.lga_suburb_stg AS b ON LOWER(a.listing_neighbourhood) = LOWER(b.suburb_name)
LEFT JOIN staging.lga_code_stg AS c ON LOWER(b.lga_name) = LOWER(c.lga_name)
LEFT JOIN staging.g01_stg AS d ON c.lga_code = d.lga_code
LEFT JOIN staging.g02_stg AS e ON c.lga_code = e.lga_code
LEFT JOIN staging.listings_host_stg AS f ON a.host_id = f.host_id AND a.scraped_date::timestamp BETWEEN f.dbt_valid_from AND COALESCE(f.dbt_valid_to, '9999-12-31'::timestamp)
LEFT JOIN staging.listings_property_stg AS g ON a.listing_id = g.listing_id AND a.scraped_date::timestamp BETWEEN g.dbt_valid_from AND COALESCE(g.dbt_valid_to, '9999-12-31'::timestamp)
LEFT JOIN staging.listings_room_stg AS h ON a.listing_id = h.listing_id AND a.scraped_date::timestamp BETWEEN h.dbt_valid_from AND COALESCE(h.dbt_valid_to, '9999-12-31'::timestamp)
  );
  