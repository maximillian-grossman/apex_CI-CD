create or replace force editionable view master_mapping (
    facility_id,
    directory,
    facility_disp,
    facility_desc,
    building_id,
    fk_facility_id,
    encounter_org,
    aff_fac_pool_alias,
    cluster_,
    bldg_disp,
    bldg_desc,
    nursing_unit_id,
    fk_building_id,
    nurse_unit_disp,
    nurse_unit_desc,
    nu_outbound_alias,
    service_id,
    fk_nursing_unit_id,
    patient_type,
    patient_type_alias,
    medical_service,
    op_prefix,
    aff_srvc_pool_alias,
    med_svc_alias,
    patient_service_code,
    patient_service_description,
    status,
    added_dt,
    inactive_dt
) as
    select
        fac_directory.facility_id                  as facility_id,
        fac_directory.directory                    as directory,
        fac_directory.facility_disp                as facility_disp,
        fac_directory.facility_desc                as facility_desc,
        bldg_directory.building_id                 as building_id,
        bldg_directory.fk_facility_id              as fk_facility_id,
        bldg_directory.encounter_org               as encounter_org,
        bldg_directory.aff_fac_pool_alias          as aff_fac_pool_alias,
        bldg_directory.cluster_                    as cluster_,
        bldg_directory.bldg_disp                   as bldg_disp,
        bldg_directory.bldg_desc                   as bldg_desc,
        nu_directory.nursing_unit_id               as nursing_unit_id,
        nu_directory.fk_building_id                as fk_building_id,
        nu_directory.nurse_unit_disp               as nurse_unit_disp,
        nu_directory.nurse_unit_desc               as nurse_unit_desc,
        nu_directory.nu_outbound_alias             as nu_outbound_alias,
        svcs_directory.service_id                  as service_id,
        svcs_directory.fk_nursing_unit_id          as fk_nursing_unit_id,
        svcs_directory.patient_type                as patient_type,
        svcs_directory.patient_type_alias          as patient_type_alias,
        svcs_directory.medical_service             as medical_service,
        svcs_directory.op_prefix                   as op_prefix,
        svcs_directory.aff_srvc_pool_alias         as aff_srvc_pool_alias,
        svcs_directory.med_svc_alias               as med_svc_alias,
        svcs_directory.patient_service_code        as patient_service_code,
        svcs_directory.patient_service_description as patient_service_description,
        svcs_directory.status                      as status,
        svcs_directory.added_dt                    as added_dt,
        svcs_directory.inactive_dt                 as inactive_dt
    from
        svcs_directory svcs_directory,
        nu_directory   nu_directory,
        fac_directory  fac_directory,
        bldg_directory bldg_directory
    where
            fac_directory.facility_id = bldg_directory.fk_facility_id
        and bldg_directory.building_id = nu_directory.fk_building_id
        and nu_directory.nursing_unit_id = svcs_directory.fk_nursing_unit_id;


-- sqlcl_snapshot {"hash":"cf4d1a4ba7538930f7db4fba3e6e225717224b1e","type":"VIEW","name":"MASTER_MAPPING","schemaName":"MOVIESTREAM","sxml":""}