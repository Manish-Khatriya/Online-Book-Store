package book.mgmt.dao;

import book.mgmt.entities.Book;
import java.util.List;

public interface Bookdao {
    int addBook(Book book) throws Exception;
    int updateBook(Book book) throws Exception;
    int deleteBookByBarcode(String barcode) throws Exception;
    public Book getBookById(int id) throws Exception;
    public List<Book> getAllBooks() throws Exception;
}
