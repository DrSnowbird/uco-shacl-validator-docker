# Test the Bug-Fix-153 branch
```
13/01/2023 20:50:00 INFO  [] o.h.validator.internal.util.Version - HV000001: Hibernate Validator 6.2.5.Final
13/01/2023 20:50:00 INFO  [] eu.europa.ec.itb.shacl.Application - Starting Application using Java 11.0.14.1 on 192.168.0.125 with PID 15 (/home/developer/app/validator/validator.jar started by developer in /home/developer/app)
13/01/2023 20:50:00 INFO  [] eu.europa.ec.itb.shacl.Application - No active profile set, falling back to 1 default profile: "default"
13/01/2023 20:50:01 INFO  [] o.s.b.w.e.tomcat.TomcatWebServer - Tomcat initialized with port(s): 8080 (http)
13/01/2023 20:50:01 INFO  [] o.a.coyote.http11.Http11NioProtocol - Initializing ProtocolHandler ["http-nio-8080"]
13/01/2023 20:50:01 INFO  [] o.a.catalina.core.StandardService - Starting service [Tomcat]
13/01/2023 20:50:01 INFO  [] o.a.catalina.core.StandardEngine - Starting Servlet engine: [Apache Tomcat/9.0.70]
13/01/2023 20:50:01 INFO  [] o.a.c.c.C.[.[localhost].[/shacl] - Initializing Spring embedded WebApplicationContext
13/01/2023 20:50:01 INFO  [] o.s.b.w.s.c.ServletWebServerApplicationContext - Root WebApplicationContext: initialization completed in 1507 ms
13/01/2023 20:50:01 INFO  [] e.e.e.i.v.c.config.ApplicationConfig - Loaded validation domains: [UCO, any]
13/01/2023 20:50:01 INFO  [] e.e.e.i.v.c.config.ApplicationConfig - Loaded validation domain names: [UCO]=[UCO][any]=[any]
13/01/2023 20:50:02 INFO  [] e.e.e.i.v.c.config.DomainConfigCache - Loaded configuration for domain [UCO]
13/01/2023 20:50:02 INFO  [] e.e.e.i.v.c.config.DomainConfigCache - Setting default validation type for domain [any] to only validation type provided [any].
13/01/2023 20:50:02 INFO  [] e.e.e.i.v.c.config.DomainConfigCache - Loaded configuration for domain [any]
13/01/2023 20:50:02 INFO  [] o.a.c.w.s.f.ReflectionServiceFactoryBean - Creating Service {http://www.gitb.com/vs/v1/}ValidationService from class com.gitb.vs.ValidationService
13/01/2023 20:50:02 INFO  [] org.apache.cxf.endpoint.ServerImpl - Setting the server's publish address to be /UCO/validation
13/01/2023 20:50:02 INFO  [] o.a.c.w.s.f.ReflectionServiceFactoryBean - Creating Service {http://www.gitb.com/vs/v1/}ValidationService from class com.gitb.vs.ValidationService
13/01/2023 20:50:02 INFO  [] org.apache.cxf.endpoint.ServerImpl - Setting the server's publish address to be /any/validation
13/01/2023 20:50:02 INFO  [] o.s.b.web.servlet.RegistrationBean - Servlet CXFServlet was not registered (possibly already registered?)
13/01/2023 20:50:03 INFO  [] e.e.e.i.v.plugin.PluginManager - No plugins found
13/01/2023 20:50:03 INFO  [] e.e.e.i.s.r.HydraDocumentationConfig - Generated hydra documentation files in [/home/developer/app/validator/tmp/hydra]
13/01/2023 20:50:03 INFO  [] o.s.s.web.DefaultSecurityFilterChain - Will secure any request with [org.springframework.security.web.session.DisableEncodeUrlFilter@17b6d426, org.springframework.security.web.context.request.async.WebAsyncManagerIntegrationFilter@5580d62f, org.springframework.security.web.context.SecurityContextPersistenceFilter@27b2faa6, org.springframework.security.web.header.HeaderWriterFilter@57c47a9e, org.springframework.web.filter.CorsFilter@2c779e5, org.springframework.security.web.authentication.logout.LogoutFilter@5c1f6d57, org.springframework.security.web.savedrequest.RequestCacheAwareFilter@2a685eba, org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter@1d540566, org.springframework.security.web.authentication.AnonymousAuthenticationFilter@16872c4d, org.springframework.security.web.session.SessionManagementFilter@21ac5eb4, org.springframework.security.web.access.ExceptionTranslationFilter@4eed2acf]
13/01/2023 20:50:04 INFO  [] o.a.coyote.http11.Http11NioProtocol - Starting ProtocolHandler ["http-nio-8080"]
13/01/2023 20:50:04 INFO  [] o.s.b.w.e.tomcat.TomcatWebServer - Tomcat started on port(s): 8080 (http) with context path '/shacl'
13/01/2023 20:50:04 INFO  [] eu.europa.ec.itb.shacl.Application - Started Application in 5.035 seconds (JVM running for 6.65)
13/01/2023 20:50:06 INFO  [] o.a.c.c.C.[.[localhost].[/shacl] - Initializing Spring DispatcherServlet 'dispatcherServlet'
13/01/2023 20:50:06 INFO  [] o.s.web.servlet.DispatcherServlet - Initializing Servlet 'dispatcherServlet'
13/01/2023 20:50:06 INFO  [] o.s.web.servlet.DispatcherServlet - Completed initialization in 1 ms
13/01/2023 20:50:40 INFO  [UCO] e.e.e.i.s.validation.SHACLValidator - Starting validation..
13/01/2023 20:50:40 INFO  [UCO] e.e.e.i.s.validation.SHACLValidator - Validating against [configuration.ttl]
13/01/2023 20:50:40 INFO  [UCO] e.e.e.i.s.validation.SHACLValidator - Validating against [action.ttl]
13/01/2023 20:50:40 INFO  [UCO] e.e.e.i.s.validation.SHACLValidator - Validating against [tool.ttl]
13/01/2023 20:50:40 INFO  [UCO] e.e.e.i.s.validation.SHACLValidator - Validating against [time.ttl]
13/01/2023 20:50:40 INFO  [UCO] e.e.e.i.s.validation.SHACLValidator - Validating against [pattern.ttl]
13/01/2023 20:50:40 INFO  [UCO] e.e.e.i.s.validation.SHACLValidator - Validating against [marking.ttl]
13/01/2023 20:50:40 INFO  [UCO] e.e.e.i.s.validation.SHACLValidator - Validating against [identity.ttl]
13/01/2023 20:50:40 INFO  [UCO] e.e.e.i.s.validation.SHACLValidator - Validating against [victim.ttl]
13/01/2023 20:50:40 INFO  [UCO] e.e.e.i.s.validation.SHACLValidator - Validating against [core.ttl]
13/01/2023 20:50:40 INFO  [UCO] e.e.e.i.s.validation.SHACLValidator - Validating against [analysis.ttl]
13/01/2023 20:50:40 INFO  [UCO] e.e.e.i.s.validation.SHACLValidator - Validating against [types.ttl]
13/01/2023 20:50:40 INFO  [UCO] e.e.e.i.s.validation.SHACLValidator - Validating against [uco.ttl]
13/01/2023 20:50:40 INFO  [UCO] e.e.e.i.s.validation.SHACLValidator - Validating against [vocabulary.ttl]
13/01/2023 20:50:40 INFO  [UCO] e.e.e.i.s.validation.SHACLValidator - Validating against [role.ttl]
13/01/2023 20:50:40 INFO  [UCO] e.e.e.i.s.validation.SHACLValidator - Validating against [location.ttl]
13/01/2023 20:50:40 INFO  [UCO] e.e.e.i.s.validation.SHACLValidator - Validating against [observable.ttl]
13/01/2023 20:50:40 INFO  [UCO] e.e.e.i.s.validation.SHACLValidator - Validating against [owl.ttl]
13/01/2023 20:50:40 INFO  [UCO] e.e.e.i.s.validation.SHACLValidator - Validating against [co.ttl]
13/01/2023 20:50:49 WARN  [UCO] e.e.e.i.s.validation.SHACLValidator - Failed to load import [https://ontology.unifiedcyberontology.org/uco/configuration/1.1.0]: 404 - Not Found
13/01/2023 20:50:49 WARN  [UCO] e.e.e.i.s.validation.SHACLValidator - Failed to load import [http://purl.org/co]: 404 - Not Found
13/01/2023 20:50:49 WARN  [UCO] e.e.e.i.s.validation.SHACLValidator - Failed to load import [https://ontology.unifiedcyberontology.org/uco/analysis/1.1.0]: 404 - Not Found
13/01/2023 20:50:49 WARN  [UCO] e.e.e.i.s.validation.SHACLValidator - Failed to load import [https://ontology.unifiedcyberontology.org/uco/time/1.1.0]: 404 - Not Found
13/01/2023 20:50:49 WARN  [UCO] e.e.e.i.s.validation.SHACLValidator - Failed to load import [https://ontology.unifiedcyberontology.org/uco/role/1.1.0]: 404 - Not Found
13/01/2023 20:50:49 WARN  [UCO] e.e.e.i.s.validation.SHACLValidator - Failed to load import [https://ontology.unifiedcyberontology.org/uco/victim/1.1.0]: 404 - Not Found
13/01/2023 20:50:49 WARN  [UCO] e.e.e.i.s.validation.SHACLValidator - Failed to load import [https://ontology.unifiedcyberontology.org/uco/identity/1.1.0]: 404 - Not Found
13/01/2023 20:50:49 WARN  [UCO] e.e.e.i.s.validation.SHACLValidator - Failed to load import [https://ontology.unifiedcyberontology.org/uco/marking/1.1.0]: 404 - Not Found
13/01/2023 20:50:49 WARN  [UCO] e.e.e.i.s.validation.SHACLValidator - Failed to load import [https://ontology.unifiedcyberontology.org/uco/core/1.1.0]: 404 - Not Found
13/01/2023 20:50:49 WARN  [UCO] e.e.e.i.s.validation.SHACLValidator - Failed to load import [https://ontology.unifiedcyberontology.org/uco/action/1.1.0]: 404 - Not Found
13/01/2023 20:50:49 WARN  [UCO] e.e.e.i.s.validation.SHACLValidator - Failed to load import [https://ontology.unifiedcyberontology.org/co/1.1.0]: 404 - Not Found
13/01/2023 20:50:49 WARN  [UCO] e.e.e.i.s.validation.SHACLValidator - Failed to load import [https://ontology.unifiedcyberontology.org/uco/vocabulary/1.1.0]: 404 - Not Found
13/01/2023 20:50:49 WARN  [UCO] e.e.e.i.s.validation.SHACLValidator - Failed to load import [https://ontology.unifiedcyberontology.org/uco/pattern/1.1.0]: 404 - Not Found
13/01/2023 20:50:49 WARN  [UCO] e.e.e.i.s.validation.SHACLValidator - Failed to load import [https://ontology.unifiedcyberontology.org/uco/location/1.1.0]: 404 - Not Found
13/01/2023 20:50:49 WARN  [UCO] e.e.e.i.s.validation.SHACLValidator - Failed to load import [https://ontology.unifiedcyberontology.org/uco/tool/1.1.0]: 404 - Not Found
13/01/2023 20:50:49 WARN  [UCO] e.e.e.i.s.validation.SHACLValidator - Failed to load import [https://ontology.unifiedcyberontology.org/owl/1.1.0]: 404 - Not Found
13/01/2023 20:50:49 WARN  [UCO] e.e.e.i.s.validation.SHACLValidator - Failed to load import [https://ontology.unifiedcyberontology.org/uco/types/1.1.0]: 404 - Not Found
13/01/2023 20:50:49 WARN  [UCO] e.e.e.i.s.validation.SHACLValidator - Failed to load import [https://ontology.unifiedcyberontology.org/uco/observable/1.1.0]: 404 - Not Found
13/01/2023 20:50:49 INFO  [UCO] e.e.e.i.s.validation.SHACLValidator - Using provided data content type [application/ld+json] as [JSON-LD]
13/01/2023 20:50:51 INFO  [UCO] e.e.e.i.s.validation.SHACLValidator - Completed validation.
```

# Validation Results
- [device.json + Bug-Fix-153 Branch](https://raw.githubusercontent.com/casework/CASE-Examples/master/examples/illustrations/device/device.json)
  * SUCCESS - No error!
- [location.json + Bug-Fix-153 Branch](https://raw.githubusercontent.com/casework/CASE-Examples/master/examples/illustrations/location/location.json)
  * SUCCESS - No error!

# Review results:
- PASS Test
- Bug-Fix-153 is cleared to merge

