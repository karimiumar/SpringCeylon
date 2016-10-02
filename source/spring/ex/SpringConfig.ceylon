import ceylon.interop.java {
    javaClass
}
import ceylon.time {
    Instant,
    now
}
import javax.inject {
    inject
}
import javax.sql {
    DataSource
}
import org.jooq {
    SQLDialect {
        mysqlDialect = \iMYSQL
    },
    DSLContext,
    Configuration,
    TransactionProvider,
    ConnectionProvider
}
import org.springframework.boot.autoconfigure { springBootApplication }
import org.springframework.boot { SpringApplication }
import org.springframework.context.annotation {
    configuration,
    enableAspectJAutoProxy,
    componentScan,
    bean,
    propertySource,
    AdviceMode
}
import org.springframework.jdbc.datasource {
    TransactionAwareDataSourceProxy,
    DataSourceTransactionManager
}
import org.springframework.transaction {
    PlatformTransactionManager
}

import ceylon.logging {
    addLogWriter,
    writeSimpleLog,
    logger,
    Logger
}

import com.mysql.jdbc.jdbc2.optional {
    MysqlDataSource
}
import org.springframework.transaction.annotation {
    enableTransactionManagement
}
import org.jooq.impl {
    DataSourceConnectionProvider
}


shared Logger log = logger(`module spring.ex`);

configuration
propertySource {
    ignoreResourceNotFound = true;
    \ivalue = {"classpath:/application.properties"};
}
componentScan({"jooq.metadata", "the.noorani.labs"})
enableTransactionManagement{mode = AdviceMode.aspectj;}
enableAspectJAutoProxy { proxyTargetClass = false; }
shared class AppConfig(){

    shared bean default Instant startupTime() => now();


    shared bean default DataSource ds() {
        value datasource = MysqlDataSource();
        datasource.databaseName = "nooranidb";
        datasource.user = "<user>";
        datasource.setPassword("<password>");
        datasource.setURL("jdbc:mysql://localhost:3306/nooranidb");
        return datasource;
    }

    shared bean default PlatformTransactionManager txManager() =>
            DataSourceTransactionManager(ds());

    shared bean default ConnectionProvider connectionProvider(DataSource datasource) =>
            DataSourceConnectionProvider(TransactionAwareDataSourceProxy(ds()));

    shared bean default TransactionProvider transactionProvider() =>
            SpringTransactionProvider();

}


springBootApplication shared class Application() {

    addLogWriter(writeSimpleLog);

}



shared void run() => SpringApplication.run(javaClass<Application>());
