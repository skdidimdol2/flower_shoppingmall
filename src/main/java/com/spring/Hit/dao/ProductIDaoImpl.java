package com.spring.Hit.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.Hit.dto.BasketDto;
import com.spring.Hit.dto.MemberDto;
import com.spring.Hit.dto.OrderDto;
import com.spring.Hit.dto.ProductDto;
import com.spring.Hit.dto.ReviewDto;

@Repository
public class ProductIDaoImpl implements ProductIDao, BasketIDao {

	@Inject
	private SqlSession session;

	private static String namespace = "com.spring.Hit.dao.ProductIDao";

	@Override // ��ǰ ��� ����(select *)
	public List<ProductDto> listDao(ProductDto pdt) {
		return session.selectList("listDao", pdt);
	}

	@Override // ��ǰ �� ��������(select one), ��ǰ ��� ����(one)
	public ProductDto viewDao(int item_no) {
		return session.selectOne("viewDao", item_no);
	}

	@Override
	public ProductDto searchItem(String item_name) {
		return session.selectOne("searchItem", item_name);
	}

	@Override // ��ٱ��Ͽ� ��ǰ �߰�(insert one)
	public void writebasketDao(BasketDto bt) {
		BasketIDao bd = session.getMapper(BasketIDao.class);
		bd.writebasketDao(bt);
	}

	@Override // ��ٱ��� ���� ����(select *)
	public List<ProductDto> viewbasketDao(BasketDto bdt) {
		return session.selectList("viewbasketDao", bdt);
	}

	@Override // ��ٱ����� ��ǰ ����(delete one)
	public void deletebasketDao(int basket_no) {
		BasketIDao bd = session.getMapper(BasketIDao.class);
		bd.deletebasketDao(basket_no);
	}

	@Override // ��ٱ����� ��ǰ ����(delete select)
	public void delchoiceBasket(int[] list) {
		BasketIDao bd = session.getMapper(BasketIDao.class);
		bd.delchoiceBasket(list);
	}

	@Override
	public List<ProductDto> buychoiceBasket(int[] list) {
		return session.selectList("buychoiceBasket", list);
	}

	// ����

	// ���� ��ü ��� select
	@Override
	public List<ReviewDto> selectAllReview() {
		return session.selectList("selectAllReview");
	}

	// ��ǰ�� ���� ��� ��������
	@Override
	public List<ReviewDto> getReview(int item_no) {
		return session.selectList("getReview", item_no);
	}

	// ������
	@Override
	public void addReview(ReviewDto rd) {
		System.out.println(rd.getId());
		System.out.println(rd.getItem_no());
		System.out.println(rd.getReview_con());
		System.out.println(rd.getReview_tit());
		session.insert("addReview", rd);
	}

	// �������
	@Override
	public void updateReview(ReviewDto rd) {
		session.update("updateReview", rd);
	}

	// �������
	@Override
	public void deleteReview(int review_no) {
		session.delete("deleteReview", review_no);
	}

	// ���� �� ����
	@Override
	public void deleteList(ReviewDto rd) {
		session.delete("deleteList", rd);
	}

	// ���� �Ѱ� ����
	@Override
	public ReviewDto selectReview(int review_no) {
		return session.selectOne("selectReview", review_no);
	}

	// ���� ���� //����¡ ó��
	@Override
	public int reviewCount() {
		return session.selectOne("reviewCount");
	}

	// ������ ����(�ٷα���)
	@Override
	public List<MemberDto> vmemDao(String id) {
		return session.selectList("vmemDao", id);
	}

	// ������ ����(��ٱ���)
	@Override
	public List<MemberDto> bmemDao(String id) {
		return session.selectList("bmemDao", id);
	}

	// ���� ���̺� ����
	@Override
	public void orderinsertDao(OrderDto order) {
		ProductIDao pdo = session.getMapper(ProductIDao.class);
		pdo.orderinsertDao(order);
	}

	// ��ٱ��� ���� ����
	@Override
	public void orderbasketins(OrderDto order) {
		BasketIDao bdo = session.getMapper(BasketIDao.class);
		bdo.orderbasketins(order);

	}

	// �ֹ� ��� ����
	@Override
	public List<OrderDto> vieworderDao(String id) {

		return session.selectList("vieworderDao", id);
	}

	// �ֱ� �ֹ� ��� ����
	@Override
	public List<OrderDto> viewRecentOrderDao(String id) {
		return session.selectList("viewRecentOrderDao", id);
	}

	// ���� ���
	@Override
	public void deleteorder(int order_no) {
		ProductIDao pdo = session.getMapper(ProductIDao.class);
		pdo.deleteorder(order_no);
	}

	// �ֹ� ��� ���
	@Override
	public void orderdel(int order_no) {
		session.update("orderdel", order_no);

	}

	// ��� ���� ����
	@Override
	public void minuspd(OrderDto order) {
		ProductIDao pdo = session.getMapper(ProductIDao.class);
		pdo.minuspd(order);
	}

	// ������ ���ϱ�
	@Override
	public void pluspd(OrderDto order) {
		ProductIDao pdo = session.getMapper(ProductIDao.class);
		pdo.pluspd(order);
	}
	//���������� ���� id�� ����Ʈ
	@Override
	public List<ReviewDto> getReviewList(String id) {
		// TODO Auto-generated method stub
		
		return session.selectList("getReviewList", id);
	}

}
