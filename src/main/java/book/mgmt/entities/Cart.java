package book.mgmt.entities; // Replace with your actual package name


public class Cart {
    private Book book;

    public Cart(Book book) {
        this.book = book;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }
    private int quantity;

    public Cart(Book book, int quantity) {
        this.book = book;
        this.quantity = quantity;
    }

    
    public int getQuantity() {
        return quantity;
    }

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
}
    
   

