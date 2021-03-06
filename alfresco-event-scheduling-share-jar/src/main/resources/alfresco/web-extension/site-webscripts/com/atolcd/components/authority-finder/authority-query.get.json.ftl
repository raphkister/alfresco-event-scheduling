<#macro authorityJSON authority>
   <#assign metadata = authority.metadata>
   <#escape x as jsonUtils.encodeJSONString(x)>
  {
      "authorityType": "${authority.authorityType}",
      "shortName": "${authority.shortName}",
      "fullName": "${authority.fullName}",
      "displayName": "${authority.displayName}",
      "metadata":
      {
      <#if authority.authorityType = "USER">
         "avatar": "${metadata.avatar!""}",
         "jobTitle": "${metadata.jobTitle!""}",
         "organization": "${metadata.organization!""}"
      </#if>
      }
   }
   </#escape>
</#macro>
{
   "authorities":
   [
      <#if args.sortBy??>
       <#list authorities?sort_by(args.sortBy) as authority>
          <@authorityJSON authority=authority/><#if authority_has_next>,</#if>
       </#list>
      <#else>
       <#list authorities as authority>
          <@authorityJSON authority=authority/><#if authority_has_next>,</#if>
       </#list>
      </#if>
   ]
}