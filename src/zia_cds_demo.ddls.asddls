@AbapCatalog.sqlViewName: 'ZIA_CDS_VIEW'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'scarr'
@Metadata.ignorePropagatedAnnotations: true
define view zia_cds_demo as select from /dmo/carrier
{
    key carrier_id as CarrierId,
    name as Name,
    currency_code as CurrencyCode,
    local_created_by as LocalCreatedBy,
    local_created_at as LocalCreatedAt,
    local_last_changed_by as LocalLastChangedBy,
    local_last_changed_at as LocalLastChangedAt,
    last_changed_at as LastChangedAt,
    
    case
        when carrier_id = 'SQ' then 'Asian airline'
    else 'Another airline'    
    end as GroupType,
    
    concat_with_space( carrier_id, currency_code, 2 ) as ConcatenatedName
    //dats_add_days( cast( local_created_at as abap.dats) , '5', 'FAIL' ) as LocalCreatedAtPlus5Days
}
