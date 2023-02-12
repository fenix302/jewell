package work.iamport.service;



import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import work.iamport.PaymentBean;
import work.iamport.dao.PaymentDAO;
import work.iamport.model.PaymentVO;

@Service("paymentService")
public class PaymentServiceImpl implements PaymentService {

	
	@Resource(name = "paymentDAO")
	private PaymentDAO paymentDAO;
	
	public void insertPaymentSuccess(PaymentBean bean) {

		paymentDAO.insertPaymentSuccess(bean);		
	}
}
