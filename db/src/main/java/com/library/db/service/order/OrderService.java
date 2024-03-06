package com.library.db.service.order;

import com.library.db.entity.book.Book;
import com.library.db.entity.book.BookOrder;
import com.library.db.entity.order.Orders;
import com.library.db.entity.user.Users;
import com.library.db.record.PaginationResponse;
import com.library.db.record.book.BookRecord;
import com.library.db.record.order.OrderRecord;
import com.library.db.repository.book.BookRepository;
import com.library.db.repository.order.BookOrderRepository;
import com.library.db.repository.order.OrderRepository;
import com.library.db.repository.user.UsersRepository;
import com.library.db.utils.OrderStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class OrderService {

    @Autowired
    private  OrderRepository orderRepository;

    @Autowired
    private UsersRepository usersRepository;

    @Autowired
    private BookRepository bookRepository;

    @Autowired
    private BookOrderRepository bookOrderRepository;


    public Orders getOrderById(Long id) {
        return orderRepository.findOrderById(id);
    }
    
    public void deleteOrderById(Long id){
       orderRepository.deleteById(id);
    }

    public PaginationResponse<Orders> getAllOrders(Integer orderNumber, String mail, Long userId, Integer currentPage, Integer pageSize) {
        Pageable pageable = PageRequest.of(currentPage, pageSize);
        PaginationResponse<Orders> response = orderRepository.findOrdersByFilter(pageable, orderNumber, mail);
        return response;
    }

    public Orders createNewOrder (OrderRecord orderRecord, Long userId){
        Orders order = new Orders();
        Optional<Users> currentUser = usersRepository.findById(userId);
        order.setOrderNumber(order.getOrderNumber());
        order.setBookingDate(Date.from(LocalDate.now().atStartOfDay(ZoneId.systemDefault()).toInstant()));
        order.setOrderTotal(order.getOrderTotal());
        order.setAddress(order.getAddress());
        order.setCurrentOrder(true);
        order.setUser(currentUser.get());
        order.setOrderStatus(OrderStatus.IN_PROGRESS.name());
        Orders savedOrder = orderRepository.save(order);

        if (savedOrder != null){
            // trovo l'utente con l'id con findById
            if (currentUser.get() != null) {
                Users user = currentUser.get();
                user.setOrders(List.of(savedOrder));
                usersRepository.save(user);
            };
            // Aggiungi i record alla tabella BOOK_ORDERS
            for (BookRecord book : orderRecord.books()) {
                Optional<Book> bookEntity = bookRepository.findById(book.id());
                bookEntity.ifPresent(b -> {
                    BookOrder bookOrder = new BookOrder();
                    bookOrder.setOrderId(savedOrder.getId());
                    bookOrder.setBookId(b.getId());
                    bookOrderRepository.save(bookOrder);
                });
            }
        }
        return savedOrder;
    }

}