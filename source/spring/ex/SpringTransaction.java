package spring.ex;

import org.jooq.Transaction;
import org.springframework.transaction.TransactionStatus;

/**
 * Created by umar on 9/15/16.
 */
public class SpringTransaction implements Transaction {
    final TransactionStatus tx;

    SpringTransaction(TransactionStatus tx) {
        this.tx = tx;
    }
}
