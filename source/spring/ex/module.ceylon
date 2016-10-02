"Default documentation for module `spring.ex`."
native ("jvm")
module spring.ex "1.0.0" {
    shared import java.jdbc "8";
    shared import ceylon.test "1.2.2";
    shared import ceylon.dbc "1.2.2";
    shared import ceylon.transaction "1.2.2";
    shared import maven:"org.jooq:jooq" "3.8.4";
    shared import maven:"org.jooq:jooq-meta" "3.8.4";
    shared import maven:"org.jooq:jooq-codegen" "3.8.4";
    shared import java.base "8";
    shared import javax.jaxws "8";
    shared import javax.annotation "8";
    shared import maven:"javax.inject:javax.inject" "1";
    shared import ceylon.interop.java "1.2.2";
    shared import ceylon.time "1.2.2";
    shared import ceylon.logging "1.2.2";
    shared import maven:"com.zaxxer:HikariCP-java6" "2.3.9";
    shared import maven:"mysql:mysql-connector-java" "5.1.6";
    shared import maven:"org.springframework.boot:spring-boot-starter-web" "1.3.2.RELEASE";
    shared import maven:"org.springframework.boot:spring-boot-starter-jdbc" "1.3.2.RELEASE";
    shared import maven:"org.springframework:spring-context" "4.2.4.RELEASE";
    shared import maven:"org.springframework:spring-jdbc" "4.2.4.RELEASE";
    shared import maven:"org.springframework:spring-tx" "4.2.4.RELEASE";
    shared import maven:"org.springframework:spring-aspects" "4.2.4.RELEASE";
    shared import maven:"org.aspectj:aspectjtools" "1.6.2";
    shared import maven:"org.springframework.security:spring-security-web" "4.0.3.RELEASE";
    shared import maven:"org.springframework.security:spring-security-config" "4.0.3.RELEASE";
    shared import maven:"org.springframework.security:spring-security-taglibs" "4.0.3.RELEASE";
    shared import maven:"org.springframework.security:spring-security-core" "4.0.3.RELEASE";
}
