package work.iamport.dao;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import work.iamport.PaymentBean;
import work.iamport.model.PaymentVO;

@Repository
public class PaymentDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public void insertPaymentSuccess(PaymentBean bean){
		sqlSession.insert("payment.insertPaymentSuccess", bean);
	}
	
	
	
	
	
//	private static SqlSessionFactory sqlMapper;
//	
//	private static SqlSessionFactory getInstance() {
//		if (sqlMapper == null) {
//			String resource = "SqlMapConfig.xml";
//			try {
//				Reader reader = Resources.getResourceAsReader(resource);
//				sqlMapper = new SqlSessionFactoryBuilder().build(reader);
//				reader.close();
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//		}
//		return sqlMapper;
//	}
//	
//	public void insertPaymentSuccess(PaymentBean bean) {
//		sqlMapper = getInstance();
//		SqlSession session = sqlMapper.openSession();
//		session.insert("payment.insertPaymentSuccess", bean);
//		session.commit();
//	}
}


