package spring.ex;

import org.jooq.TransactionContext;
import org.jooq.TransactionProvider;
import org.jooq.exception.DataAccessException;
import org.jooq.tools.JooqLogger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

/**
 * Created by umar on 9/15/16.
 */
public class SpringTransactionProvider implements TransactionProvider {

    private static final JooqLogger log = JooqLogger.getLogger(SpringTransactionProvider.class);

    @Autowired
    DataSourceTransactionManager txMgr;

    @Override
    public void begin(TransactionContext ctx) throws DataAccessException {
        log.info("Begin Transaction");
        TransactionStatus status = txMgr.getTransaction(new DefaultTransactionDefinition(TransactionDefinition.PROPAGATION_NESTED));
        ctx.transaction(new SpringTransaction(status));
    }

    @Override
    public void commit(TransactionContext ctx) throws DataAccessException {
        log.info("commit transaction");
        txMgr.commit(((SpringTransaction)ctx.transaction()).tx);
    }

    @Override
    public void rollback(TransactionContext ctx) throws DataAccessException {
        log.info("rollback transaction");
        txMgr.rollback(((SpringTransaction)ctx.transaction()).tx);
    }
}
